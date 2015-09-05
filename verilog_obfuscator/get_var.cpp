#include<get_var.h>;

void get_var(char* name, var_map* var_map_point, replace_map* replace_map_point)
{
	ifstream infile;
	char str[2010];
	memset(str, 0, sizeof(str));

	infile.open(name);
	if (!infile.is_open())
	{
		cout << "file do not exist!" << endl;
	}
	get_to_module_start(&infile);
	while (!infile.eof())
	{
		infile.get(str, 2000, 0x3b);
		infile.get(str[strlen(str)]);
		if (strlen(str) == 0)
			break;
		get_key_words(str, var_map_point, replace_map_point);
		memset(str, 0x00, sizeof(str));
	}
	infile.close();
	if (check_replace_name(replace_map_point))
		cout << "get var_name finished!" << endl;
	else
	{
		cout << "too many vars, generate replace names failed. Please increase the length of the repalce_name." << endl;
		while (1);
	}
}

int get_key_words(string s, var_map* var_map_point, replace_map* replace_map_point)
{
	int length = s.size();
	char* key_words[6];
	char* reg = "reg";
	char* wire = "wire";
	char* parameter = "parameter";
	char* input = "input";
	char* output = "output";
	char* module = "module";
	key_words[0] = reg;
	key_words[1] = wire;
	key_words[2] = parameter;
	key_words[3] = input;
	key_words[4] = output;
	key_words[5] = module;
	int position[6];

	for (int i = 0; i < 5; i++)
	{
		position[i] = s.find(key_words[i]);
	}
	for (int i = 0; i < 5; i++)
	{
		if (position[i] != -1)
		{
			bool is_error = true;			//default, error happens
			int end = position[i] + strlen(key_words[i]);
			if (position[i] == 0)			//key_word begin at the s[0]
			{
				if (is_separator(s[end]))		//a separator follows the key_word
					is_error = false;						//key_word is ture
			}
			else if (is_separator(s[position[i] - 1]))		//key_word begin in the middle of s
			{
				if (is_separator(s[end]))
					is_error = false;
			}
			if (is_error)
			{
				position[i] = -1;
				continue;					//if error happens, continue
			}

			//get the var name
			int var_begin = 0;
			int var_end = 0;
			int temp = end;
			while (!is_character(s[temp])) temp++;
			var_begin = temp;
			while (!is_separator(s[temp])) temp++;
			var_end = temp;

			string varname = s.substr(var_begin, var_end - var_begin);
			string replace_name;

			while (1)
			{
				int varname_repeat_flag = 0;
				int replace_name_repeat_flag = 0;
				//rand replace_name
				if (i != 3 && i != 4)
				{
					rand_str(&replace_name);
//					replace_name = varname + "_edited";	//for test
				}
				else
					replace_name = varname;

				//travel through the map to find if replace_name or var_name is repeated
				replace_map::iterator itr1 = replace_map_point->begin();
				for (; itr1 != replace_map_point->end(); ++itr1)
				{
					if (itr1->first == varname)		//if the varname has appeared before
						varname_repeat_flag = 1;
//					else if (itr1->second == replace_name)	//if the replace name is repeated
//						replace_name_repeat_flag = 1;
				}

				if (varname_repeat_flag)
					break;
				else if (replace_name_repeat_flag)
					continue;
				else
				{
					var_map_point->insert(var_map::value_type(varname, i));
					replace_map_point->insert(replace_map::value_type(varname, replace_name));
					cout << var_map_point->size() << endl;
//					if (replace_name.size() != 20 && i != 3 && i != 4)
//						cout << "error!" << endl;
				}
			}
		}
	}
	return 0;
}

void get_to_module_start(ifstream* in)
{
	char temp[128];
	char ch;
	while (1)
	{
		in->get(temp, 127, 'm');
		ch = in->get();
		ch = in->get();
		if (ch == 'o' && !in->eof())
		{
			ch = in->get();
			if (ch == 'd' && !in->eof())
			{
				ch = in->get();
				if (ch == 'u' && !in->eof())
				{
					ch = in->get();
					if (ch == 'l' && !in->eof())
					{
						ch = in->get();
						if (ch == 'e' && !in->eof())
						{
							ch = in->get();
							if (ch == ' ' || ch == '\n')
								break;
						}
					}
				}
			}
		}
		else if (ch == ' ')
			if (in->eof())
				break;
			else
				continue;
	}
}

bool is_character(char str)
{
	if ((str >= 'a' && str <= 'z') || (str >= 'A' && str <= 'Z') || (str == '.'))
		return true;
	else
		return false;
}

bool is_separator(char str)
{
	char separator[] = "\t \n\r;[]=<>:,()!{}+-%?&|*";
	int size = sizeof(separator) - 1;
	for (int i = 0; i < size; i++)
	{
		if (str == separator[i])
			return true;
	}
//	if (str == '\t' || str == ' ' || str == '\n' || str == '\r' || str == ';' || str == '[' || str == '=' || str == '<' || str == '>' || str == ':' || str == ']' || str == ',' || str == '(' || str == ')')
//		return true;
//	else
		return false;
}

void output_var_txt(char* output_file_name, var_map* var_map_point, replace_map* replace_map_point)
{
	//output txt file
	ofstream out_var_file;
	out_var_file.open(output_file_name);
	if (!out_var_file.is_open())
	{
		cout << "output var_txt file open error!" << endl;
	}

	var_map::iterator itr1 = var_map_point->begin();
	replace_map::iterator itr2 = replace_map_point->begin();
	for (; itr1 != var_map_point->end(); ++itr1, ++itr2)
	{
		out_var_file << itr1->first << '\t';

		switch (itr1->second)
		{
		case 0:
			out_var_file << "reg" << '\t';
			break;
		case 1:
			out_var_file << "wire" << '\t';
			break;
		case 2:
			out_var_file << "parameter" << '\t';
			break;
		case 3:
			out_var_file << "input" << '\t';
			break;
		case 4:
			out_var_file << "output" << '\t';
			break;
		default:
			break;
		}

		out_var_file << itr2->second << endl;
	}
	out_var_file.close();
}

bool check_replace_name(replace_map* replace_map_point)
{
	replace_map::iterator itr1 = replace_map_point->begin();
	while(itr1 != replace_map_point->end())
	{
		int break_flag = 0;
		replace_map::iterator itr2 = replace_map_point->begin();
		for (; itr2->first != itr1->first && !break_flag; )
		{
			if (itr1->second == itr2->second)
			{
				string replace_name;
				string varname = itr1->first;
				rand_str(&replace_name);

				replace_map_point->erase(itr1);

				replace_map_point->insert(replace_map::value_type(varname, replace_name));

				itr1 = replace_map_point->find(varname);
				itr2 = replace_map_point->begin();
				continue;
			}
			else
				itr2++;
		}
		itr1++;
	}

	return true;
}
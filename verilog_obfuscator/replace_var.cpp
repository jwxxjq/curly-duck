#include<replace_var.h>
void replace_var(char* in, char* out, var_map* var_map_point, replace_map* replace_map_point)
{
	ifstream infile;
	ofstream outfile;

	char str[3010];
	memset(str, 0, sizeof(str));
	string s_out;

	infile.open(in);
	outfile.open(out);
	if (!infile.is_open() || !outfile.is_open())
	{
		cout << "open file error!" << endl;
	}

	while (!infile.eof())
	{
		infile.get(str, 3000, 0x3b);
		infile.get(str[strlen(str)]);
		if (str == "NMPS1<=0;")
		{
			cout << "find" << endl;
		}
		if (strlen(str) == 0)
		{
			break;
		}
		replace_key_words(str, &s_out, var_map_point, replace_map_point);
		outfile << s_out;
		memset(str, 0x00, sizeof(str));
	}
//	outfile << ";" << endl << "endmodule" << endl;
	infile.close();
	outfile.close();
}
void replace_key_words(string s, string* s_out, var_map* var_map_point, replace_map* replace_map_point)
{
	string temp;
	string_map stringmap;
	
	separate_string(s, &stringmap);

	string_map::iterator itr1 = stringmap.begin();

	//stream output to the words begin
	if (itr1 != stringmap.end())
		*s_out = s.substr(0, itr1->first);

	for (; itr1 != stringmap.end(); itr1++)
	{
		var_map::iterator it_find_1;
		replace_map::iterator it_find_2;
		it_find_1 = var_map_point->find(itr1->second);
		it_find_2 = replace_map_point->find(itr1->second);

		if (it_find_1 == var_map_point->end())
		{	//do not replace this word (itr1)
			string_map::iterator next = itr1;
			next++;
			if (next != stringmap.end())
				*s_out += s.substr(itr1->first, next->first - itr1->first);
			else
				*s_out += s.substr(itr1->first);
		}
		else if (it_find_1 != var_map_point->end() && (it_find_1->second == 3 || it_find_1->second == 4))
		{	//type is input or output, do not change
			string_map::iterator next = itr1;
			next++;
			if (next != stringmap.end())
				*s_out += s.substr(itr1->first, next->first - itr1->first);
			else
				*s_out += s.substr(itr1->first);
		}
		else
		{	//need to replace
			*s_out += it_find_2->second;	//output the replace_words

/*			if ((it_find_1->first + "_edited") != it_find_2->second)
			{
				cout << "error!" << endl;
			}
*/
			string_map::iterator next = itr1;
			next++;
			if (next != stringmap.end())
			{	//next exist
				int separator_begin = itr1->first + itr1->second.size();
				int separator_length = next->first - separator_begin;
				*s_out += s.substr(separator_begin, separator_length);
			}
			else
			{	//next do not exist, itr1 is the last words
				int separator_begin = itr1->first + itr1->second.size();
				*s_out += s.substr(separator_begin);
			}
		}
	}
	stringmap.clear();
}

void separate_string(string s_in, string_map* string_map_point)
{
	int length = s_in.size();
	for (int i = 0; i < length; i++)
	{
		if (is_separator(s_in[i]))
		{
			if (s_in[i] == ';' || is_character(s_in[i + 1]))		//';' is the end of s_in
			{
				i++;
				int begin = i;
				int end = 0;
				for (; i < length; i++)
				{
					if (is_separator(s_in[i]))
					{
						end = i;
						string temp = s_in.substr(begin, end - begin);
						string_map_point->insert(string_map::value_type(begin, temp));
						i--;
						break;
					}
				}

			}
			else
				continue;
		}
		else if (is_character(s_in[i]))
		{
			int begin = i;
			int end = 0;
			for (; i < length; i++)
			{
				if (is_separator(s_in[i]))
				{
					end = i;
					string temp = s_in.substr(begin, end - begin);
					string_map_point->insert(string_map::value_type(begin, temp));
					i--;
					break;
				}
			}
		}
	}
}
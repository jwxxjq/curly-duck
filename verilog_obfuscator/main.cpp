#pragma once
#include<fstream>
#include<iostream>
#include<inttypes.h>
#include<stdio.h>
#include<get_var.h>
#include<parameter.h>
#include<replace_var.h>

void main(int argc, char **argv)
{
	var_map var_map;
	replace_map replace_map;
//	string module_name = "system_top";
//	string module_name = "bpc";
	string module_name;
	if (argc > 1)
	{
		module_name = argv[1];
		int temp = module_name.size();
		if (module_name[temp - 1] == 'v' && module_name[temp-2] == '.')
		{
			module_name = module_name.substr(0, temp - 2);
		}
	}
	else
	{
		cout << "enter the module name:";
		cin >> module_name;
	}
	string	infile_name = module_name + ".v";
	string out_txt_file_name = module_name + "_var_name.txt";
	string out_file_name = module_name + "_edited.v";

	get_var((char*)(infile_name.data()), &var_map, &replace_map);
	output_var_txt((char*)(out_txt_file_name.data()), &var_map, &replace_map);
	cout << "file read and replace_var gen finished" << endl;
	replace_var((char*)(infile_name.data()), (char*)(out_file_name.data()), &var_map, &replace_map);
	var_map.clear();
	replace_map.clear();
}

#pragma once
#include<fstream>
#include<iostream>
#include<inttypes.h>
#include<stdio.h>
#include<iosfwd>
#include<string>
#include<parameter.h>
#include<map>
#include<rand_str.h>
using namespace std;
#pragma   warning(disable:4996)

void get_var(char*, var_map*, replace_map*);
int get_key_words(string s, var_map*, replace_map*);
void get_to_module_start(ifstream* in);
bool is_character(char str);
bool is_separator(char str);
void output_var_txt(char*, var_map*, replace_map*);
bool check_replace_name(replace_map*);
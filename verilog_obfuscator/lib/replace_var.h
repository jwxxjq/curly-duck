#pragma once
#include<fstream>
#include<iostream>
#include<inttypes.h>
#include<stdio.h>
#include<iosfwd>
#include<string>
#include<parameter.h>
#include<map>
#include<get_var.h>
using namespace std;
#pragma   warning(disable:4996)

void replace_var(char*, char*, var_map*, replace_map*);
void replace_key_words(string, string*, var_map*, replace_map*);
void separate_string(string, string_map*);
//void get_to_module_start(ifstream* in);
//bool is_character(char str);
//bool is_separator(char str);
//void output_var_txt(char*, var_map*, replace_map*);
#pragma once
class variable
{
public:
	variable();
	~variable();
private:
	char* name;
	int is_reserved;
public:
	variable(char* name);
};


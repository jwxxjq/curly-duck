#include<rand_str.h>

void rand_str(string* s)
{
//	srand((unsigned)time(NULL));
	char ch[str_length + 1] = { 0 };
	for (int i = 0; i < str_length; ++i)
	{
		int x = rand() / (RAND_MAX / (sizeof(CCH) - 1));
		if (x == 0x34)
			x -= 1;
		ch[i] = CCH[x];
	}
	*s = ch;
}
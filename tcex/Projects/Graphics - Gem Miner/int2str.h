#ifndef INT2STR_H_
#define INT2STR_H_

void inttostr(int num, char str[])
{
	char ch;
	int i = 0;
	int d = 0, rev = 0;
	while (num > 0)
	{
		d = num % 10;
		rev = rev * 10 + d;
		num /= 10;
		switch (d)
		{
		case 1:
			ch = '1';
			break;
		case 2:
			ch = '2';
			break;
		case 3:
			ch = '3';
			break;
		case 4:
			ch = '4';
			break;
		case 5:
			ch = '5';
			break;
		case 6:
			ch = '6';
			break;
		case 7:
			ch = '7';
			break;
		case 8:
			ch = '8';
			break;
		case 9:
			ch = '9';
			break;
		case 0:
			ch = '0';
			break;
		}
		str[i] = ch;
		str[i + 1] = '\0';
		i++;
	}
	strrev(str);
}

#endif

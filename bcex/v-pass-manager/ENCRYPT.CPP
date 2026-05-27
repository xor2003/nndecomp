int getkey(void)
{
	fstream fptr;
	fptr.open("KEYFILE.VPD", ios::in | ios::out | ios::app | ios::ate);
	fptr.seekg(0);

	char num[3] = {0};
	int i = 0;
	fptr.getline(num, 3);
	i = atoi(num);
	fptr.close();
	return i;
}

void putkey(void)
{
	fstream fptr;
	fptr.open("KEYFILE.VPD", ios::in | ios::out | ios::trunc);
	fptr.seekg(0);
	randomize();
	int i = random(100);
	char num[3];
	int dec, sign;
	strcpy(num, ecvt(i, 2, &dec, &sign));
	fptr.write(num, 3);
	fptr.close();
}

void encryption(int method, int key = getkey())
{
	fstream fptr;

	fptr.open("USERNAME.VPD", ios::in | ios::out | ios::ate | ios::app);
	fptr.seekg(0);
	fptr.seekp(0);

	char c;
	char data[100];
	int i = 0, n = 0;
	while (fptr.eof() == 0)
	{
		fptr.get(c);
		data[i++] = c;
	}
	data[i] = '\0';
	fptr.close();

	fptr.open("USERNAME.VPD", ios::in | ios::out | ios::trunc);
	fptr.seekg(0);
	fptr.seekp(0);

	while (n < i - 1)
	{
		if (method)
			fptr.put(data[n] + key);
		else
			fptr.put(data[n] - key);
		n++;
	}
	fptr.close();
}

int authUSER(char user[])
{
	encryption(0);
	fstream fptr;
	fptr.open("USERNAME.VPD", ios::in | ios::out | ios::ate | ios::app);
	fptr.seekg(0);

	char string[20];
	int check[20] = {0};
	int n = 0;

	while (fptr.eof() == 0)
	{
		fptr >> string;

		if (strncmp(string, user, strlen(user)) == 0)
		{
			check[n] = 1;
			n++;
		}
		else
		{
			n++;
		}
	}
	putkey();
	fptr.close();
	encryption(1);
	for (int i = 0; i < n; i++)
	{
		if (check[i] == 1)
			return 1;
	}
	return 0;
}

int addUser(char user[])
{
	int i = authUSER(user);
	if (!i)
	{
		encryption(0);
		fstream fptr;
		fptr.open("USERNAME.VPD", ios::in | ios::out | ios::app);
		fptr.put('\n');
		fptr.write(user, strlen(user));
		fptr.close();
		putkey();
		encryption(1);
		return 1;
	}
	else
		return 0;
}

int AUTHORIZE(char user[], char pass[])
{
	fstream Uptr, Pptr;
	Uptr.open("USERNAME.VPD", ios::in | ios::out | ios::ate | ios::app);
	Pptr.open("PASSWORD.VPD", ios::in | ios::out | ios::ate);
	Uptr.seekg(0);
	Pptr.seekg(0);

	char USER[20], PASS[20];
	int check[20] = {0};
	int n = 0, i = 0;

	while (Uptr.eof() == 0)
	{
		Uptr >> USER; //cout<<USER<<"."<<endl;
		Pptr >> PASS; //cout<<PASS<<"."<<endl;

		if (strcmp(USER, user) == 0)
		{
			check[n] = 1;
			n++;
			if (strlen(PASS) == strlen(pass))
			{
				if (strncmp(PASS, pass, strlen(pass)) == 0)
					i = 1;
			}
			else
			{
				if (strcmp(PASS, pass) == 0)
					i = 1;
			}
		}
		else
		{
			n++;
		}
	}

	Uptr.close();
	Pptr.close();

	if (i)
		return 1;
	else
	{
		for (int i = 0; i < n; i++)
		{
			if (check[i] == 1)
				return 2;
		}
		return 0;
	}
}
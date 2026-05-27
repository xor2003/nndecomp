bool Initialize(Progdata progdata)
{
	paperroute[0] = 69;
	paperroute[1] = 64;
	paperroute[2] = 63;
	paperroute[3] = 62;
	paperroute[4] = 67;
	paperroute[5] = 66;

	return (SetRooms(progdata.rooms)
		&&	SetLivings(progdata.living)
		&&	SetItems(progdata.items));

}

bool SetRooms(Rooms *rooms)
{
	for (i = 0; i < 80; i++)
	{
		rooms[i].name = roomnames[i];
		rooms[i].descript = roomdesc[i];
		rooms[i].connect[EAST] = i + 1;
		rooms[i].connect[WEST] = i - 1;
		rooms[i].connect[NORTH] = i - 5;
		rooms[i].connect[SOUTH] = i + 5;
		rooms[i].connect[UP] = rooms[i].connect[DOWN] = -1;
	}

	// Seperate layers
	for (i = 0; i < 80; i += 20)
	{
		for (j = 0; j < 16; j += 5)
		{
			rooms[i + j + 4].connect[EAST] = -1;
			rooms[i + j].connect[WEST] = -1;
		}
		for (j = 0; j < 5; j++)
		{
			rooms[i + j].connect[NORTH] = -1;
			rooms[i + j + 15].connect[SOUTH] = -1;
		}
	}
	// Connect layers
	for (i = 0; i < 15; i++)
		rooms[levelcon[i][0]].connect[levelcon[i][1]] = levelcon[i][2];
	// Blocked routes
	for (i = 0; i < 68; i++)
		rooms[blocked[i][0]].connect[blocked[i][1]] = -1;

	return true;
}

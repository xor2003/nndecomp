class mouse
{
		REGS regs;
		int no_buttons;
	public: int cx,cy,q;

		void get_status();
		void init_mouse()
		{
			regs.x.ax=0;
			int86(0x33,&regs,&regs);
			if(regs.x.ax==0xfff)no_buttons=regs.x.bx;
		}
		void show_mouse()
		{
			regs.x.ax=0x01;
			int86(0x33,&regs,&regs);
		}
		void hide_mouse()
		{
			regs.x.ax=0x02;
			int86(0x33,&regs,&regs);
		}
}mouse;
void mouse::get_status()
{
	regs.x.ax=0x03;
	int86(0x33,&regs,&regs);
	while(q!=1)
	{
		regs.x.ax=0x03;
		int86(0x33,&regs,&regs);
		q=regs.x.bx;
		cx=regs.x.cx;
		cy=regs.x.dx;
	}
	q=0;
}


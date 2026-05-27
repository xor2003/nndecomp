#ifndef AAAG_H_
#define AAAG_H_

void ag(int ax, int ay, int r = 40)
{
	setlinestyle(0, 0, 3);
	ellipse(ax - r + (r / 8), ay - r, 250, 10, r / 2 * 3, r / 3 * 2);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3, r / 4);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3 - (r / 9),
			r / 4 - (r / 8));
	ellipse(ax - r + (r / 8) + (r / 5) + (r / 8), ay - r, 0, 210,
			r / 3 + (r / 9), r / 2);
	circle(ax - (r / 3) + (r / 6), ay - r, r / 12);
	line(ax - (r * 5 / 3) + (r / 10) + (r / 6),
		 ay - (r / 6) - (r / 8) - (r / 10), ax - r + (r / 8),
		 ay - r + (r / 8));
	line(ax - (r / 3) + (r / 6), ay - r, ax + (r / 3) + (r / 6) + (r / 8),
		 ay - r - (r / 8));
	ellipse(ax, ay, 160, 310, r - (r / 4), r);
	ellipse(ax + (r / 8), ay - (r / 8), 165, 310, r - (r / 4), r);
	line(ax + (r / 3), ay - (r / 8), ax + (r / 3), ay + r);
	line(ax + (r / 3) + (r / 8), ay - (r / 8), ax + (r / 3) + (r / 8), ay + r);
}

void aa(int ax, int ay, int r = 40)
{
	setlinestyle(0, 0, 3);
	line(ax - (r / 8), ay - (r / 2) + (r / 11), ax - (r / 4 * 3),
		 ay + (r / 4 * 3));
	line(ax - (r / 8) - (r / 8), ay - (r / 2) + (r / 11),
		 ax - (r / 4 * 3) - (r / 8), ay + (r / 4 * 3));
	line(ax, ay - (r / 2), ax + (r / 4 * 3) - (r / 8), ay + (r / 4 * 3));
	line(ax + (r / 4 * 3) - (r / 8), ay + (r / 4 * 3), ax + r - (r / 8),
		 ay + (r / 4 * 3));
	line(ax - (r / 4 * 3), ay + (r / 4 * 3), ax - r, ay + (r / 4 * 3));
	line(ax - (r / 2), ay + (r / 4), ax + (r / 3) + (r / 12), ay + (r / 4));
	ellipse(ax - r + (r / 8), ay - r, 250, 10, r / 2 * 3, r / 3 * 2);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3, r / 4);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3 - (r / 9),
			r / 4 - (r / 8));
	ellipse(ax - r + (r / 8) + (r / 5) + (r / 8), ay - r, 0, 210,
			r / 3 + (r / 9), r / 2);
	circle(ax - (r / 3) + (r / 6), ay - r, r / 12);
	line(ax - (r * 5 / 3) + (r / 10) + (r / 6),
		 ay - (r / 6) - (r / 8) - (r / 10), ax - r + (r / 8),
		 ay - r + (r / 8));
	line(ax - (r / 3) + (r / 6), ay - r, ax + (r / 3) + (r / 6) + (r / 8),
		 ay - r - (r / 8));
}

#endif

#include "INCLUDE.CPP"

void main()
{
int returns;

returns=pmain();
if(returns==0)
	goto exit;


returns=menu();
if(returns==13)
	goto vexit;
if(returns==5)
	goto exit;

clrscr();

uname();

exit:
cradit();

vexit:
}
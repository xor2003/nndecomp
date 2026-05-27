#ifndef GRAPH_H_
#define GRAPH_H_

#include "gourav.h"
#include "locator.h"

#define MAXNODES 8
#define INFINITE 999;
#define TRUE 1
#define FALSE 0

class node;
class arc;
class graph;

struct node
{
	/* info related to each node*/
	int totalarc;
};

struct arc
{
	/*info related to each arc*/
	int weight;
};

class graph
{
public:
	void initgraph();
	graph();
	void join(int node1, int node2, int weight);
	void remv(int node1, int node2);
	int weight(int node1, int node2);
	int adj[MAXNODES][MAXNODES];
	struct node nodes[MAXNODES];
	struct arc arcs[MAXNODES][MAXNODES];
} map1;

void graph::initgraph()
{
}

void graph::graph()
{
	for (int i = 0; i < MAXNODES; i++)
		for (int j = 0; j < MAXNODES; j++)
		{
			adj[i][j] = FALSE;
			nodes[i].totalarc = 0;
			arcs[i][j].weight = INFINITE;
		}
}

void graph::join(int node1, int node2, int weight)
{
	adj[node1][node2] = TRUE;
	adj[node2][node1] = TRUE;
	arcs[node1][node2].weight = weight;
	arcs[node2][node1].weight = weight;
	nodes[node1].totalarc++;
	nodes[node2].totalarc++;
}

void graph::remv(int node1, int node2)
{
	adj[node1][node2] = FALSE;
	adj[node2][node1] = FALSE;
	arcs[node1][node2].weight = INFINITE;
	arcs[node2][node1].weight = INFINITE;
	nodes[node1].totalarc--;
	nodes[node2].totalarc--;
}

int graph::weight(int node1, int node2)
{
	if (adj[node1][node2] == TRUE)
	{
		int n;
		n = arcs[node1][node2].weight;
		return n;
	}
	else
	{
		return INFINITE;
	}
}

#endif

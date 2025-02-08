#include <iostream>
#include <string>

using namespace std;

#ifndef Item_H
#define Item_H
class Item
{
public:
	Item(int, string, string, string, int, string, char);
	const int level_required;
	const string name;
	const string effect;
	const string description;
	const int weight;
	const string type;
	const char identification;

private:

};

#endif
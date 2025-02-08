#include <iostream>
#include <string>
#include "Item.h"

using namespace std;

#ifndef consumableItem_H
#define consumableItem_H
class consumableItem : public Item
{
public:
	consumableItem(int, string, string, string, int, string, int, char);
	const int effect;

private:

};

#endif
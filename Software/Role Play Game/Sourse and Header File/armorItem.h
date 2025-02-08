#include <iostream>
#include <string>
#include "Item.h"

using namespace std;

#ifndef armorItem_H
#define armorItem_H
class armorItem : public Item
{
public:
	armorItem(int, string, string, string, int, string, int, char);
	const int defense_increament;

private:

};

#endif
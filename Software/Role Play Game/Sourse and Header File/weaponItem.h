#include <iostream>
#include <string>
#include "Item.h"

using namespace std;

#ifndef weaponItem_H
#define weaponItem_H
class weaponItem : public Item
{
public:
	weaponItem(int, string, string, string, int, string, int, char);
	const int attack_increament;

private:

};

#endif
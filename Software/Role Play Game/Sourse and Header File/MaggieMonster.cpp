#include "MaggieMonster.h"

MaggieMonster::MaggieMonster(string _name, int _atk, int _def, int _exp, int _money, int _max_hp, int _max_mp)
	: BaseMonster(_name, _atk, _def, _exp, _money, _max_hp, _max_mp)
{
	;
}

MaggieMonster::~MaggieMonster()
{
	;
}

string MaggieMonster::serialize(void)
{
	return string();
}

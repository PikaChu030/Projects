#include "BaseMonster.h"

int BaseMonster::count = 0;

BaseMonster::BaseMonster(string _name, int _attack, int _defense, int _exp, int _money, int _max_hp, int _max_mp)
	:name(_name), attack(_attack), defense(_defense), exp(_exp), money(_money), max_hp(_max_hp), max_mp(_max_mp)
{
	setHp(max_hp);
	setMp(max_mp);
	count++;
}

BaseMonster::~BaseMonster()
{
	count--;
}

void BaseMonster::setHp(int input)
{
	if (input <= max_hp && input > 0)
	{
		hp = input;
	}
	else if (input <= 0)
	{
		hp = 0;
	}
	else if (input > max_hp)
	{
		hp = max_hp;
	}
}

int BaseMonster::getHp() const
{
	return hp;
}

void BaseMonster::setMp(int input)
{
	if (input <= max_mp && input > 0)
	{
		mp = input;
	}
	else if (input <= 0)
	{
		mp = 0;
	}
	else if (input > max_mp)
	{
		mp = max_hp;
	}
}

int BaseMonster::getMp() const
{
	return mp;
}

int BaseMonster::getInstanceCount()
{
	return count;
}

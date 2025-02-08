#include <iostream>
#include <string>
#include <cmath>
#include <sstream>
#include <typeinfo>

using namespace std;

#ifndef BaseMonster_H
#define BaseMonster_H
class BaseMonster
{
public:
	BaseMonster(string, int, int, int, int, int, int);
	~BaseMonster();

	void setHp(int);
	int getHp() const;
	void setMp(int);
	int getMp() const;
	static int getInstanceCount();

	virtual string serialize() = 0;

	const string name;
	const int attack;
	const int defense;
	const int exp;
	const int money;
	const int max_hp;
	const int max_mp;

private:
	int hp;
	int mp;
	static int count;
};

#endif // !BaseMonster_H

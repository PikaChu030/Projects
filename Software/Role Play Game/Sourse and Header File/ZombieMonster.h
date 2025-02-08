#include "BaseMonster.h"

#ifndef ZombieMonster_H
#define ZombieMonster_H
class ZombieMonster : public BaseMonster
{
public:
	ZombieMonster(string = "Zombie", int = 50, int = 65, int = 17, int = 65, int = 150, int = 30);
	~ZombieMonster();
	virtual string serialize();
	static BaseMonster* unserialize(string);

private:
	static int Zombiecount;
};
#endif
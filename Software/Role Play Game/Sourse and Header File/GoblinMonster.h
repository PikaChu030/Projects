#include "BaseMonster.h"

#ifndef GoblinMonster_H
#define GoblinMonster_H
class GoblinMonster : public BaseMonster
{
public:
	GoblinMonster(string = "Goblin", int = 60, int = 40, int = 12, int = 30, int = 100, int = 50);
	~GoblinMonster();
	virtual string serialize();
	static BaseMonster* unserialize(string);
private:
	static int Goblincount;
};
#endif
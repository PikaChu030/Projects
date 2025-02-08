#include "BaseMonster.h"

#ifndef JWMonster_H
#define JWMonster_H
class JWMonster : public BaseMonster
{
public:
	JWMonster(string = "Jen_Wei_Haung", int = 150, int = 80, int = 200, int = 1000, int = 5000, int = 500);
	~JWMonster();
	virtual string serialize();
	static BaseMonster* unserialize(string);

private:
	static int JWcount;
};
#endif
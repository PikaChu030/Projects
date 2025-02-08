#include <iostream>
#include <string>
#include <cmath>
#include "NovicePlayer.h"

#ifndef MagicianPlayer_H
#define MagicianPlayer_H

class MagicianPlayer :public NovicePlayer
{
public:
	MagicianPlayer();
	MagicianPlayer(int);
	MagicianPlayer(int, string);
	MagicianPlayer(const MagicianPlayer &);

	virtual string serialize();
	static NovicePlayer* unserialize(string);

	virtual void setLevel(int);
	virtual void specialSkill();

	void initialize(void);
protected:
	void level_up();
	int original_defense;
};

#endif
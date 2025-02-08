#include <iostream>
#include <string>
#include <cmath>
#include "NovicePlayer.h"

#ifndef KnightPlayer_H
#define KnightPlayer_H

class KnightPlayer : public NovicePlayer
{
public:
	KnightPlayer();
	KnightPlayer(int);
	KnightPlayer(int, string);
	KnightPlayer(const KnightPlayer &);

	virtual string serialize();
	static NovicePlayer* unserialize(string);

	virtual void setLevel(int);
	virtual void specialSkill();
protected:
	void level_up();
};

#endif // !KnightPlayer_H
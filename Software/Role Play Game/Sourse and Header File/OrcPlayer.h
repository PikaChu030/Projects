#include <iostream>
#include <string>
#include <cmath>
#include "NovicePlayer.h"

#ifndef OrcPlayer_H
#define OrcPlayer_H

class OrcPlayer : public NovicePlayer
{
public:
	OrcPlayer();
	OrcPlayer(int);
	OrcPlayer(int, string);
	OrcPlayer(const OrcPlayer &);

	virtual string serialize();
	static NovicePlayer* unserialize(string);

	virtual void setLevel(int);
	virtual void specialSkill();
protected:
	void level_up();
	
};

#endif // !OrcPlayer_H
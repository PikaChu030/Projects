#include "NovicePlayer.h"
#include <string>
#include <cmath>

#ifndef BoxerPlayer_H
#define BoxerPlayer_H
class BoxerPlayer : public NovicePlayer
{
public:
	BoxerPlayer();
	BoxerPlayer(int);
	BoxerPlayer(int, string);
	BoxerPlayer(const BoxerPlayer &);

	virtual string serialize();
	static NovicePlayer* unserialize(string);

	virtual void setLevel(int);
	virtual void specialSkill();

	void initialize(void);
private:
	void level_up();
	int oroginal_attack;
};
#endif
#include "Event.h"
#include "NovicePlayer.h"
#include "KnightPlayer.h"
#include "OrcPlayer.h"
#include "MagicianPlayer.h"
#include "BoxerPlayer.h"
#include "Battle.h"

using namespace std;

#ifndef BoseEvent_H
#define BoseEvent_H
class BoseEvent : public Event
{
public:
	BoseEvent(vector<NovicePlayer*>);
	virtual void launch(void);

	bool Win(void);
private:
	void story(void);
	NovicePlayer** player_data;
	BaseMonster* monster_list[1];
	int player_data_size;
	Battle* battle;
};
#endif
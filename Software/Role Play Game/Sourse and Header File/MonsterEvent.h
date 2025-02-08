#include "Battle.h"
#include "NovicePlayer.h"
#include "KnightPlayer.h"
#include "OrcPlayer.h"
#include "MagicianPlayer.h"
#include "BoxerPlayer.h"
#include "Event.h"

using namespace std;

#ifndef MonsterEvent_H
#define MonsterEvent_H
class MonsterEvent : public Event
{
public:
	MonsterEvent(vector<NovicePlayer*>);
	virtual void launch(void);
private:
	NovicePlayer** player_data;
	int player_data_size;
};
#endif
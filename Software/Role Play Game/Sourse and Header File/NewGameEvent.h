#include "Event.h"
#include "NovicePlayer.h"
#include "Item.h"
#include "lifePotion.h"
#include "magicPotion.h"
#include "shieldItem.h"
#include "swordItem.h"

#include <windows.h>

using namespace std;

#ifndef NewGameEvent_H
#define NewGameEvent_H
class NewGameEvent : public Event
{
public:
	NewGameEvent();
	virtual void launch(void);

private:

};
#endif

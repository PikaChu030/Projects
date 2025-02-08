#include <cstdlib>
#include <ctime>
#include "Event.h"
#include "lifePotion.h"
#include "magicPotion.h"

using namespace std;

#ifndef giftEvent_H
#define giftEvent_H
class giftEvent : public Event
{
public:
	giftEvent();
	virtual void launch(void);

private:
	int gift_type;
	Item* gift;
};
#endif
#include "Event.h"
#include <windows.h>

#ifndef LoseEvent_H
#define LoseEvent_H
class LoseEvent : public Event
{
public:
	virtual void launch(void);
private:

};
#endif
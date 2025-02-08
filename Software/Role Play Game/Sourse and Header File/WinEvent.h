#include "Event.h"
#include <windows.h>

#ifndef WinEvent_H
#define WinEvent_H
class WinEvent : public Event
{
public:
	virtual void launch(void);
private:

};
#endif
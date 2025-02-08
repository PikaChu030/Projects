#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

#ifndef Event_H
#define Event_H
class Event
{
public:
	Event();
	virtual void launch(void) = 0;

private:

};
#endif
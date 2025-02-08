#include "BaseMonster.h"

#ifndef MaggieMonster_H
#define MaggieMonster_H
class MaggieMonster : public BaseMonster
{
public:
	MaggieMonster(string = "±Æ²y©Ç", int = 20, int = 45, int = 40, int = 60, int = 80, int = 30);
	~MaggieMonster();

	virtual string serialize(void);
private:

};
#endif
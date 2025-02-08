#include "Menu.h"
#include "NovicePlayer.h"
#include "Field.h"

#include <conio.h>
#include <windows.h>
#include <fstream>
#include <string>
#include <sstream>
#include <regex>

using namespace std;

#ifndef FieldMenu_H
#define FieldMenu_H
class FieldMenu : public Menu
{
public:
	FieldMenu(Field*, vector<NovicePlayer*>);
	virtual void decide(void);
	virtual void display(void);

	void escape(void);
	void equipment(void);
	void displayEquipment(void);
	void save(vector<NovicePlayer*>, Field*);
	char getPressKey(void);

private:
	void setEquipment();
	Field* current_field;
	vector<NovicePlayer*> player_list;
	char pressed_key;
};
#endif
#include "Menu.h"
#include "NovicePlayer.h"
#include "KnightPlayer.h"
#include "MagicianPlayer.h"
#include "OrcPlayer.h"
#include "BoxerPlayer.h"
#include "Field.h"

#include "armorItem.h"
#include "axeItem.h"
#include "Item.h"
#include "lifePotion.h"
#include "magicPotion.h"
#include "shieldItem.h"
#include "swordItem.h"
#include "tunicItem.h"
#include "weaponItem.h"

#include "NewGameEvent.h"

#include <fstream>

#ifndef MainMenu_H
#define MainMenu_H
class MainMenu : public Menu
{
public:
	MainMenu();
	virtual void display(void);
	virtual void decide(void);
	void select(int);

	vector<NovicePlayer*> getGeneratedPlayer();
	int getPositionX(void);
	int getPositionY(void);
	int getMapIndex(void);
	int getOptionInt(void);
private:
	void option1(void);
	void option2(void);
	void option3(void);
	vector<NovicePlayer*> generatePlayer;
	int position_x, position_y, map_index;
	int option_int;
};
#endif
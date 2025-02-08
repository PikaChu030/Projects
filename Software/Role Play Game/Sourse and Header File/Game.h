#include "BaseMonster.h"
#include "GoblinMonster.h"
#include "JWMonster.h"
#include "ZombieMonster.h"

#include "Battle.h"
#include "Field.h"

#include "Menu.h"
#include "FieldMenu.h"
#include "MainMenu.h"

#include "Event.h"
#include "BoseEvent.h"
#include "giftEvent.h"
#include "MonsterEvent.h"
#include "WinEvent.h"
#include "LoseEvent.h"

#include "axeItem.h"
#include "swordItem.h"
#include "shieldItem.h"
#include "tunicItem.h"
#include "magicpotion.h"
#include "lifepotion.h"

#include "NovicePlayer.h"
#include "MagicianPlayer.h"
#include "KnightPlayer.h"
#include "OrcPlayer.h"

#include <iostream>
#include <vector>
#include <ctime>
#include <cstdlib>

#ifndef Game_H
#define Game_H
class Game
{
public:
	Game();
	void run(void);

private:
	void check_and_launch(void);
	void next_map(void);
	void previous_map(void);
	void continue_game(void);
	void getPartner(void);
	void checkWin(void);
	vector<NovicePlayer*> player_list;
	vector<Field*> field_list;
	int current_field_index;
	FieldMenu* field_menu;
	MainMenu* main_menu;
	Event* temp_event = nullptr;

	vector<NovicePlayer*> generatePlayer;
	int position_x, position_y, map_index;
};
#endif
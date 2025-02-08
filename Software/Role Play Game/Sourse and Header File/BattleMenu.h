#include "NovicePlayer.h"
#include "BaseMonster.h"
#include "Menu.h"
#include <conio.h>
#include <string>
#include <sstream>
#include <regex>

using namespace std;

#ifndef BattleMenu_H
#define BattleMenu_H
class BattleMenu : public Menu
{
public:
	BattleMenu(NovicePlayer**, int, BaseMonster**, int, int);

	void display_status(void);
	virtual void display(void);
	virtual void decide(void);

	void player_select_monster(int);
	void player_use_item(int);

	BaseMonster* get_select_monster(void);
	int get_acting_player(void);
	int get_select_monster_index(void);
	int get_select_option(void);

	void initialize(int);
	void reselect_attack_target(void);

private:
	void option1(void);
	void option2(void);
	void option3(void);

	NovicePlayer** player_in_battle;
	BaseMonster** monster_in_battle;
	int player_list_size;
	int monster_list_size;
	int acting_player;

	BaseMonster* select_monster;
	int select_monster_index;
	int select_option;

};
#endif
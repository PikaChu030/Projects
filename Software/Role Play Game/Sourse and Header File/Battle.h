#include "KnightPlayer.h"
#include "MagicianPlayer.h"
#include "NovicePlayer.h"
#include "OrcPlayer.h"
#include "BaseMonster.h"
#include "GoblinMonster.h"
#include "JWMonster.h"
#include "ZombieMonster.h"
#include "MaggieMonster.h"
#include "BattleMenu.h"

#include <iostream>
#include <conio.h>
#include <ctime>
#include <cstdlib>
#include <cmath>
#include <windows.h>

using namespace std;

#ifndef Character_STRUCT
#define Character_STRUCT
struct character
{
	char type;
	bool alive;
	void* instance;
};
#endif

#ifndef Battle_H
#define Battle_H
class Battle
{
public:
	//Constructor Type A
	Battle(NovicePlayer**, BaseMonster**, int, int ,int);//With limit on number of turns(fifth parameter limits its)
	Battle(NovicePlayer**, BaseMonster**, int, int);//Without limit on number of turns
	
	//Constructor Type B
	Battle(NovicePlayer**, int, int);////With limit on number of turns(fifth parameter limits its)
	Battle(NovicePlayer**, int);//Without limit on number of turns

	bool nextActor();
	int getTurnCount() const;
	int getTurnLimit() const;

	int getPlayerCount(void) const;
	int getPlayerCount(bool) const;

	int getMonsterCount(void) const;
	int getMonsterCount(bool) const;

	character getCurrentActor();
	character* getPlayers();
	character* getMonsters();

	void start_battle();//If you want to battle remember to call this function and the players and monsters will battle till the end


private:
	void display_action_list(void);

	int n_turns;
	int limit_turns;
	int nth_character, character_count;
	int _playerNumber, _monsterNumber;
	int _alivePlayer, _aliveMonster;
	int action_list_size;
	character current_actor;
	character* action_list;

	NovicePlayer* temp_player;
	BaseMonster* temp_monster;

	BattleMenu* mymenu;
};
#endif
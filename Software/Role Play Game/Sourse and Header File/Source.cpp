#include "swordItem.h"
#include "axeItem.h"
#include "tunicItem.h"
#include "shieldItem.h"
#include "magicPotion.h"
#include "lifePotion.h"

#include "NovicePlayer.h"
#include "OrcPlayer.h"
#include "KnightPlayer.h"
#include "MagicianPlayer.h"

#include "BaseMonster.h"
#include "GoblinMonster.h"
#include "JWMonster.h"
#include "ZombieMonster.h"

#include "Battle.h"
#include "Field.h"

#include "MonsterEvent.h"

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <ctime>
#include <string>
#include <sstream>
#include <regex>
#include <conio.h>
#include <windows.h>

#include "NewGameEvent.h"

#include "MainMenu.h"
#include "Game.h"

using namespace std;

int main(void)
{
	Game rpg;
	rpg.run();
}
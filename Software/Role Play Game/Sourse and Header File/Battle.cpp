#include "Battle.h"

Battle::Battle(NovicePlayer ** player_list, BaseMonster ** monster_list, int player_number, int monster_number, int turn_limit)
{
	action_list = new character[player_number + monster_number];
	for (int i = 0; i < player_number; i++)
	{
		action_list[i].alive = true;
		action_list[i].instance = player_list[i];
		action_list[i].type = 'p';
	}
	for (int i = 0; i < monster_number; i++)
	{
		action_list[player_number + i].alive = true;
		action_list[player_number + i].instance = monster_list[i];
		action_list[player_number + i].type = 'm';
	}

	n_turns = 1;
	limit_turns = turn_limit;
	nth_character = 0;
	character_count = 0;
	_playerNumber = player_number;
	_monsterNumber = monster_number;
	current_actor = action_list[0];
	_alivePlayer = _playerNumber;
	_aliveMonster = _monsterNumber;
	action_list_size = player_number + monster_number;
	
	//setup BattleMenu
	mymenu = new BattleMenu(player_list, 0, monster_list, player_number, monster_number);
}

Battle::Battle(NovicePlayer ** player_list, BaseMonster ** monster_list, int player_number, int monster_number)
	:Battle(player_list, monster_list, player_number, monster_number, 0)
{
	;
}

Battle::Battle(NovicePlayer ** player_list, int player_number, int turn_limit)
{
	//decide how many monster(the number of monster will inscrease according to the level of player)
	int total_level = 0;
	for (int i = 0; i < player_number; i++)
	{
		total_level += player_list[i]->getLevel();
	}
	
	int monster_number =  2 + floor(log2(sqrt(total_level)));//the monster will increase by 1 every 12 total level
	
	BaseMonster** monster_list;
	monster_list = new BaseMonster*[monster_number];
	srand(time(NULL));
	for (int i = 0; i < monster_number; i++)
	{
		switch (rand() % 5)
		{
		case 0:
			monster_list[i] = new GoblinMonster();
			break;
		case 1:
			monster_list[i] = new ZombieMonster();
			break;
		case 2://A little bit stronger Golblin
			if (monster_number >= 3)
			{
				monster_list[i] = new GoblinMonster("Goblin Leader", 60, 60, 20, 50, 250, 75);
			}
			else
			{
				i--;
				continue;
			}
			break;
		case 3:
			if (monster_number >= 3)
			{
				monster_list[i] = new ZombieMonster("Giant Zombie", 60, 75, 30, 80, 175, 50);
			}
			else 
			{
				i--;
				continue;
			}
			break;
		case 4:
			monster_list[i] = new MaggieMonster();
		}
	}

	action_list = new character[player_number * monster_number];
	for (int i = 0; i < player_number; i++)
	{
		action_list[i].alive = true;
		action_list[i].instance = player_list[i];
		action_list[i].type = 'p';
	}
	for (int i = 0; i < monster_number; i++)
	{
		action_list[player_number + i].alive = true;
		action_list[player_number + i].instance = monster_list[i];
		action_list[player_number + i].type = 'm';
	}

	n_turns = 1;
	limit_turns = turn_limit;
	nth_character = 0;
	character_count = 0;
	_playerNumber = player_number;
	_monsterNumber = monster_number;
	_alivePlayer = _playerNumber;
	_aliveMonster = _monsterNumber;
	current_actor = action_list[0];
	action_list_size = player_number + monster_number;

	//Construct Battle Menu
	mymenu = new BattleMenu(player_list, 0, monster_list, player_number, monster_number);
}

Battle::Battle(NovicePlayer ** player_list, int player_number)
	:Battle(player_list, player_number, 0)
{
	;
}

bool Battle::nextActor()
{
	while (1)
	{
		nth_character++;
		if (action_list[nth_character % (_playerNumber + _monsterNumber)].alive)
		{
			current_actor = action_list[nth_character % (_playerNumber + _monsterNumber)];
			character_count++;
			break;
		}
	}

	if (nth_character % (_playerNumber + _monsterNumber) == 0)
	{
		n_turns++;
	}

	if (n_turns <= limit_turns || limit_turns == 0)
	{
		return false;
	}
	else
	{
		return true;
	}
}

int Battle::getTurnCount() const
{
	return n_turns;
}

int Battle::getTurnLimit() const
{
	return limit_turns;
}

int Battle::getPlayerCount(void) const
{
	return _playerNumber;
}

int Battle::getPlayerCount(bool input) const
{
	if (input)
	{
		return _alivePlayer;
	}
	else
	{
		return _playerNumber - _alivePlayer;
	}
}

int Battle::getMonsterCount(void) const
{
	return _monsterNumber;
}

int Battle::getMonsterCount(bool input) const
{
	if (input)
	{
		return _aliveMonster;
	}
	else
	{
		return _monsterNumber - _aliveMonster;
	}
}

character Battle::getCurrentActor()
{
	return current_actor;
}

character * Battle::getPlayers()
{
	int cursor = 0;
	character* ret = new character[_playerNumber];
	for (int i = 0; i < _playerNumber; i++)
	{
		ret[cursor] = action_list[i];
		cursor++;
	}
	return ret;
}

character * Battle::getMonsters()
{
	int cursor = 0;
	character* ret = new character[_monsterNumber];
	for (int i = _playerNumber; i < _monsterNumber + _playerNumber; i++)
	{
		ret[cursor] = action_list[i];
		cursor++;
	}
	return ret;
}

void Battle::start_battle()
{
	do
	{
		system("cls");
		if (current_actor.type == 'p')
		{
			mymenu->initialize(nth_character % action_list_size);
			mymenu->decide();

			bool actioned = false;
			while (!actioned)
			{
				int user_option = mymenu->get_select_option();
				if (user_option == 1)
				{
					while (1)
					{
						int monster_index = mymenu->get_select_monster_index();
						temp_player = static_cast<NovicePlayer*>(action_list[mymenu->get_acting_player()].instance);
						BaseMonster* target = mymenu->get_select_monster();

						if (action_list[monster_index].alive == true)
						{
							if (target != NULL || target != nullptr)
							{
								int suffer = pow(temp_player->getAttack(), 2) / (target->defense + temp_player->getAttack());
								target->setHp(target->getHp() - suffer);
								cout << "\n\nYou attack " << target->name << " and it lost " << suffer << "HP\n\n";
								Sleep(1000);
								if (target->getHp() == 0)
								{
									action_list[monster_index].alive = false;
									_aliveMonster--;
									temp_player->setMoney(temp_player->getMoney() + target->money);
									temp_player->setExp(temp_player->getExp() + target->exp);
								}
							}
							break;//end while(243)
						}
						else
						{
							cout << "The monster has already dead, please choose another monster.\n";
							mymenu->reselect_attack_target();
						}
						
					}
					actioned = true;
				}
				else if (user_option == 2)
				{
					actioned = true;
				}
				else if (user_option == 3)
				{
					actioned = true;
				}
			}
		}
		else if (current_actor.type == 'm')
		{
			temp_monster = static_cast<BaseMonster*>(current_actor.instance);
			srand(time(NULL));
			while (1)
			{
				int target = rand() % _playerNumber;
				if (action_list[target].alive)
				{
					NovicePlayer* attacked = static_cast<NovicePlayer*>(action_list[target].instance);
					int suffer = pow(temp_monster->attack, 2) / (attacked->getDefense() + temp_monster->attack);
					attacked->setHp(attacked->getHp() - suffer);
					cout << "\n\nmonster attack " << attacked->getName() << " and it lost " << suffer << "HP\n\n";
					Sleep(1000);
					if (attacked->getHp() <= 0)
					{
						action_list[target].alive = false;
						_alivePlayer--;
					}
					break;
				}
			}
		}

		
		if (getPlayerCount(true) == 0 || getMonsterCount(true) == 0)
		{
			system("cls");
			mymenu->display_status();
			cout << "\nThe battle ended.\n";
			Sleep(3000);
			break;//End this battle
		}
	} while (!nextActor());

	//reveive the players
	for (int i = 0; i < _playerNumber; i++)
	{
		NovicePlayer* ptr = static_cast<NovicePlayer*>(action_list[i].instance);
		ptr->setHp(ptr->getMaxHP());
		ptr->setMp(ptr->getMaxMP());
	}
}

void Battle::display_action_list(void)
{
	cout << left << setw(10) << "編號" << setw(20) << "名字" << setw(10) << "血量" << setw(10) << "魔力" << endl;
	for (int ch = 0; ch < action_list_size - _monsterNumber; ch++)
	{
		NovicePlayer* ptr = static_cast<NovicePlayer*>(action_list[ch].instance);
		cout << left << setw(10) << ch + 1 << setw(20) << ptr->getName() << setw(10) << ptr->getHp() << setw(10) << ptr->getMp() << endl;
	}
	for (int mn = _playerNumber; mn < action_list_size; mn++)
	{
		BaseMonster* ptr = static_cast<BaseMonster*>(action_list[mn].instance);
		cout << left << setw(10) << mn + 1 << setw(20) << ptr->name << setw(10) << ptr->getHp() << setw(10) << ptr->getMp() << endl;
	}
}

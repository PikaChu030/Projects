#include "BattleMenu.h"

BattleMenu::BattleMenu(NovicePlayer** attend_player, int act_player, BaseMonster** attend_monster, int player_number, int monster_number)
	:player_in_battle(attend_player), monster_in_battle(attend_monster), player_list_size(player_number), monster_list_size(monster_number), acting_player(act_player)
{
	option.resize(3);
	option.at(0) = "Attack";
	option.at(1) = "Use Special Skill";
	option.at(2) = "Use Item";
}


void BattleMenu::display_status(void)
{
	cout << right << setw(10) << "編號" << setw(20) << "名字" << setw(30) << "血量" << setw(9) << "魔力" << endl;
	for (int ch = 0; ch < player_list_size; ch++)
	{
		NovicePlayer* ptr = player_in_battle[ch];
		cout << right << setw(10) << ch + 1 << setw(20) << ptr->getName();
		//Display HP Bar
			//Calculate how many "=" will be displayed
		int hp_bar = static_cast<int>(static_cast<double>(ptr->getHp()) / static_cast<double>(ptr->getMaxHP()) * 20.0);
			//Output HP Bar
		cout << " <";
		for (int i = 0; i < hp_bar; i++)
		{
			cout << "=";
		}
		for (int i = hp_bar; i < 20; i++)
		{
			cout << " ";
		}
		cout << ">";

		cout << setw(4) << ptr->getHp() << "/" << setw(4) << ptr->getMaxHP() << setw(4) << ptr->getMp() << "/" << setw(4) << ptr->getMaxMP() << endl;
	}
	cout << endl;
	for (int mn = 0; mn < monster_list_size; mn++)
	{
		BaseMonster* ptr = monster_in_battle[mn];
		cout << right << setw(10) << mn + 1 << setw(20) << ptr->name;
		//Display HP Bar
			//Calculate how many "=" will be displayed
		int hp_bar = static_cast<int>(static_cast<double>(ptr->getHp()) / static_cast<double>(ptr->max_hp) * 20.0);
			//Output HP Bar
		cout << " <";
		for (int i = 0; i < hp_bar; i++)
		{
			cout << "=";
		}
		for (int i = hp_bar; i < 20; i++)
		{
			cout << " ";
		}
		cout << ">";
		cout << setw(4) << ptr->getHp() << "/" << setw(4) << ptr->max_hp << setw(4) << ptr->getMp() << "/" << setw(4) << ptr->max_mp << endl;
	}
}

void BattleMenu::display(void)
{

	for (int i = 0; i < option.size(); i++)
	{
		cout << i + 1 << "." << option.at(i);
		cout << endl;
	}
	cout << endl;
}

void BattleMenu::decide(void)
{
	bool end = false;
	char input;

	this->display_status();
	while (!end)
	{
		cout << "Player " << acting_player + 1 << "(" << player_in_battle[acting_player]->getName() << ")" << "acting...\n\n";
		this->display();
		cout << "Please choose an option...";
		cin >> input;

		switch (input)
		{
		case '1':
			option1();
			end = true;
			break;
		case '2':
			option2();
			end = true;
			break;
		case '3':
			if (NovicePlayer::getItemNumber() > 0)
			{
				option3();
				end = true;
			}
			else
			{
				cout << "There is no item can be used.";
			}
			break;
		default:
			cin.ignore();
			cin.clear();
			break;
		}
		cout << endl;
	}
}

void BattleMenu::player_select_monster(int target)
{
	select_monster = monster_in_battle[target - player_list_size - 1];
}

void BattleMenu::player_use_item(int choose)
{
	player_in_battle[acting_player]->consume(choose);
}

BaseMonster* BattleMenu::get_select_monster(void)
{
	return select_monster;
}

int BattleMenu::get_acting_player(void)
{
	return acting_player;
}

int BattleMenu::get_select_monster_index(void)
{
	//this will return the monster's index of Battle class's action_list index
	return select_monster_index;
}

int BattleMenu::get_select_option(void)
{
	return select_option;
}

void BattleMenu::option1(void)
{
	regex pattern("[0-9]+");
	select_option = 1;

	string user_input_uncheck;
	int user_input;
	while (1)
	{
		user_input_uncheck.clear();
		cout << "Please choose a monster to attack...";
		getline(cin, user_input_uncheck);

		if (regex_match(user_input_uncheck, pattern))
		{
			stringstream sin(user_input_uncheck);
			sin >> user_input;
			user_input--;
			if (user_input >= 0 && user_input < monster_list_size)
			{
				select_monster = monster_in_battle[user_input];
				select_monster_index = player_list_size + user_input;//The index of that monster in Battle class's index
				break;
			}
		}
	}
	
}

void BattleMenu::option2(void)
{
	select_option = 2;
	player_in_battle[acting_player]->specialSkill();
}

void BattleMenu::option3(void)
{
	regex pattern("[0-9]+");
	select_option = 3;
	string user_input_uncheck;
	int user_input;
	NovicePlayer::display_backpack();
	while (1)
	{
		cout << "Please choose an item to use...";
		getline(cin, user_input_uncheck);
		if (regex_match(user_input_uncheck, pattern))
		{
			stringstream sin(user_input_uncheck);
			sin >> user_input;
			user_input--;
			if (user_input >= 0 && user_input < NovicePlayer::getItemNumber())
			{
				player_in_battle[acting_player]->consume(user_input);
				break;
			}
		}
	}
}

void BattleMenu::initialize(int current_player)
{
	acting_player = current_player;
	select_monster = nullptr;
}

void BattleMenu::reselect_attack_target(void)
{
	option1();
	return;
}

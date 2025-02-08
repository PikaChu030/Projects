#include "Game.h"

Game::Game()
{
	//Load map
	field_list.resize(3);
	field_list.at(0) = new Field("Qimei_Lobby.txt", 1, 1, 10, 10);
	field_list.at(1) = new Field("Qimei_3F.txt", 1, 1, 8, 8);
	field_list.at(2) = new Field("Qimei_9F.txt", 1, 1, 10, 10);
	//setup player_list and map
	main_menu = new MainMenu();
	main_menu->decide();
	if (main_menu->getOptionInt() == 1)
	{
		player_list = main_menu->getGeneratedPlayer();
		current_field_index = main_menu->getMapIndex();
		field_menu = new FieldMenu(field_list.at(current_field_index), player_list);
	}
	else if (main_menu->getOptionInt() == 2)
	{
		continue_game();
	}
	
}

void Game::run(void)
{
	while (1)
	{
		system("cls");
		field_list.at(current_field_index)->display();
		field_menu->decide();
		check_and_launch();
	}
}

void Game::check_and_launch(void)
{
	Tag special_event;
	special_event = field_list.at(current_field_index)->getEvent();

	switch (special_event)
	{
	case none:
		break;
	case bonus:
		temp_event = new giftEvent();
		temp_event->launch();
		delete temp_event;
		break;
	case monster:
		temp_event = new MonsterEvent(player_list);
		temp_event->launch();
		delete temp_event;
		break;
	case JW:
		temp_event = new BoseEvent(player_list);
		temp_event->launch();
		checkWin();
		break;
	case previous_field:
		previous_map();
		break;
	case next_field:
		next_map();
		break;
	case partner:
		getPartner();
		break;
	}

}

void Game::next_map(void)
{
	field_list.at(current_field_index)->setPosition(1, 1);
	current_field_index++;
	field_list.at(current_field_index)->setPosition(1, 1);
	field_menu = new FieldMenu(field_list.at(current_field_index), player_list);

}

void Game::previous_map(void)
{
	field_list.at(current_field_index)->setPosition(1, 1);
	current_field_index--;
	delete field_menu;
	field_list.at(current_field_index)->setPosition(1, 1);
	field_menu = new FieldMenu(field_list.at(current_field_index), player_list);
}

void Game::continue_game(void)
{
	//Unserialize the player
	ifstream player_data_input("Player_doc.txt", ios::in);
	string temp_getline;

	if (player_data_input.is_open())
	{
		/*char c = player_data_input.get();
		cout << "file test：" << c;*/
		while (!player_data_input.eof())
		{
			temp_getline.clear();
			getline(player_data_input, temp_getline);

			if (temp_getline.size() == 0)
			{
				break;
			}

			NovicePlayer* test1 = KnightPlayer::unserialize(temp_getline);
			NovicePlayer* test2 = MagicianPlayer::unserialize(temp_getline);
			NovicePlayer* test3 = OrcPlayer::unserialize(temp_getline);
			NovicePlayer* test4 = BoxerPlayer::unserialize(temp_getline);
			if (test1 != nullptr)
			{
				generatePlayer.push_back(test1);
				continue;
			}
			else if (test2 != nullptr)
			{
				generatePlayer.push_back(test2);
				continue;
			}
			else if (test3 != nullptr)
			{
				generatePlayer.push_back(test3);
				continue;
			}
			else if (test4 != nullptr)
			{
				generatePlayer.push_back(test4);
				continue;
			}
		}
	}
	else
	{
		exit(3);
	}
	
	
	player_data_input.close();

	//Unserialize backpack
	ifstream backpack_data_input("Backpack_doc.txt", ios::in);
	while (!backpack_data_input.eof() && backpack_data_input)
	{
		temp_getline.clear();
		getline(backpack_data_input, temp_getline);

		if (temp_getline.size() == 0)
		{
			break;
		}

		if (temp_getline == "class axeItem")
		{
			NovicePlayer::setattr(static_cast<Item*>(new axeItem()));
			continue;
		}
		else if (temp_getline == "class lifePotion")
		{
			NovicePlayer::setattr(static_cast<Item*>(new lifePotion()));
			continue;
		}
		else if (temp_getline == "class magicPotion")
		{
			NovicePlayer::setattr(static_cast<Item*>(new magicPotion()));
			continue;
		}
		else if (temp_getline == "class shieldItem")
		{
			NovicePlayer::setattr(static_cast<Item*>(new shieldItem()));
			continue;
		}
		else if (temp_getline == "class swordItem")
		{
			NovicePlayer::setattr(static_cast<Item*>(new swordItem()));
			continue;
		}
		else if (temp_getline == "class tunicItem")
		{
			NovicePlayer::setattr(static_cast<Item*>(new tunicItem()));
			continue;
		}
	}
	backpack_data_input.close();

	//reconstruct the field
	ifstream status_input("Status_doc.txt", ios::in);
	string map_name;

	if (status_input)
	{
		getline(status_input, map_name);
		status_input >> position_y;
		status_input.ignore();
		status_input >> position_x;
		if (map_name == "Qimei_Lobby.txt")
		{
			map_index = 0;
		}
		else if (map_name == "Qimei_3F.txt")
		{
			map_index = 1;
		}
		else if (map_name == "Qimei_9F.txt")
		{
			map_index = 2;
		}
	}

	player_list = generatePlayer;
	current_field_index = map_index;
	field_list.at(current_field_index)->setPosition(position_y, position_x);
	field_menu = new FieldMenu(field_list.at(current_field_index), player_list);
}

void Game::getPartner(void)
{
	cout << "你獲得了伙伴一枚" << endl;
	Sleep(2000);
	srand(time(NULL));
	switch (rand() % 4)
	{
	case 0:
		player_list.push_back(new KnightPlayer(20, "出來泡咖啡的助教"));
		break;
	case 1:
		player_list.push_back(new MagicianPlayer(20, "出來泡咖啡的助教"));
		break;
	case 2:
		player_list.push_back(new OrcPlayer(20, "出來泡咖啡的助教"));
		break;
	case 3:
		player_list.push_back(new BoxerPlayer(20, "出來泡咖啡的助教"));
		break;
	}
	
}

void Game::checkWin(void)
{
	BoseEvent* bose_event = dynamic_cast<BoseEvent*>(temp_event);
	if (bose_event->Win())
	{
		Event* temp = new WinEvent();
		temp->launch();
		cout << endl;
		system("pause");
		exit(0);
	}
	else
	{
		Event* temp = new LoseEvent();
		temp->launch();
		cout << endl;
		system("pause");
		exit(0);
	}
}

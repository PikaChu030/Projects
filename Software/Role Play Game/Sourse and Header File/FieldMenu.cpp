#include "FieldMenu.h"

FieldMenu::FieldMenu(Field* input, vector<NovicePlayer*> player_input)
{
	option.clear();
	current_field = input;
	player_list = player_input;
}

void FieldMenu::decide(void)
{
	display();
	pressed_key = _getch();
	switch (pressed_key)
	{
	case 'w':
	case 'a':
	case 's':
	case 'd':
		current_field->move(pressed_key);
		break;
	case 'e':
		NovicePlayer::display_backpack();
		system("pause");
		break;
	case 'q':
		equipment();
		break;
	case '\x1b':
		escape();
		break;
	default:
		break;
	}
}

void FieldMenu::display(void)
{
	cout << "      �W�Gw" << endl;
	cout << "���Ga        �k�Gd      e�G��ܭI�]  q�G�d�ݸ˳�  ESC�G�Ȱ�/�s��/���}" << endl;
	cout << "      �U�Gs" << endl;
}

void FieldMenu::escape(void)
{
	system("cls");
	cout << "1.�^��C��\n2.�s��\n3.���}\n";
	char temp_pressed_key = _getch();
	switch (temp_pressed_key)
	{
	case '1':
		break;
	case '2':
		save(player_list, current_field);
		cout << endl << "The game has been saved.";
		Sleep(1000);
		break;
	case '3':
		exit(3);
		break;
	}
}

void FieldMenu::equipment(void)
{
	displayEquipment();
	bool check = false;
	while (!check)
	{
		cout << "�ڷQ�n... 1.�˳ƪZ��/���� 2.��^";
		char equipment_input;
		equipment_input = _getch();
		switch (equipment_input)
		{
		case '1':
			setEquipment();
			break;
		case '2':
			check = true;
			break;
		}
		cout << endl;
	}
	system("pause");
}

void FieldMenu::displayEquipment(void)
{
	cout << right << setw(10) << "�s��" << setw(20) << "���a" << setw(10) << "����" << setw(20) << "�˳�" << setw(20) << "�Z��" << endl;

	for (int i = 0; i < player_list.size(); i++)
	{
		cout << right << setw(10) << i + 1;
		cout << right << setw(20) << player_list.at(i)->getName();
		cout << right << setw(10) << player_list.at(i)->getLevel();
		cout << right << setw(20) << player_list.at(i)->getArmorName();
		cout << right << setw(20) << player_list.at(i)->getWeaponName();
		cout << endl;
	}
}

void FieldMenu::save(vector<NovicePlayer*> player_list, Field* current_map)
{
	ofstream output("Player_doc.txt", ios::out);
	//Serialize players
	for (int i = 0; i < player_list.size(); i++)
	{
		NovicePlayer* temp = player_list.at(i);
		string temp_data;
		temp_data = temp->serialize();
		output << temp_data << endl;
	}
	output.close();

	ofstream backpack_output("Backpack_doc.txt", ios::out);
	//Serialize backpack
	vector<string> backpack_data;
	backpack_data = NovicePlayer::serializeBackpack();
	for (int i = 0; i < backpack_data.size(); i++)
	{
		backpack_output << backpack_data.at(i);
		backpack_output << endl;
	}
	backpack_output.close();

	//Serialize game status
	ofstream game_output("Status_doc.txt", ios::out);
	game_output << current_map->getMapName() << endl;
	game_output << current_map->getCurrentPositionY() << "," << current_map->getCurrentPositionX();
	game_output.close();
}

char FieldMenu::getPressKey(void)
{
	return pressed_key;
}

void FieldMenu::setEquipment()
{
	regex pattern("[0-9]+");
	bool complete = false;
	while (!complete)
	{
		cout << endl;
		displayEquipment();
		string player_choise_uncheck;
		int player_choise;
		while (1)
		{
			cout << "�A�n���ָ˳�...>>";
			getline(cin, player_choise_uncheck);
			if (regex_match(player_choise_uncheck, pattern))
			{
				stringstream sin(player_choise_uncheck);
				sin >> player_choise;
				break;
			}
		}
		cout << endl;
		NovicePlayer::display_backpack();
		string equipment_choise_uncheck;
		int equipment_choise;
		while (1)
		{
			cout << "�A�n�D���@�Ӹ˳�...";
			getline(cin, equipment_choise_uncheck);
			if (regex_match(equipment_choise_uncheck, pattern))
			{
				stringstream sin(equipment_choise_uncheck);
				sin >> equipment_choise;
				break;
			}
		}

		if (NovicePlayer::getItemID(equipment_choise - 1) == 'w')
		{
			player_list.at(player_choise - 1)->setweapon(equipment_choise - 1);
		}
		else if (NovicePlayer::getItemID(equipment_choise - 1) == 'a')
		{
			player_list.at(player_choise - 1)->setarmor(equipment_choise - 1);
		}
		complete = true;
	}
}

#include "MainMenu.h"

MainMenu::MainMenu()
{
	option.resize(3);
	option.at(0) = "New Game";
	option.at(1) = "Continue Game";
	option.at(2) = "Exit";
	generatePlayer.clear();
}

void MainMenu::display(void)
{
	for (int i = 0; i < option.size(); i++)
	{
		cout << i + 1 << "." << option.at(i) << endl;
	}
}

void MainMenu::decide(void)
{
	bool check = false;

	while (!check)
	{
		system("cls");
		display();
		cout << ">>";
		int choise;
		cin >> choise;
		if (cin.fail())
		{
			cout << "illegal input";
			continue;
		}
		else
		{
			if (choise < 1 && choise > 3)
			{
				cout << "illegal input";
			}
			else
			{
				select(choise);
				check = true;
			}
		}
	}
}

void MainMenu::select(int input)
{
	switch (input)
	{
	case 1:
		option1();
		break;
	case 2:
		option2();
		break;
	case 3:
		option3();
		break;
	default:
		break;
	}
}

vector<NovicePlayer*> MainMenu::getGeneratedPlayer()
{
	return generatePlayer;
}

int MainMenu::getPositionX(void)
{
	return position_x;
}

int MainMenu::getPositionY(void)
{
	return position_y;
}

int MainMenu::getMapIndex(void)
{
	return map_index;
}

int MainMenu::getOptionInt(void)
{
	return option_int;
}

void MainMenu::option1(void)
{
	option_int = 1;
	//Generate Player
	generatePlayer = vector<NovicePlayer*>(4, nullptr);
	generatePlayer.at(0) = new KnightPlayer(10, "小葦葦");
	generatePlayer.at(1) = new MagicianPlayer(30, "佶龍大大");
	generatePlayer.at(2) = new OrcPlayer(5, "快要被當的人");
	generatePlayer.at(3) = new BoxerPlayer(15, "學長");

	map_index = 0;
	position_x = 1;
	position_y = 1;
	system("cls");
	NewGameEvent* temp = new NewGameEvent();
	temp->launch();
}

void MainMenu::option2(void) //Unserialize
{
	option_int = 2;
}

void MainMenu::option3(void)
{
	exit(3);
}

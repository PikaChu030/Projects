#include "BoseEvent.h"

BoseEvent::BoseEvent(vector<NovicePlayer*> attend_player)
{
	player_data = new NovicePlayer*[attend_player.size()];
	player_data_size = attend_player.size();
	for (int i = 0; i < player_data_size; i++)
	{
		player_data[i] = attend_player.at(i);
	}

	JWMonster final_boss;
	monster_list[0] = new JWMonster();
	battle = new Battle(player_data, monster_list, attend_player.size(), 1, 100);
}

void BoseEvent::launch(void)
{
	story();
	battle->start_battle();
	for (int i = 0; i < player_data_size; i++)
	{
		MagicianPlayer* temp1 = dynamic_cast<MagicianPlayer*>(player_data[i]);
		BoxerPlayer* temp2 = dynamic_cast<BoxerPlayer*>(player_data[i]);
		if (temp1 != nullptr)
		{
			temp1->initialize();
		}
		else if (temp2 != nullptr)
		{
			temp2->initialize();
		}
	}
}

bool BoseEvent::Win(void)
{
	if (battle->getPlayerCount(true) == 0)
	{
		return false;
	}
	else
	{
		return true;
	}
}

void BoseEvent::story(void)
{
	system("cls");
	cout << "���¡G�A�n���ƻ�" <<endl;
	Sleep(3000);
	cout << "�ڡG�Ѯv�ڧƱ�@�~�i�H����A�o�ˮڥ��g����" << endl;
	Sleep(3000);
	cout << "���¡G��~��A�o�O���F�A�̦n" << endl;
	Sleep(3000);
	cout << "�ڡG��~~~���ޤ���~�ڴN�O�Q�n�����~~~" << endl;
	Sleep(3000);
	cout << "���¡G......�n�էA���ѧڴN����..." << endl << endl;
	Sleep(3000);
	system("pause");
}

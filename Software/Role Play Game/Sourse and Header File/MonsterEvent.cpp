#include "MonsterEvent.h"

MonsterEvent::MonsterEvent(vector<NovicePlayer*> attend_player)
{
	player_data = new NovicePlayer*[attend_player.size()];
	player_data_size = attend_player.size();
	for (int i = 0; i < player_data_size; i++)
	{
		player_data[i] = attend_player.at(i);
	}
}

void MonsterEvent::launch(void)
{
	Battle little_battle(player_data, player_data_size, 100);
	little_battle.start_battle();
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

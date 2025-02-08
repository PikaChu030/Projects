#include "OrcPlayer.h"

OrcPlayer::OrcPlayer()
	:NovicePlayer()
{
	setLevel(1);
}

OrcPlayer::OrcPlayer(int input)
	: NovicePlayer(input)
{
	setLevel(input);
}

OrcPlayer::OrcPlayer(int input, string input_name)
	:NovicePlayer(input, input_name)
{
	setLevel(input);
}

OrcPlayer::OrcPlayer(const OrcPlayer & input_player)
	:NovicePlayer(input_player)
{
	setLevel(input_player.getLevel());
}

string OrcPlayer::serialize()
{
	string obj_data;
	obj_data.clear();
	string obj_name(typeid(*this).name());

	obj_data += NovicePlayer::serialize();

	for (int i = 0; i < obj_name.size(); i++)
	{
		obj_data.at(i) = obj_name.at(i);
	}

	return obj_data;
}

NovicePlayer * OrcPlayer::unserialize(string text_data)
{
	int cursor = 0;

	string text_data_name;
	while (text_data.at(cursor) != ':')
	{
		text_data_name.push_back(text_data.at(cursor));
		cursor++;
	}

	if (text_data_name != "class OrcPlayer")
	{
		return nullptr;
	}

	//Skip ':'
	cursor++;
	NovicePlayer* ptr = new OrcPlayer();
	while (cursor < text_data.size())
	{
		string index, value;
		index.clear();
		value.clear();
		while (text_data.at(cursor) != '=')
		{
			index.push_back(text_data.at(cursor));
			cursor++;
		}
		cursor++;//Skip '='
		while (text_data.at(cursor) != ',')
		{
			value.push_back(text_data.at(cursor));
			cursor++;
		}
		cursor++;//Skip ','

		stringstream sin(value);
		int num_value;
		sin >> num_value;

		if (index == "level")
		{
			ptr->setLevel(num_value);
		}
		else if (index == "name")
		{
			ptr->setName(value);
		}
		else if (index == "hp")
		{
			ptr->setHp(num_value);
		}
		else if (index == "mp")
		{
			ptr->setMp(num_value);
		}
		else if (index == "exp")
		{
			ptr->setExp(num_value);
		}
		else if (index == "money")
		{
			ptr->setMoney(num_value);
		}
	}

	return ptr;
}

void OrcPlayer::setLevel(int input)
{
	level = input;
	level_up();
}

void OrcPlayer::specialSkill()
{
	;
}

void OrcPlayer::level_up()
{
	attack = 50 + 12 * level;
	defense = 30 + 10 * level;
	max_hp = 200 + 20 * level;
	max_mp = 50 + 5 * level;
	lvup_exp = ceil(pow(10, log2(level + 1)));

	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
}
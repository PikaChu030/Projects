#include "KnightPlayer.h"

KnightPlayer::KnightPlayer()
	:NovicePlayer()
{
	setLevel(1);
}

KnightPlayer::KnightPlayer(int input)
	: NovicePlayer(input)
{
	setLevel(input);
}

KnightPlayer::KnightPlayer(int input, string input_name)
	:NovicePlayer(input, input_name)
{
	setLevel(input);
}

KnightPlayer::KnightPlayer(const KnightPlayer & input_player)
	: NovicePlayer(input_player)
{
	setLevel(input_player.getLevel());
}

string KnightPlayer::serialize()
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

NovicePlayer * KnightPlayer::unserialize(string text_data)
{
	int cursor = 0;

	string text_data_name;
	while (text_data.at(cursor) != ':')
	{
		text_data_name.push_back(text_data.at(cursor));
		cursor++;
	}

	if (text_data_name != "class KnightPlayer")
	{
		return nullptr;
	}

	//Skip ':'
	cursor++;
	NovicePlayer* ptr = new KnightPlayer();
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

void KnightPlayer::setLevel(int input)
{
	level = input;
	level_up();
}

void KnightPlayer::specialSkill()
{
	if (getMp() >= getLevel() * 5)
	{
		setHp(getHp() + getLevel() * 10);
		setMp(getMp() - getLevel() * 5);
		cout << endl << "你的血量回復" << getLevel() * 10 << endl;
		Sleep(2000);
	}
	else
	{
		;
	}
}

void KnightPlayer::level_up()
{
	attack = 40 + 10 * level;
	defense = 20 + 12 * level;
	max_hp = 150 + 25 * level;
	max_mp = 70 + 10 * level;
	lvup_exp = ceil(pow(10, log2(level + 1)));

	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
}
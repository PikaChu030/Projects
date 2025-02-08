#include "MagicianPlayer.h"

MagicianPlayer::MagicianPlayer()
	:NovicePlayer()
{
	setLevel(1);
	original_defense = getDefense();
}

MagicianPlayer::MagicianPlayer(int input)
	: NovicePlayer(input)
{
	setLevel(input);
	original_defense = getDefense();
}

MagicianPlayer::MagicianPlayer(int input, string input_name)
	: NovicePlayer(input, input_name)
{
	setLevel(input);
	original_defense = getDefense();
}

MagicianPlayer::MagicianPlayer(const MagicianPlayer & input_player)
	: NovicePlayer(input_player)
{
	setLevel(input_player.getLevel());
	original_defense = getDefense();
}

string MagicianPlayer::serialize()
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

NovicePlayer * MagicianPlayer::unserialize(string text_data)
{
	int cursor = 0;

	string text_data_name;
	while (text_data.at(cursor) != ':')
	{
		text_data_name.push_back(text_data.at(cursor));
		cursor++;
	}

	if (text_data_name != "class MagicianPlayer")
	{
		return nullptr;
	}

	//Skip ':'
	cursor++;
	NovicePlayer* ptr = new MagicianPlayer();
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

void MagicianPlayer::setLevel(int input)
{
	level = input;
	level_up();
}

void MagicianPlayer::specialSkill()
{
	if (getMp() >= getLevel() * 10)
	{
		setMp(getMp() - getLevel() * 10);
		setDefense(getDefense() + 5 * getLevel());
		cout << endl << "你的防禦力提升了" << endl;
		Sleep(2000);
	}
	else
	{
		;
	}
}

void MagicianPlayer::initialize(void)
{
	setDefense(original_defense);
}

void MagicianPlayer::level_up()
{
	attack = 30 + 8 * level;
	defense = 20 + 7 * level;
	max_hp = 120 + 15 * level;
	max_mp = 100 + 15 * level;
	lvup_exp = ceil(pow(10, log2(level + 1)));

	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
}
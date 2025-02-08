#include "BoxerPlayer.h"

BoxerPlayer::BoxerPlayer()
{
	setLevel(1);
}

BoxerPlayer::BoxerPlayer(int input)
	: NovicePlayer(input)
{
	setLevel(input);
}

BoxerPlayer::BoxerPlayer(int input, string input_name)
	: NovicePlayer(input, input_name)
{
	setLevel(input);
}

BoxerPlayer::BoxerPlayer(const BoxerPlayer & input_player)
	: NovicePlayer(input_player)
{
	setLevel(input_player.getLevel());
}

string BoxerPlayer::serialize()
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

NovicePlayer * BoxerPlayer::unserialize(string text_data)
{
	int cursor = 0;

	string text_data_name;
	while (text_data.at(cursor) != ':')
	{
		text_data_name.push_back(text_data.at(cursor));
		cursor++;
	}

	if (text_data_name != "class BoxerPlayer")
	{
		return nullptr;
	}

	//Skip ':'
	cursor++;
	NovicePlayer* ptr = new BoxerPlayer();
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

void BoxerPlayer::setLevel(int input)
{
	level = input;
	level_up();
}

void BoxerPlayer::specialSkill()
{
	if (getMp() >= getLevel() * 5)
	{
		setMp(getMp() - getLevel() * 5);
		setAttack(getAttack() + 3 * getLevel());
		cout << endl << "你的攻擊力提升了" << endl;
		Sleep(2000);
	}
	else
	{
		;
	}
}

void BoxerPlayer::initialize(void)
{
	setAttack(oroginal_attack);
}

void BoxerPlayer::level_up()
{
	attack = 30 + 5 * level;
	defense = 40 + 8 * level;
	max_hp = 150 + 15 * level;
	max_mp = 60 + 15 * level;
	lvup_exp = ceil(pow(10, log2(level + 1)));

	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
}
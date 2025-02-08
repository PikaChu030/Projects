#include "GoblinMonster.h"

int GoblinMonster::Goblincount = 0;

GoblinMonster::GoblinMonster(string _name, int _atk, int _def, int _exp, int _money, int _max_hp, int _max_mp)
	:BaseMonster(_name, _atk, _def, _exp, _money, _max_hp, _max_mp)
{
	Goblincount++;
}

GoblinMonster::~GoblinMonster()
{
	Goblincount--;
}

string GoblinMonster::serialize()
{
	string obj_data, temp;
	obj_data.clear();
	temp.clear();

	obj_data += typeid(*this).name();
	obj_data.push_back(':');

	temp = "name=";
	obj_data += temp;
	obj_data += this->name;
	obj_data.push_back(',');

	temp = "attack=";
	obj_data += temp;
	obj_data += to_string(this->attack);
	obj_data.push_back(',');

	temp = "defense=";
	obj_data += temp;
	obj_data += to_string(this->defense);
	obj_data.push_back(',');

	temp = "exp=";
	obj_data += temp;
	obj_data += to_string(this->exp);
	obj_data.push_back(',');

	temp = "money=";
	obj_data += temp;
	obj_data += to_string(this->money);
	obj_data.push_back(',');

	temp = "max_hp=";
	obj_data += temp;
	obj_data += to_string(this->max_hp);
	obj_data.push_back(',');

	temp = "max_mp=";
	obj_data += temp;
	obj_data += to_string(this->max_mp);
	obj_data.push_back(',');

	temp = "hp=";
	obj_data += temp;
	obj_data += to_string(this->getHp());
	obj_data.push_back(',');

	temp = "mp=";
	obj_data += temp;
	obj_data += to_string(this->getMp());
	obj_data.push_back(',');

	return obj_data;
}

BaseMonster * GoblinMonster::unserialize(string text_data)
{
	int cursor = 0;

	string text_data_name;
	while (text_data.at(cursor) != ':')
	{
		text_data_name.push_back(text_data.at(cursor));
		cursor++;
	}

	if (text_data_name != "class GoblinMonster")
	{
		return nullptr;
	}

	//Skip ':'
	int const_attack, const_defense, const_exp, const_money, const_max_hp, const_max_mp, old_hp, old_mp;
	string const_name;
	cursor++;
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

		if (index == "attack")
		{
			const_attack = num_value;
		}
		else if (index == "name")
		{
			const_name = value;
		}
		else if (index == "defense")
		{
			const_defense = num_value;
		}
		else if (index == "exp")
		{
			const_exp = num_value;
		}
		else if (index == "money")
		{
			const_money = num_value;
		}
		else if (index == "max_hp")
		{
			const_max_hp = num_value;
		}
		else if (index == "max_mp")
		{
			const_max_mp = num_value;
		}
		else if (index == "hp")
		{
			old_hp = num_value;
		}
		else if (index == "mp")
		{
			old_mp = num_value;
		}
	}

	BaseMonster* ptr = new GoblinMonster(const_name, const_attack, const_defense, const_exp, const_money, const_max_hp, const_max_mp);
	ptr->setHp(old_hp);
	ptr->setMp(old_mp);

	return ptr;
}

#include "NovicePlayer.h"

int NovicePlayer::backpack_weight = 0;
int NovicePlayer::backpack_weight_limit = 200;
int NovicePlayer::backpack_slot_limit = 30;
vector<Item*> NovicePlayer::backpack = vector<Item*>(0);

NovicePlayer::NovicePlayer()
{
	setLevel(1);

	setName("anonymous");
	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
	setMoney(0);
	weapon = NULL;
	armor = NULL;
	backpack.clear();
}

NovicePlayer::NovicePlayer(int ini_level)
{
	setLevel(ini_level);

	setName("anonymous");
	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
	setMoney(0);
	weapon = NULL;
	armor = NULL;
	backpack.clear();
}

NovicePlayer::NovicePlayer(int ini_level, string input_name)
{
	setLevel(ini_level);

	setName(input_name);
	setHp(max_hp);
	setMp(max_mp);
	setExp(0);
	setMoney(0);
	weapon = NULL;
	armor = NULL;
	backpack.clear();
}

NovicePlayer::NovicePlayer(const NovicePlayer & input_player)
{
	setLevel(input_player.getLevel());

	setName(input_player.getName());
	setHp(input_player.getHp());
	setMp(input_player.getMp());
	setExp(input_player.getExp());
	setMoney(input_player.getMoney());
	weapon = NULL;
	armor = NULL;
	backpack.clear();
}

string NovicePlayer::serialize()
{
	string obj_data, temp;
	obj_data.clear();
	temp.clear();

	obj_data += typeid(*this).name();
	obj_data.push_back(':');

	temp = "level=";
	obj_data += temp;
	obj_data += to_string(this->level);
	obj_data.push_back(',');

	temp = "name=";
	obj_data += temp;
	obj_data += this->name;
	obj_data.push_back(',');

	temp = "hp=";
	obj_data += temp;
	obj_data += to_string(this->hp);
	obj_data.push_back(',');

	temp = "mp=";
	obj_data += temp;
	obj_data += to_string(this->mp);
	obj_data.push_back(',');

	temp = "exp=";
	obj_data += temp;
	obj_data += to_string(this->exp);
	obj_data.push_back(',');

	temp = "money=";
	obj_data += temp;
	obj_data += to_string(this->money);
	obj_data.push_back(',');

	return obj_data;

}

vector<string> NovicePlayer::serializeBackpack(void)
{
	vector<string> ret;
	ret.clear();
	string temp;
	if (backpack.size() == 0)
	{
		return vector<string>(0);
	}

	for (int i = 0; i < backpack.size(); i++)
	{
		temp.clear();
		temp += backpack.at(i)->type;
		ret.push_back(temp);
	}
	return ret;
}

NovicePlayer * NovicePlayer::unserialize(string text_data)
{
	int cursor = 0;

	string text_data_name;
	while (text_data.at(cursor) != ':')
	{
		text_data_name.push_back(text_data.at(cursor));
		cursor++;
	}

	if (text_data_name != "class NovicePlayer")
	{
		return nullptr;
	}

	//Skip ':'
	cursor++;
	NovicePlayer* ptr = new NovicePlayer();
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

void NovicePlayer::setName(string input_name)
{
	name = input_name;
}

string NovicePlayer::getName() const
{
	return name;
}

void NovicePlayer::setLevel(int input)
{
	if (input >= 1)
	{
		level = input;
		level_up();
	}
	else
	{
		level = 1;
		level_up();
	}
}

int NovicePlayer::getLevel() const
{
	return level;
}

void NovicePlayer::setHp(int input)
{
	if (input <= max_hp && input >= 0)
	{
		hp = input;
	}
	else if (input > max_hp)
	{
		hp = max_hp;
	}
	else if (input < 0)
	{
		hp = 0;
	}
}

int NovicePlayer::getHp() const
{
	return hp;
}

void NovicePlayer::setMp(int input)
{
	if (input <= max_mp)
	{
		mp = input;
	}
	else
	{
		mp = max_mp;
	}
}

int NovicePlayer::getMp() const
{
	return mp;
}

void NovicePlayer::setExp(int input)
{
	if (input <= lvup_exp && input >= 0)
	{
		exp = input;
	}
	else if (input >= lvup_exp)
	{
		level++;
		level_up();
	}
	else if (input <= 0)
	{
		exp = 0;
	}
}

int NovicePlayer::getExp() const
{
	return exp;
}

void NovicePlayer::setMoney(int input)
{
	if (input >= 0)
	{
		money = input;
	}
	else
	{
		money = 0;
	}
}

int NovicePlayer::getMoney() const
{
	return money;
}

int NovicePlayer::getAttack() const
{
	if (weapon != NULL)
	{
		return attack + weapon->attack_increament;
	}
	else
	{
		return attack;
	}
}

void NovicePlayer::setAttack(int input)
{
	attack = input;
}

int NovicePlayer::getDefense() const
{
	if (armor != NULL)
	{
		return defense + armor->defense_increament;
	}
	else
	{
		return defense;
	}
}

void NovicePlayer::setDefense(int input)
{
	defense = input;
}

int NovicePlayer::getMaxHP() const
{
	return max_hp;
}

int NovicePlayer::getMaxMP() const
{
	return max_mp;
}

int NovicePlayer::getLvupExp() const
{
	return lvup_exp;
}

void NovicePlayer::specialSkill()
{
	;
}

void NovicePlayer::setWeightLimit(int input)
{
	if (input > 0)
	{
		backpack_weight_limit = input;
	}
}

void NovicePlayer::setSlotLimit(int input)
{
	if (input > 0)
	{
		backpack_slot_limit = input;
	}
}

bool NovicePlayer::setattr(Item* thing)
{
	if (backpack.size() < backpack_slot_limit && backpack_weight + thing->weight <= backpack_weight_limit && backpack.size() + 1 <= backpack_slot_limit)
	{
		backpack.push_back(thing);
		backpack_weight += thing->weight;
		return true;
	}
	else
	{
		return false;
	}
}

bool NovicePlayer::setarmor(int target)
{
	if (target >= backpack.size() || target < 0)
	{
		return false;
	}
	else
	{
		armorItem* target_ptr;
		target_ptr = static_cast<armorItem*>(backpack.at(target));
		if (target_ptr != NULL)
		{
			armor = target_ptr;
			backpack_weight -= target_ptr->weight;
			backpack.erase(backpack.begin() + target);///////////////////////////Warning it may be a hazard
			return true;
		}
		else
		{
			return false;
		}
	}
}

string NovicePlayer::getArmorName(void)
{
	if (armor != NULL)
	{
		return this->armor->name;
	}
	else
	{
		return string();
	}
}

char NovicePlayer::getItemID(int input)
{
	if (input >= 0 && input < backpack.size())
	{
		return NovicePlayer::backpack.at(input)->identification;
	}
}

bool NovicePlayer::setweapon(int target)
{
	if (target >= backpack.size() || target < 0)
	{
		return false;
	}
	else
	{
		weaponItem* target_ptr = static_cast<weaponItem*>(backpack.at(target));
		if (target_ptr != NULL)
		{
			weapon = target_ptr;
			backpack_weight -= target_ptr->weight;
			backpack.erase(backpack.begin() + target);///////////////////////////Warning it may be a hazard
			return true;
		}
		else
		{
			return false;
		}
	}
}

string NovicePlayer::getWeaponName(void)
{
	if (weapon != NULL)
	{
		return this->weapon->name;
	}
	else
	{
		return string();
	}
}

int NovicePlayer::getItemNumber(void)
{
	return backpack.size();
}

bool NovicePlayer::consume(int target)
{
	if (target >= backpack.size() || target < 0)
	{
		return false;
	}
	else
	{
		consumableItem* target_ptr = static_cast<consumableItem*>(backpack.at(target));
		if (target_ptr != NULL)
		{
			if (target_ptr->type == "class lifePotion")
			{
				this->setHp(this->getHp() + target_ptr->effect);
				backpack_weight -= target_ptr->weight;
				backpack.erase(backpack.begin() + target);///////////////////////////Warning it may be a hazard
			}
			else if (target_ptr->type == "class magicPotion")
			{
				this->setMp(this->getMp() + target_ptr->effect);
				backpack_weight -= target_ptr->weight;
				backpack.erase(backpack.begin() + target);///////////////////////////Warning it may be a hazard
			}
			return true;
		}
		else
		{
			return false;
		}
	}
}

bool NovicePlayer::discard(int target)
{
	if (target >= backpack.size() || target < 0)
	{
		return false;
	}
	else
	{
		if (target < backpack.size())
		{
			backpack.erase(backpack.begin() + target - 1);
			return true;
		}
		else
		{
			return false;
		}
	}
}

void NovicePlayer::display_backpack(void)
{
	cout << left << setw(7) << "編號" << setw(20) << "物品名" << setw(60) << "由來" << setw(20) << "效果" << setw(10) << "等級限制" << endl;
	for (int i = 0; i < backpack.size(); i++)
	{
		cout << left << setw(7) << i + 1 << setw(20) << backpack.at(i)->name << setw(60) << backpack.at(i)->description << setw(20) << backpack.at(i)->effect << setw(10) << backpack.at(i)->level_required << endl;
	}
}

void NovicePlayer::level_up()
{
	attack = 20 + 5 * level;
	defense = 20 + 5 * level;
	max_hp = 100 + 10 * level;
	max_mp = 40 + 5 * level;
	lvup_exp = ceil(pow(10, log2(level + 1)));

	hp = max_hp;
	mp = max_mp;
	exp = 0;
}
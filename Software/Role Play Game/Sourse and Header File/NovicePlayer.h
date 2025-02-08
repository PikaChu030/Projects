#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
#include <sstream>
#include <typeinfo>
#include <vector>
#include <windows.h>
#include "weaponItem.h"
#include "armorItem.h"
#include "consumableItem.h"

using namespace std;

#ifndef NovicePlayer_H
#define NovicePlayer_H

class NovicePlayer
{
public:
	NovicePlayer();
	NovicePlayer(int);
	NovicePlayer(int, string);
	NovicePlayer(const NovicePlayer &);

	virtual string serialize();
	static NovicePlayer* unserialize(string);
	static vector<string> serializeBackpack(void);

	void setName(string);
	string getName() const;

	virtual void setLevel(int);
	int getLevel() const;

	void setHp(int);
	int getHp() const;

	void setMp(int);
	int getMp() const;

	void setExp(int);
	int getExp() const;

	void setMoney(int);
	int getMoney() const;

	int getDefense() const;
	void setDefense(int);

	int getAttack() const;
	void setAttack(int);

	int getMaxHP() const;
	int getMaxMP() const;
	int getLvupExp() const;

	virtual void specialSkill();

	static void setWeightLimit(int);
	static void setSlotLimit(int);
	static bool setattr(Item*);

	bool setarmor(int);
	string getArmorName(void);
	bool setweapon(int);
	string getWeaponName(void);
	
	static char getItemID(int);
	static int getItemNumber(void);

	bool consume(int);
	static bool discard(int);
	static void display_backpack(void);

protected:
	int level;
	int attack;
	int defense;
	int max_hp;
	int max_mp;
	int lvup_exp;
	void level_up();
	

private:
	string name;
	int hp;
	int mp;
	int exp;
	int money;
	static int backpack_weight;
	static int backpack_weight_limit;
	static int backpack_slot_limit;
	weaponItem* weapon;
	armorItem* armor;
	static vector<Item*> backpack;
};

#endif //NovicePlayer_H
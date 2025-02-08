#include "armorItem.h"

armorItem::armorItem(int lev_req, string item_name, string item_effect, string item_decription, int item_weight, string item_type, int defense_boost, char identifier)
	: Item(lev_req, item_name, item_effect, item_decription, item_weight, item_type, identifier), defense_increament(defense_boost)
{
	;
}

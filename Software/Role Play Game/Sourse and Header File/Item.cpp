#include "Item.h"

Item::Item(int lev_req, string item_name, string item_effect, string item_decription, int item_weight, string item_type, char identifier)
	:level_required(lev_req), name(item_name), effect(item_effect), description(item_decription), weight(item_weight), type(item_type), identification(identifier)
{
	;
}
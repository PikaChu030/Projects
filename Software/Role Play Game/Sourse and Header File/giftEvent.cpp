#include "giftEvent.h"

giftEvent::giftEvent()
{
	srand(time(NULL));
	gift_type = rand() % 2;
	if (gift_type == 0)
	{
		gift = static_cast<Item*>(new lifePotion());
	}
	else if (gift_type == 1)
	{
		gift = static_cast<Item*>(new magicPotion());
	}
}

void giftEvent::launch(void)
{
	NovicePlayer::setattr(gift);
	cout << endl << "你獲得了一罐" << gift->name << endl;
	system("pause");
}

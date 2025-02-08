#include "NewGameEvent.h"

NewGameEvent::NewGameEvent()
{
	;
}

void NewGameEvent::launch(void)
{
	cout << "這是一個悲傷的故事..." << endl;
	Sleep(2000);
	cout << "甲班的各位每個禮拜都要交出一份作業..." << endl;
	Sleep(2000);
	cout << "新的一個禮拜又要來了，終於受不了的小葦葦跑到電機系館跟仁暐理論..." << endl;
	Sleep(2000);
	cout << "但不知道哪來的獸人和魔法師和學長要跟你一起去" << endl;
	Sleep(2000);
	cout << "學長：我幫你扁他" << endl;
	Sleep(2000);
	cout << "我：...不要亂講話，學長你會害我被當Q_Q" << endl;
	Sleep(2000);
	cout << "我：...好啦也沒時間吐槽隊員了，要不然作業繳交期限又要到了" << endl;
	Sleep(2000);

	cout << "帶點補給品好了，不然沒打甚麼怪就去找仁暐應該會直接被當掉吧" << endl << endl;
	Sleep(3000);
	cout << "你獲得了\nLivePotion x 3\nMagicPotion x 3\n新手甲 x 1\n鍵盤劍 x 1";
	Sleep(5000);
	for (int i = 0; i < 3; i++)
	{
		NovicePlayer::setattr(static_cast<Item*>(new lifePotion()));
		NovicePlayer::setattr(static_cast<Item*>(new magicPotion()));
	}
	NovicePlayer::setattr(static_cast<Item*>(new shieldItem()));
	NovicePlayer::setattr(static_cast<Item*>(new swordItem()));

}

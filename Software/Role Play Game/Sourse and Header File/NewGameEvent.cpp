#include "NewGameEvent.h"

NewGameEvent::NewGameEvent()
{
	;
}

void NewGameEvent::launch(void)
{
	cout << "�o�O�@�Ӵd�˪��G��..." << endl;
	Sleep(2000);
	cout << "�үZ���U��C��§�����n��X�@���@�~..." << endl;
	Sleep(2000);
	cout << "�s���@��§���S�n�ӤF�A�ש�����F���p�����]��q���t�]���²z��..." << endl;
	Sleep(2000);
	cout << "�������D���Ӫ��~�H�M�]�k�v�M�Ǫ��n��A�@�_�h" << endl;
	Sleep(2000);
	cout << "�Ǫ��G�����A��L" << endl;
	Sleep(2000);
	cout << "�ڡG...���n�����ܡA�Ǫ��A�|�`�ڳQ��Q_Q" << endl;
	Sleep(2000);
	cout << "�ڡG...�n�դ]�S�ɶ��R�Ѷ����F�A�n���M�@�~ú������S�n��F" << endl;
	Sleep(2000);

	cout << "�a�I�ɵ��~�n�F�A���M�S���ƻ�ǴN�h�䤯�����ӷ|�����Q���a" << endl << endl;
	Sleep(3000);
	cout << "�A��o�F\nLivePotion x 3\nMagicPotion x 3\n�s��� x 1\n��L�C x 1";
	Sleep(5000);
	for (int i = 0; i < 3; i++)
	{
		NovicePlayer::setattr(static_cast<Item*>(new lifePotion()));
		NovicePlayer::setattr(static_cast<Item*>(new magicPotion()));
	}
	NovicePlayer::setattr(static_cast<Item*>(new shieldItem()));
	NovicePlayer::setattr(static_cast<Item*>(new swordItem()));

}

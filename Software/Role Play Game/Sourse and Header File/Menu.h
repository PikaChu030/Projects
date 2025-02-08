#include <iostream>
#include <cstdlib>
#include <iomanip>
#include <vector>
#include <string>
#include <regex>
using namespace std;

#ifndef Menu_H
#define Menu_H
class Menu
{
public:
	Menu();
	virtual void display(void) = 0;
	virtual void decide(void) = 0;
	
protected:
	vector<string> option;
};
#endif
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>

using namespace std;

#ifndef Tag_ENUM
#define Tag_ENUM
enum Tag { none, bonus, monster, JW, previous_field, next_field, partner };
#endif

#ifndef Field_H
#define Field_H
class Field
{
public:
	Field(vector<vector<int>>, int, int, int, int);
	Field(string, int, int, int, int);
	~Field();
	
	bool move(char);
	bool moveUp(void);
	bool moveDown(void);
	bool moveLeft(void);
	bool moveRight(void);

	int getCurrentPositionX(void) const;
	int getCurrentPositionY(void) const;
	int getVisionWidth(void) const;
	int getVisionHight(void) const;
	string getMapName(void) const;
	int getMapSymbol(int, int);
	static int getTotalMapCount(void);

	void setPosition(int, int);
	void setMapSymbol(int, int, int);
	void setVisionSize(int, int);

	Tag getEvent();

	//The first parameter is the number of space placed on the left of map
	void display(int = 0) const;


private:
	void refresh_position_flag(void);

	vector<vector<int>> map;
	int current_position_x;
	int current_position_y;
	string map_name;
	int vision_width;
	int vision_height;
	int last_step, last_position_x, last_position_y;

	static int map_count;

};

#endif
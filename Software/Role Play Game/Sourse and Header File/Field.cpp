#include "Field.h"

int Field::map_count = 0;

Field::Field(vector<vector<int>> input_map, int pos_y, int pos_x, int height, int width)
{
	map = input_map;
	setVisionSize(height, width);
	map_name = "Map ";
	map_name.push_back(map_count);
	map_count++;
	last_position_x = pos_x;
	last_position_y = pos_y;
	last_step = map.at(current_position_y).at(current_position_x);
	setPosition(pos_y, pos_x);
}

Field::Field(string name, int pos_y, int pos_x, int height, int width)
{
	ifstream file(name, ios::in);
	if (!file)
	{
		exit(3);
	}

	int map_width, map_height;
	file >> map_width;
	file.ignore();
	file >> map_height;

	map.resize(map_height);
	for (int i = 0; i < map.size(); i++)
	{
		map.at(i).resize(map_width);
	}


	for (int i = 0; i < map.size(); i++)
	{
		for (int j = 0; j < map.at(i).size(); j++)
		{
			file >> map.at(i).at(j);
			file.ignore();					//skip the comma
		}
	}

	setVisionSize(height, width);
	map_name = name;
	map_count++;
	last_position_x = pos_x;
	last_position_y = pos_y;
	last_step = map.at(current_position_y).at(current_position_x);
	setPosition(pos_y, pos_x);
	file.close();
}

Field::~Field()
{
	map_count--;
}

bool Field::move(char input)
{
	switch (input)
	{
	case 'w':
		if (current_position_y - 1 >= 0)
		{
			if (map.at(current_position_y - 1).at(current_position_x) != 1)
			{
				current_position_y--;
				refresh_position_flag();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}

	case 'a':
		if (current_position_x - 1 >= 0)
		{
			if (map.at(current_position_y).at(current_position_x - 1) != 1)
			{
				current_position_x--;
				refresh_position_flag();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}

	case 's':
		if (current_position_y + 1 <  map.size())
		{
			if (map.at(current_position_y + 1).at(current_position_x) != 1)
			{
				current_position_y++;
				refresh_position_flag();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}

	case 'd':
		if (current_position_x + 1 < map.at(current_position_y).size())
		{
			if (map.at(current_position_y).at(current_position_x + 1) != 1)
			{
				current_position_x++;
				refresh_position_flag();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	
	map.at(1).at(1) = 200;
}

bool Field::moveUp(void)
{
	return move('w');
}

bool Field::moveDown(void)
{
	return move('s');
}

bool Field::moveLeft(void)
{
	return move('a');
}

bool Field::moveRight(void)
{
	return move('d');
}

int Field::getCurrentPositionX(void) const
{
	return current_position_x;
}

int Field::getCurrentPositionY(void) const
{
	return current_position_y;
}

int Field::getVisionWidth(void) const
{
	return vision_width;
}

int Field::getVisionHight(void) const
{
	return vision_height;
}

string Field::getMapName(void) const
{
	return map_name;
}

int Field::getMapSymbol(int row, int column)
{
	if (row >= 0 && row < map.at(0).size() && column >= 0 && column < map.size())
	{
		return map.at(row).at(column);
	}
	else
	{
		return -1;
	}
}

int Field::getTotalMapCount(void)
{
	return map_count;
}

void Field::setPosition(int row, int column)
{
	if (row >= 0 && row < map.at(0).size() && column >= 0 && column < map.size())
	{
		current_position_x = column;
		current_position_y = row;
	}
	refresh_position_flag();
	
}

void Field::setMapSymbol(int symbol, int row, int column)
{
	if (row >= 0 && row < map.at(0).size() && column >= 0 && column < map.size() && symbol != -1)
	{
		map.at(row).at(column) = symbol;
	}
}

void Field::setVisionSize(int height, int width)
{
	if (width > 0 && width <= map.at(0).size() && height > 0 && height <= map.size())
	{
		vision_width = width;
		vision_height = height;
	}
	else
	{
		vision_width = map.at(0).size();
		vision_height = map.size();
	}
}

Tag Field::getEvent()
{
	switch (last_step)
	{
	case 253:
		last_step = 0;
		return monster;
	case 250:
		return monster;
	case 251:
		return JW;
	case 400:
		last_step = 0;
		return bonus;
	case 403:
		last_step = 0;
		return partner;
	case 600:
		return previous_field;
	case 601:
		return next_field;
	default :
		return none;
	}
}

void Field::display(int space) const
{
	vector<vector<string>> display_map;
	display_map.clear();
	int cursor = 0;
	display_map.resize(vision_height);
	for (int i = 0; i < display_map.size(); i++)
	{
		display_map.at(i).resize(vision_width);
	}

	for (int y = current_position_y - vision_height / 2 + 1; y <= current_position_y + vision_height / 2; y++)
	{
		for (int x = current_position_x - vision_width / 2 + 1; x <= current_position_x + vision_width / 2; x++)
		{
			if (x < 0 || y < 0 || x >= map.at(0).size() || y >= map.size())
			{
				display_map.at(cursor / vision_width).at(cursor % vision_width) = "  ";
			}
			else
			{
				switch (map.at(y).at(x))
				{
				case 0://Pavement
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "  ";
					break;
				case 1://Wall
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "ùþ";
					break;
				case 2:
					display_map.at(cursor / vision_height).at(cursor % vision_width) = "¡¶";
					break;
				case 200://Start Point
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "SS";
					break;
				case 201:
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "en";
					break;
				case 250:
					display_map.at(cursor / vision_width).at(cursor % vision_width) = ":(";
					break;
				case 251:
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "X(";
					break;
				//case 400:
					//display_map.at(cursor / vision_width).at(cursor % vision_width) = "XX";
					//break;
				case 600:
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "PR";
					break;
				case 601:
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "NX";
					break;
				default:
					display_map.at(cursor / vision_width).at(cursor % vision_width) = "??";
					break;
				}
			}
			cursor++;
		}
	}

	for (int sp = 0; sp < space; sp++)
	{
		cout << " ";
	}
	cout << " ";
	for (int i = 0; i < display_map.at(0).size(); i++)
	{
		cout << "==";
	}
	cout << endl;
	for (int i = 0; i < display_map.size(); i++)
	{
		for (int sp = 0; sp < space; sp++)
		{
			cout << " ";
		}
		cout << "|";
		for (int j = 0; j < display_map.size(); j++)
		{
			cout << display_map.at(i).at(j);
		}
		cout << "|" << endl;
	}

	for (int sp = 0; sp < space; sp++)
	{
		cout << " ";
	}
	cout << " ";
	for (int i = 0; i < display_map.at(0).size(); i++)
	{
		cout << "==";
	}
	cout << endl;
}

void Field::refresh_position_flag(void)
{
	int temp;
	temp = map.at(current_position_y).at(current_position_x);
	map.at(last_position_y).at(last_position_x) = last_step;
	map.at(current_position_y).at(current_position_x) = 2;

	last_step = temp;
	last_position_x = current_position_x;
	last_position_y = current_position_y;
}

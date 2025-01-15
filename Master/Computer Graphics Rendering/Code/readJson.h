#ifndef READJSON_H
#define READJSON_H

#include <iostream>
#include <fstream>
#include <nlohmann_json.hpp>

using json = nlohmann::json;

// Function to read JSON data from a file
json readJson(const std::string &filepath);

#endif // READJSON_H

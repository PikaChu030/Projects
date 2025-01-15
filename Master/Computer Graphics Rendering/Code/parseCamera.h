#ifndef CAMERAPARSER_H
#define CAMERAPARSER_H

#include <nlohmann_json.hpp> // Assuming you're using the nlohmann/json library
#include "Vec3.h"
#include "Camera.h"

using json = nlohmann::json;

// Function to parse a Vec3 from a JSON object given a key
Vec3 parseVec3(const json &js, const std::string &key);

// Function to parse camera data from a JSON object
Camera parseCamera(const json &cameraData);

#endif // CAMERAPARSER_H

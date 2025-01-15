#ifndef LOAD_LIGHTS_H
#define LOAD_LIGHTS_H

#include <vector>
#include <nlohmann_json.hpp>
#include "Vec3.h"
#include "Light.h"

using json = nlohmann::json;

// Function to load lights from scene data in a JSON object
void loadLights(const json &sceneData, std::vector<Light *> &lights);

// Function to parse Vec3 data from a JSON object
Vec3 parseVec3(const json &j, const std::string &key);

#endif // LOAD_LIGHTS_H

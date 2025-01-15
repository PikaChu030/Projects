#ifndef PARSEMATERIAL_H
#define PARSEMATERIAL_H

#include <string>
#include <nlohmann_json.hpp>
#include "Vec3.h"
#include "Material.h"
#include "Texture.h"

using json = nlohmann::json;

// Function to parse material data from a JSON object
Material parseMaterial(const json &materialData);

// Function to parse Vec3 data from a JSON object
Vec3 parseVec3(const json &j, const std::string &key);

#endif // PARSEMATERIAL_H

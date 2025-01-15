#ifndef PROCESS_SCENE_H
#define PROCESS_SCENE_H

#include <string>
#include <vector>
#include <fstream>
#include <nlohmann_json.hpp>
#include "Camera.h"
#include "Light.h"
#include "Shape.h"
#include "Sphere.h"
#include "Cylinder.h"
#include "Triangle.h"
#include "Vec3.h"
#include "parseCamera.h"
#include "parseMaterial.h"
#include "loadLights.h"
#include "readJson.h"
#include "render.h"

using json = nlohmann::json;

// Function to process the scene from the input file and save the rendered output to a file
void processScene(const std::string &inputFile, const std::string &outputFile);

// Function to parse Vec3 data from a JSON object
Vec3 parseVec3(const json &j, const std::string &key);

#endif // PROCESS_SCENE_H

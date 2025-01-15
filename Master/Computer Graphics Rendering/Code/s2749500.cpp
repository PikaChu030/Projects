#define STB_IMAGE_IMPLEMENTATION

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cmath>
#include <algorithm>
#include <cstdint>
#include <nlohmann_json.hpp>
#include "stb_image.h"
#include <random>
#include "Vec3.h"
#include "Texture.h"
#include "Material.h"
#include "Light.h"
#include "Ray.h"
#include "AABB.h"
#include "Camera.h"
#include "parseCamera.h"
#include "sampleBRDF.h"
#include "Shape.h"
#include "BVHNode.h"
#include "Sphere.h"
#include "Triangle.h"
#include "Cylinder.h"
#include "readJson.h"
#include "generateRay.h"
#include "parseMaterial.h"
#include "isInShadow.h"
#include "blinnPhongShading.h"
#include "directLightSampling.h"
#include "reflect.h"
#include "refract.h"
#include "castRay.h"
#include "loadLights.h"
#include "toneMap.h"
#include "render.h"
#include "processScene.h"

using json = nlohmann::json;

// Forward Declaration
void processScene(const std::string &inputFile, const std::string &outputFile);

int main()
{
    std::vector<std::string> inputFiles = {
        "binary_scene.json", "binary_primitives.json", "phong_scene.json",
        "simple_phong.json", "mirror_image.json", "simple_texture.json",
        "mirror_thinlens.json", "mirror_BRDF.json", "scene_selfcreate.json",
        "funny_face.json"};
    std::vector<std::string> outputFiles = {
        "binary_scene.ppm", "binary_primitives.ppm", "phong_scene.ppm",
        "simple_phong.ppm", "mirror_image.ppm", "simple_texture.ppm",
        "mirror_thinlens.ppm", "mirror_BRDF.ppm", "scene_selfcreate.ppm",
        "funny_face.ppm"};

    if (inputFiles.size() != outputFiles.size())
    {
        std::cerr << "Input and output file lists must have the same length." << std::endl;
        return 1;
    }
    for (size_t i = 0; i < inputFiles.size(); ++i)
    {
        processScene(inputFiles[i], outputFiles[i]);
    }
    return 0;
}

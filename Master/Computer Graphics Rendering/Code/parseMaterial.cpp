#include "parseMaterial.h"

// Function to parse material data from a JSON object
Material parseMaterial(const json &materialData) {
    // Parse diffuse color with default value
    Vec3 diffuseColor = materialData.contains("diffusecolor")
                            ? parseVec3(materialData, "diffusecolor")
                            : Vec3(1, 1, 1);

    // Parse specular color with default value
    Vec3 specularColor = materialData.contains("specularcolor")
                             ? parseVec3(materialData, "specularcolor")
                             : Vec3(1, 1, 1);

    // Parse texture file path and load texture if present
    std::string textureFile = materialData.value("texture", "");
    Texture *texture = nullptr;
    if (!textureFile.empty()) {
        texture = new Texture(textureFile);
    }

    // Construct and return a Material object using parsed values
    return Material(
        materialData.value("ks", 0.0f),               // Specular reflection coefficient
        materialData.value("kd", 1.0f),               // Diffuse reflection coefficient
        materialData.value("specularexponent", 1.0f), // Specular exponent
        diffuseColor,                                 // Diffuse color
        specularColor,                                // Specular color
        materialData.value("isreflective", false),    // Reflective property
        materialData.value("isrefractive", false),    // Refractive property
        materialData.value("reflectivity", 1.0f),     // Reflectivity
        materialData.value("refractiveindex", 1.0f),  // Refractive index
        materialData.value("useBRDFsampling", false), // BRDF sampling flag
        texture);                                     // Texture pointer
}

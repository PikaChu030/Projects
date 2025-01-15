#include "Material.h"

// Default constructor initializing material with default properties
Material::Material()
    : ks(0), kd(0), specularExponent(1), reflectivity(1), refractiveIndex(1),
      diffuseColor(1, 1, 1), specularColor(1, 1, 1),
      isReflective(false), isRefractive(false), useBRDFsampling(false),
      texture(nullptr) {}

// Parameterized constructor for customized material properties
Material::Material(float ks, float kd, float specExp, Vec3 diffColor, Vec3 specColor,
                   bool isRefl, bool isRefr, float refl, float refrIdx, bool useBRDF, Texture *tex)
    : ks(ks), kd(kd), specularExponent(specExp), reflectivity(refl), refractiveIndex(refrIdx),
      diffuseColor(diffColor), specularColor(specColor), isReflective(isRefl),
      isRefractive(isRefr), useBRDFsampling(useBRDF), texture(tex) {}

#ifndef MATERIAL_H
#define MATERIAL_H

#include "Vec3.h"
#include "Texture.h"

// Define a Material class to encapsulate material properties for rendering
struct Material
{
    // Coefficients for specular and diffuse shading
    float ks; // Specular reflection coefficient
    float kd; // Diffuse reflection coefficient

    // Exponent for the specular highlights
    float specularExponent;

    // Reflectivity and refractive index for reflective and refractive materials
    float reflectivity;
    float refractiveIndex;

    // Colors for diffuse and specular reflection
    Vec3 diffuseColor;
    Vec3 specularColor;

    // Booleans to define material properties
    bool isReflective;    // Indicates if the material is reflective
    bool isRefractive;    // Indicates if the material is refractive
    bool useBRDFsampling; // Indicates if BRDF sampling is used

    // Pointer to a texture for the material (can be null if no texture is used)
    Texture *texture;

    // Default constructor initializing material with default properties
    Material();

    // Parameterized constructor for customized material properties
    Material(float ks, float kd, float specExp, Vec3 diffColor, Vec3 specColor,
             bool isRefl, bool isRefr, float refl, float refrIdx, bool useBRDF, Texture *tex = nullptr);
};

#endif // MATERIAL_H

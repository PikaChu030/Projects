#ifndef SAMPLEBRDF_H
#define SAMPLEBRDF_H

#include <random>
#include <cmath>
#include "Material.h"
#include "Vec3.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

Vec3 reflect(const Vec3 &I, const Vec3 &N);

// Function to sample the Bidirectional Reflectance Distribution Function (BRDF)
// Generates a reflection vector for improved light sampling
Vec3 sampleBRDF(const Material &material, const Vec3 &normal, const Vec3 &viewDir);

#endif // SAMPLEBRDF_H

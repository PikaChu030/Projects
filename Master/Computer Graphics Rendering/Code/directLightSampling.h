#ifndef DIRECT_LIGHT_SAMPLING_H
#define DIRECT_LIGHT_SAMPLING_H

#include <vector>
#include <random>
#include <algorithm>
#include "Vec3.h"
#include "Material.h"
#include "Light.h"
#include "Shape.h"
#include "isInShadow.h"

// Function to perform direct light sampling for a given point
Vec3 directLightSampling(
    const Vec3 &point, const Vec3 &normal, const Material &material,
    const Vec3 &viewDir, const std::vector<Light *> &lights,
    const std::vector<Shape *> &shapes);

#endif // DIRECT_LIGHT_SAMPLING_H

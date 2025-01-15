#ifndef BLINN_PHONG_SHADING_H
#define BLINN_PHONG_SHADING_H

#include <vector>
#include <algorithm>
#include "Vec3.h"
#include "Material.h"
#include "Light.h"
#include "Shape.h"
#include "isInShadow.h"

// Function to calculate color using the Blinn-Phong shading model
Vec3 blinnPhongShading(
    const Vec3 &point, const Vec3 &normal, const Material &material,
    const Vec3 &viewDir, const std::vector<Light *> &lights,
    const std::vector<Shape *> &shapes);

#endif // BLINN_PHONG_SHADING_H

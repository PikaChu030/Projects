#ifndef CAST_RAY_H
#define CAST_RAY_H

#include <vector>
#include <algorithm>
#include "Vec3.h"
#include "Material.h"
#include "Light.h"
#include "Shape.h"
#include "Ray.h"
#include "reflect.h"
#include "refract.h"

// Function to perform ray casting and determine the color seen by a ray in the scene
Vec3 castRay(
    const Ray &ray,
    const std::vector<Shape *> &shapes,
    const std::vector<Light *> &lights,
    int depth = 5);

#endif // CAST_RAY_H

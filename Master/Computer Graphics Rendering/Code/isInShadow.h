#ifndef IS_IN_SHADOW_H
#define IS_IN_SHADOW_H

#include <vector>
#include "Vec3.h"
#include "Light.h"
#include "Ray.h"
#include "Shape.h"

// Function to check if a point is in shadow
bool isInShadow(const Vec3 &point, const Light &light, const std::vector<Shape *> &shapes, float &shadowFactor);

#endif // IS_IN_SHADOW_H

#ifndef GENERATE_RAY_H
#define GENERATE_RAY_H

#include <random>
#include <cmath>
#include "Vec3.h"
#include "Camera.h"
#include "Ray.h"

// Function to generate a ray from the camera based on normalized screen coordinates
Ray generateRay(float x, float y, const Camera &camera, int width, int height);

#endif // GENERATE_RAY_H

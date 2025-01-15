#ifndef RENDER_H
#define RENDER_H

#include <vector>
#include <string>
#include <random>
#include <algorithm>
#include "Vec3.h"
#include "Camera.h"
#include "Light.h"
#include "Shape.h"
#include "Ray.h"
#include "castRay.h"
#include "generateRay.h"
#include "toneMap.h"

// Function to render the scene based on the given render mode
void render(
    const std::string &renderMode,
    const Camera &camera,
    int width,
    int height,
    const std::vector<Light *> &lights,
    const std::vector<Shape *> &shapes,
    std::vector<uint8_t> &image);

#endif // RENDER_H

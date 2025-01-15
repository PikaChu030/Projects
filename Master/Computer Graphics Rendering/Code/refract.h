#ifndef REFRACT_H
#define REFRACT_H

#include <algorithm>
#include "Vec3.h"

// Function to calculate the refraction of a vector using Snell's law
bool refract(const Vec3 &I, const Vec3 &N, float eta, Vec3 &refracted);

#endif // REFRACT_H

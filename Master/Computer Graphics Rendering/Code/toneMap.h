#ifndef TONE_MAP_H
#define TONE_MAP_H

#include "Vec3.h"

// Function to apply tone mapping using a filmic curve
Vec3 toneMap(const Vec3 &hdrColor);

#endif // TONE_MAP_H

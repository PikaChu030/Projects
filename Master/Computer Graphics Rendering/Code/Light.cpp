#include "Light.h"

// Constructor to initialize the light with specific position and intensity
Light::Light(const Vec3 &position, const Vec3 &intensity)
    : position(position), intensity(intensity) {}

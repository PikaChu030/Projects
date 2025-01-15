#include "Ray.h"

// Constructor to initialize the ray with a specific origin and direction
Ray::Ray(const Vec3 &origin, const Vec3 &direction)
    : origin(origin), direction(direction) {}

#ifndef RAY_H
#define RAY_H

#include "Vec3.h" // Assuming Vec3 is defined in Vec3.h

// Define a Ray struct to represent a ray in 3D space
struct Ray {
    // Origin point of the ray
    Vec3 origin;

    // Direction vector of the ray, typically normalized
    Vec3 direction;

    // Constructor to initialize the ray with a specific origin and direction
    Ray(const Vec3 &origin, const Vec3 &direction);
};

#endif // RAY_H

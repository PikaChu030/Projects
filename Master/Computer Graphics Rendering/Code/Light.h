#ifndef LIGHT_H
#define LIGHT_H

#include "Vec3.h" // Assuming Vec3 is defined in Vec3.h

// Define a Light class to represent light source properties in the scene
struct Light {
    // Position of the light source in 3D space
    Vec3 position;

    // Intensity of the light, represented as a color vector
    Vec3 intensity;

    // Constructor to initialize the light with specific position and intensity
    Light(const Vec3 &position, const Vec3 &intensity);
};

#endif // LIGHT_H

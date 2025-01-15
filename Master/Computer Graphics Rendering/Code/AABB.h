#ifndef AABB_H
#define AABB_H

#include "Vec3.h"
#include "Ray.h" // Assuming Ray is defined in Ray.h

// Define an Axis-Aligned Bounding Box (AABB) for intersection tests
struct AABB {
    // Minimum and maximum corners of the bounding box
    Vec3 min;
    Vec3 max;

    // Default constructor initializes the AABB to an invalid state
    AABB();

    // Parameterized constructor to initialize the box with specific min and max corners
    AABB(const Vec3 &min, const Vec3 &max);

    // Method to check if a ray intersects with the bounding box
    bool intersect(const Ray &ray, float tmin, float tmax) const;

    // Static method to create a new AABB that encompasses two given AABBs
    static AABB surroundingBox(const AABB &box0, const AABB &box1);
};

#endif // AABB_H

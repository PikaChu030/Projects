#include "AABB.h"
#include <algorithm> // For std::swap, std::fmin, std::fmax

// Default constructor initializes the AABB to an invalid state
AABB::AABB()
    : min(Vec3(INFINITY, INFINITY, INFINITY)),
      max(Vec3(-INFINITY, -INFINITY, -INFINITY)) {}

// Parameterized constructor to initialize the box with specific min and max corners
AABB::AABB(const Vec3 &min, const Vec3 &max)
    : min(min), max(max) {}

// Method to check if a ray intersects with the bounding box
bool AABB::intersect(const Ray &ray, float tmin, float tmax) const {
    // Loop over x, y, z axes
    for (int i = 0; i < 3; ++i) {
        float invD = 1.0f / ray.direction[i];       // Calculate inverse of the ray direction component
        float t0 = (min[i] - ray.origin[i]) * invD; // Intersection with the near slab
        float t1 = (max[i] - ray.origin[i]) * invD; // Intersection with the far slab

        // Swap if invD is negative to ensure t0 is the near intersection
        if (invD < 0.0f) {
            std::swap(t0, t1);
        }

        // Update tmin and tmax to find the interval of intersection along the ray
        tmin = t0 > tmin ? t0 : tmin; // Choose the larger t0
        tmax = t1 < tmax ? t1 : tmax; // Choose the smaller t1

        // If the intersection is invalid, return false
        if (tmax <= tmin) {
            return false;
        }
    }
    return true; // Ray intersects the bounding box
}

// Static method to create a new AABB that encompasses two given AABBs
AABB AABB::surroundingBox(const AABB &box0, const AABB &box1) {
    // Calculate new min and max by combining both boxes
    Vec3 small(
        std::fmin(box0.min.x, box1.min.x),
        std::fmin(box0.min.y, box1.min.y),
        std::fmin(box0.min.z, box1.min.z));
    Vec3 big(
        std::fmax(box0.max.x, box1.max.x),
        std::fmax(box0.max.y, box1.max.y),
        std::fmax(box0.max.z, box1.max.z));

    return AABB(small, big); // Return the encompassing AABB
}

#ifndef SPHERE_H
#define SPHERE_H

#include "Shape.h"
#include "Vec3.h"
#include "Ray.h"
#include "AABB.h"

// Sphere class to represent sphere objects, derived from the Shape class
class Sphere : public Shape {
    // Center point of the sphere
    Vec3 center;

    // Radius of the sphere
    float radius;

public:
    // Constructor to initialize the sphere with a center, radius, and material
    Sphere(const Vec3 &center, float radius, const Material &material);

    // Method to check if a ray intersects with the sphere
    bool intersect(const Ray &ray, float &t) const override;

    // Method to compute the surface normal at a given point on the sphere
    Vec3 computeNormal(const Vec3 &p) const override;

    // Method to compute the bounding box of the sphere
    bool boundingBox(AABB &output_box) const override;

    // Method to calculate the color of the sphere at a point, taking into account textures and lighting
    Vec3 getColor(
        const Vec3 &p, const Vec3 &viewDir,
        const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const override;
};

#endif // SPHERE_H

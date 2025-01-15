#ifndef CYLINDER_H
#define CYLINDER_H

#include "Shape.h"
#include "Vec3.h"
#include "Ray.h"
#include "AABB.h"

// Cylinder class to represent cylinder objects, derived from the Shape class
class Cylinder : public Shape {
    // Center point of the cylinder's base
    Vec3 center;

    // Axis direction of the cylinder, should be normalized
    Vec3 axis;

    // Radius of the cylinder
    float radius;

    // Height of the cylinder
    float height;

public:
    // Constructor to initialize the cylinder with properties and material
    Cylinder(const Vec3 &center, const Vec3 &axis, float radius, float height, const Material &material);

    // Method to check if a ray intersects with the cylinder
    bool intersect(const Ray &ray, float &t) const override;

    // Method to compute the normal at a given point on the cylinder surface
    Vec3 computeNormal(const Vec3 &p) const override;

    // Method to compute the bounding box of the cylinder
    bool boundingBox(AABB &output_box) const override;

    // Method to calculate the color at a point on the cylinder, considering texture mapping
    Vec3 getColor(
        const Vec3 &p, const Vec3 &viewDir,
        const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const override;
};

#endif // CYLINDER_H

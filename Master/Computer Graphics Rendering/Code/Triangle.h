#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <cmath>
#include <algorithm>
#include "Shape.h"
#include "Vec3.h"
#include "Ray.h"
#include "AABB.h"

// Triangle class to represent triangle objects, derived from the Shape class
class Triangle : public Shape {
    // Vertex positions of the triangle
    Vec3 v0, v1, v2;

    // Pre-computed normal of the triangle
    Vec3 normal;

public:
    // Constructor to initialize the triangle with vertices and material
    Triangle(const Vec3 &v0, const Vec3 &v1, const Vec3 &v2, const Material &material);

    // Method to check if a ray intersects with the triangle using the Möller-Trumbore algorithm
    bool intersect(const Ray &ray, float &t) const override;

    // Method to compute the surface normal at any point on the triangle (constant for flat triangles)
    Vec3 computeNormal(const Vec3 &p) const override;

    // Method to compute the axis-aligned bounding box of the triangle
    bool boundingBox(AABB &output_box) const override;

    // Method to calculate the color of the triangle at a point, using textures if available
    Vec3 getColor(
        const Vec3 &p, const Vec3 &viewDir,
        const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const override;
};

#endif // TRIANGLE_H

#ifndef SHAPE_H
#define SHAPE_H

#include <vector>
#include "Material.h"
#include "Ray.h"
#include "Vec3.h"
#include "AABB.h"
#include "Light.h"
#include "SampleBRDF.h"

// Abstract base class to represent geometric shapes
class Shape
{
protected:
    // Material property of the shape
    Material material;

public:
    // Constructor that initializes the shape with a given material
    Shape(const Material &material);

    // Pure virtual function for ray intersection, must be implemented by subclasses
    virtual bool intersect(const Ray &ray, float &t) const = 0;

    // Pure virtual function to compute the surface normal at a given point, must be implemented by subclasses
    virtual Vec3 computeNormal(const Vec3 &p) const = 0;

    // Method to calculate the color at a point, taking into account lighting
    virtual Vec3 getColor(
        const Vec3 &p, const Vec3 &viewDir,
        const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const;

    // Pure virtual function to compute the bounding box of the shape, must be implemented by subclasses
    virtual bool boundingBox(AABB &output_box) const = 0;

    // Virtual destructor for cleanup and subclass handling
    virtual ~Shape() = default;

    // Accessor for the material property
    const Material &getMaterial() const;
};

Vec3 directLightSampling(const Vec3 &point, const Vec3 &normal, const Material &material, const Vec3 &viewDir, const std::vector<Light *> &lights, const std::vector<Shape *> &shapes);

#endif // SHAPE_H

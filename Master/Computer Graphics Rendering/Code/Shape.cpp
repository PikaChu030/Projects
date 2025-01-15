#include "Shape.h"

// Constructor that initializes the shape with a given material
Shape::Shape(const Material &material) : material(material) {}

// Method to calculate the color at a point, taking into account lighting
Vec3 Shape::getColor(
    const Vec3 &p, const Vec3 &viewDir,
    const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const
{
    // Compute the surface normal at the point
    Vec3 normal = computeNormal(p);

    // If the material uses BRDF sampling, calculate color using BRDF
    if (material.useBRDFsampling)
    {
        return sampleBRDF(material, normal, viewDir);
    }

    // Calculate color using direct light sampling otherwise
    return directLightSampling(p, normal, material, viewDir, lights, shapes);
}

// Accessor for the material property
const Material &Shape::getMaterial() const { return material; }

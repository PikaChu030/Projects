#include "Sphere.h"

// Constructor to initialize the sphere with a center, radius, and material
Sphere::Sphere(const Vec3 &center, float radius, const Material &material)
    : Shape(material), center(center), radius(radius) {}

// Method to check if a ray intersects with the sphere
bool Sphere::intersect(const Ray &ray, float &t) const {
    Vec3 oc = ray.origin - center;              // Vector from ray origin to sphere center
    float a = ray.direction.dot(ray.direction); // Dot product of direction
    float b = 2.0f * oc.dot(ray.direction);     // 2*Dot product for equation
    float c = oc.dot(oc) - radius * radius;     // Distance squared minus radius squared
    float discriminant = b * b - 4 * a * c;     // Calculate discriminant for quadratic formula

    // No intersection if discriminant is negative
    if (discriminant < 0) {
        return false;
    } else {
        // Calculate the intersection point using the quadratic formula
        t = (-b - std::sqrt(discriminant)) / (2.0f * a);
        return t > 0;
    }
}

// Method to compute the surface normal at a given point on the sphere
Vec3 Sphere::computeNormal(const Vec3 &p) const {
    return (p - center).normalize(); // Normal is the normalized vector from center to point
}

// Method to compute the bounding box of the sphere
bool Sphere::boundingBox(AABB &output_box) const {
    Vec3 rVec(radius, radius, radius);               // Vector representing the radius in all directions
    output_box = AABB(center - rVec, center + rVec); // AABB from min to max corner
    return true;
}

// Method to calculate the color of the sphere at a point, taking into account textures and lighting
Vec3 Sphere::getColor(
    const Vec3 &p, const Vec3 &viewDir,
    const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const {
    // Get the base color using parent class method
    Vec3 baseColor = Shape::getColor(p, viewDir, shapes, lights);

    // Apply texture mapping if a texture is present
    if (material.texture) {
        // Calculate texture coordinates (u, v) based on spherical coordinates
        float u = 0.5f + atan2(p.z - center.z, p.x - center.x) / (2 * M_PI);
        float v = 0.5f - asin((p.y - center.y) / radius) / M_PI;

        // Sample the texture color and modulate the base color
        Vec3 textureColor = material.texture->sample(u, v);
        baseColor *= textureColor;
    }

    return baseColor; // Return the modulated color
}

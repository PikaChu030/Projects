#include "Cylinder.h"

// Constructor to initialize the cylinder with properties and material
Cylinder::Cylinder(const Vec3 &center, const Vec3 &axis, float radius, float height, const Material &material)
    : Shape(material), center(center), axis(axis.normalize()), radius(radius), height(height) {}

// Method to check if a ray intersects with the cylinder
bool Cylinder::intersect(const Ray &ray, float &t) const {
    // Calculate ray direction and origin relative to the cylinder's center
    Vec3 oc = ray.origin - center;
    Vec3 d = ray.direction;
    Vec3 a = axis;

    // Project the ray direction and origin onto the plane perpendicular to the cylinder's axis
    Vec3 d_prime = d - a * d.dot(a);
    Vec3 oc_prime = oc - a * oc.dot(a);

    // Calculate quadratic coefficients for intersection equation
    float A = d_prime.dot(d_prime);
    float B = 2.0f * d_prime.dot(oc_prime);
    float C = oc_prime.dot(oc_prime) - radius * radius;

    // Calculate discriminant
    float discriminant = B * B - 4 * A * C;
    if (discriminant < 0) {
        return false;
    }

    // Quadratic solution: find the intersection points t0 and t1
    float sqrt_discriminant = std::sqrt(discriminant);
    float t0 = (-B - sqrt_discriminant) / (2.0f * A);
    float t1 = (-B + sqrt_discriminant) / (2.0f * A);

    // Ensure t0 is the closer intersection
    if (t0 > t1)
        std::swap(t0, t1);

    // Calculate potential intersection point
    Vec3 p0 = ray.origin + d * t0;
    float y0 = (p0 - center).dot(a);

    // Check if the intersection is within the cylinder caps
    if (y0 < 0 || y0 > height) {
        Vec3 p1 = ray.origin + d * t1;
        float y1 = (p1 - center).dot(a);
        if (y1 < 0 || y1 > height)
            return false;
        t0 = t1;
    }

    // Check if the intersection is behind the ray's origin
    if (t0 < 0)
        return false;
    t = t0;
    return true;
}

// Method to compute the normal at a given point on the cylinder surface
Vec3 Cylinder::computeNormal(const Vec3 &p) const {
    Vec3 pc = p - center;
    Vec3 projection = axis * pc.dot(axis);
    return (pc - projection).normalize(); // Normal is perpendicular to the axis
}

// Method to compute the bounding box of the cylinder
bool Cylinder::boundingBox(AABB &output_box) const {
    Vec3 rVec(radius, radius, height);
    output_box = AABB(center - rVec, center + rVec);
    return true;
}

// Method to calculate the color at a point on the cylinder, considering texture mapping
Vec3 Cylinder::getColor(
    const Vec3 &p, const Vec3 &viewDir,
    const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const {
    // Get base color using the parent class method
    Vec3 baseColor = Shape::getColor(p, viewDir, shapes, lights);

    // Apply texture mapping if a texture is present
    if (material.texture) {
        // Calculate cylindrical coordinates for texture mapping
        Vec3 dir = p - center;
        float theta = atan2(dir.z, dir.x);     // Angle around the axis
        float u = (theta + M_PI) / (2 * M_PI); // Map angle to [0, 1]
        float v = dir.dot(axis) / height;      // Proportion along the height

        // Sample texture color and modulate the base color
        Vec3 textureColor = material.texture->sample(u, v);
        baseColor *= textureColor;
    }

    return baseColor; // Return the final color
}

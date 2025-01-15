#include "Triangle.h"

// Constructor to initialize the triangle with vertices and material
Triangle::Triangle(const Vec3 &v0, const Vec3 &v1, const Vec3 &v2, const Material &material)
    : Shape(material), v0(v0), v1(v1), v2(v2) {
    // Compute and store the normal vector for the triangle
    normal = (v1 - v0).cross(v2 - v0).normalize();
}

// Method to check if a ray intersects with the triangle using the Möller-Trumbore algorithm
bool Triangle::intersect(const Ray &ray, float &t) const {
    const float EPSILON = 1e-5;
    Vec3 edge1 = v1 - v0;
    Vec3 edge2 = v2 - v0;
    Vec3 h = ray.direction.cross(edge2);
    float a = edge1.dot(h);

    // Check if the ray is parallel to the triangle
    if (std::abs(a) < EPSILON)
        return false;

    float f = 1.0f / a;
    Vec3 s = ray.origin - v0;
    float u = f * s.dot(h);

    // Check if the intersection lies outside the triangle
    if (u < 0.0f || u > 1.0f)
        return false;

    Vec3 q = s.cross(edge1);
    float v = f * ray.direction.dot(q);
    if (v < 0.0f || u + v > 1.0f)
        return false;

    // Calculate t to find out where the intersection point is on the ray
    t = f * edge2.dot(q);
    return t > EPSILON;
}

// Method to compute the surface normal at any point on the triangle (constant for flat triangles)
Vec3 Triangle::computeNormal(const Vec3 &p) const {
    return normal;
}

// Method to compute the axis-aligned bounding box of the triangle
bool Triangle::boundingBox(AABB &output_box) const {
    // Compute the minimum and maximum points for the bounding box
    Vec3 minVec(
        std::min({v0.x, v1.x, v2.x}),
        std::min({v0.y, v1.y, v2.y}),
        std::min({v0.z, v1.z, v2.z}));

    Vec3 maxVec(
        std::max({v0.x, v1.x, v2.x}),
        std::max({v0.y, v1.y, v2.y}),
        std::max({v0.z, v1.z, v2.z}));

    output_box = AABB(minVec, maxVec);
    return true;
}

// Method to calculate the color of the triangle at a point, using textures if available
Vec3 Triangle::getColor(
    const Vec3 &p, const Vec3 &viewDir,
    const std::vector<Shape *> &shapes, const std::vector<Light *> &lights) const {
    // Get the base color using parent class method
    Vec3 baseColor = Shape::getColor(p, viewDir, shapes, lights);

    // Apply texture mapping using barycentric coordinates if a texture is present
    if (material.texture) {
        // Calculate barycentric coordinates for texture mapping
        Vec3 edge1 = v1 - v0;
        Vec3 edge2 = v2 - v0;
        Vec3 vp = p - v0;
        float d00 = edge1.dot(edge1);
        float d01 = edge1.dot(edge2);
        float d11 = edge2.dot(edge2);
        float d20 = vp.dot(edge1);
        float d21 = vp.dot(edge2);
        float denom = d00 * d11 - d01 * d01;
        float v = (d11 * d20 - d01 * d21) / denom;
        float w = (d00 * d21 - d01 * d20) / denom;
        float u = 1.0f - v - w;

        // Sample the texture color using the barycentric coordinates
        Vec3 tColor = material.texture->sample(u, v);
        baseColor *= tColor;
    }

    return baseColor; // Return the modulated color
}

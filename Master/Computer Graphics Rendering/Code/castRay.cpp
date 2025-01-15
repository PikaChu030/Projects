#include "castRay.h"

// Function to perform ray casting and determine the color seen by a ray in the scene
Vec3 castRay(
    const Ray &ray,
    const std::vector<Shape *> &shapes,
    const std::vector<Light *> &lights,
    int depth)
{
    // Background color to return if no intersection occurs
    Vec3 backgroundColor(0.25, 0.25, 0.25);

    // Terminate recursion if depth limit is reached
    if (depth <= 0)
        return backgroundColor;

    float closestT = INFINITY; // Closest intersection distance
    Shape *hitShape = nullptr; // Pointer to the shape that is hit

    // Iterate over shapes to find the closest intersection
    for (const auto &shape : shapes)
    {
        float t;
        if (shape->intersect(ray, t) && t < closestT)
        {
            closestT = t;
            hitShape = shape;
        }
    }

    // If no shape is hit, return the background color
    if (!hitShape)
        return backgroundColor;

    // Calculate hit point and normal at the intersection
    Vec3 hitPoint = ray.origin + ray.direction * closestT;
    Vec3 normal = hitShape->computeNormal(hitPoint);
    Vec3 viewDir = -ray.direction;

    // Ensure normal is pointing against the view direction
    if (normal.dot(viewDir) < 0)
        normal = -normal;

    // Retrieve material of the hit shape
    const Material &material = hitShape->getMaterial();

    // Get the base color from the hit shape
    Vec3 color = hitShape->getColor(hitPoint, viewDir, shapes, lights);

    // Handle reflective materials
    if (material.isReflective)
    {
        Vec3 reflectedDir = reflect(-viewDir, normal).normalize();
        Ray reflectedRay(hitPoint, reflectedDir);

        // Cast a ray in the reflected direction
        Vec3 reflectedColor = castRay(reflectedRay, shapes, lights, depth - 1);

        // Blend the reflected color with the base color
        color = (1.0f - material.reflectivity) * color + material.reflectivity * reflectedColor;
    }

    // Handle refractive materials
    if (material.isRefractive)
    {
        Vec3 refractedDir;
        if (refract(viewDir, normal, material.refractiveIndex, refractedDir))
        {
            Ray refractedRay(hitPoint, refractedDir);

            // Cast a ray in the refracted direction
            Vec3 refractedColor = castRay(refractedRay, shapes, lights, depth - 1);

            // Add refracted color contribution to the base color
            color += refractedColor * (1.0f - material.reflectivity);
        }
    }

    // Return the calculated color
    return color;
}

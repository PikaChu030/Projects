#include "isInShadow.h"

// Function to check if a point is in shadow
bool isInShadow(const Vec3 &point, const Light &light, const std::vector<Shape *> &shapes, float &shadowFactor)
{
    // Calculate the direction from the point to the light source
    Vec3 lightDir = (light.position - point).normalize();

    // Create a shadow ray just offset from the point to avoid self-intersection
    Ray shadowRay(point + lightDir * 0.001f, lightDir);

    float t;

    // Check for intersections with all shapes in the scene
    for (const auto &shape : shapes)
    {
        if (shape->intersect(shadowRay, t) && t > 0.001f)
        {
            // If intersection occurs, set shadow factor to indicate partial shadowing
            shadowFactor = 0.5f;
            return true; // Point is in shadow
        }
    }

    // If no intersections are found, set shadow factor to full light
    shadowFactor = 1.0f;
    return false; // Point is not in shadow
}

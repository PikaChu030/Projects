#include "blinnPhongShading.h"

// Function to calculate color using the Blinn-Phong shading model
Vec3 blinnPhongShading(
    const Vec3 &point, const Vec3 &normal, const Material &material,
    const Vec3 &viewDir, const std::vector<Light *> &lights,
    const std::vector<Shape *> &shapes)
{
    // Ambient component with a base intensity
    Vec3 ambient(0.1, 0.1, 0.1);
    Vec3 color = ambient * material.diffuseColor;

    // Iterate over all lights in the scene
    for (const auto &light : lights)
    {
        // Calculate the direction from the point to the light source
        Vec3 lightDir = (light->position - point).normalize();

        // Shadow factor to determine light attenuation due to occlusion
        float shadowFactor = 1.0f;

        // Check if the point is in shadow
        if (!isInShadow(point, *light, shapes, shadowFactor))
        {
            // Calculate the halfway vector between the light direction and view direction
            Vec3 halfwayDir = (lightDir + viewDir).normalize();

            // Diffuse component calculation using Lambert's cosine law
            float diff = std::max(normal.dot(lightDir), 0.0f);
            Vec3 diffuse = material.kd * diff * material.diffuseColor * light->intensity * shadowFactor;

            // Specular component calculation using the Blinn-Phong model
            float spec = std::pow(std::max(normal.dot(halfwayDir), 0.0f), material.specularExponent);
            Vec3 specular = material.ks * spec * material.specularColor * light->intensity * shadowFactor;

            // Accumulate diffuse and specular contributions
            color += diffuse + specular;
        }
    }

    // Return the calculated color
    return color;
}

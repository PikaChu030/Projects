#include "directLightSampling.h"

// Function to perform direct light sampling for a given point
Vec3 directLightSampling(
    const Vec3 &point, const Vec3 &normal, const Material &material,
    const Vec3 &viewDir, const std::vector<Light *> &lights,
    const std::vector<Shape *> &shapes) {

    Vec3 color(0, 0, 0);

    // Randomly select a light source for sampling
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, lights.size() - 1);
    int lightIndex = dis(gen);
    const Light &light = *lights[lightIndex];

    // Calculate the direction from the point to the selected light source
    Vec3 lightDir = (light.position - point).normalize();

    // Determine if the point is in shadow from this light
    float shadowFactor;
    if (!isInShadow(point, light, shapes, shadowFactor)) {
        // Calculate the halfway vector for the Blinn-Phong model
        Vec3 halfwayDir = (lightDir + viewDir).normalize();

        // Calculate diffuse component
        float diff = std::max(normal.dot(lightDir), 0.0f);
        Vec3 diffuse = material.kd * diff * material.diffuseColor * light.intensity * shadowFactor;

        // Calculate specular component
        float spec = std::pow(std::max(normal.dot(halfwayDir), 0.0f), material.specularExponent);
        Vec3 specular = material.ks * spec * material.specularColor * light.intensity * shadowFactor;

        // Accumulate diffuse and specular contributions
        color += diffuse + specular;
    }

    // Scale the result by the number of lights to account for the sampling
    return color * static_cast<float>(lights.size());
}

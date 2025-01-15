#include "SampleBRDF.h"

// Function to sample the Bidirectional Reflectance Distribution Function (BRDF)
// Generates a reflection vector for improved light sampling
Vec3 sampleBRDF(const Material &material, const Vec3 &normal, const Vec3 &viewDir)
{
    // Initialize random number generation
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(0.0, 1.0);

    // Generate random samples for BRDF
    float u1 = dis(gen);
    float u2 = dis(gen);

    // Calculate spherical coordinates for half-vector sampling
    float sinTheta = std::sqrt(1.0f - u1);
    float cosTheta = std::sqrt(u1);

    // Compute azimuthal angle
    float phi = 2.0f * M_PI * u2;

    // Convert spherical coordinates to Cartesian coordinates
    float x = sinTheta * std::cos(phi);
    float y = sinTheta * std::sin(phi);
    float z = cosTheta;

    // Create the half-vector
    Vec3 h(x, y, z);

    // Calculate the actual half-vector by combining with the view direction
    Vec3 halfVector = (h + viewDir).normalize();

    // Reflect the view direction about the half vector to generate the reflection direction
    return reflect(viewDir, halfVector);
}

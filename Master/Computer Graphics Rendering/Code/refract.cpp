#include "refract.h"

// Function to calculate the refraction of a vector using Snell's law
bool refract(const Vec3 &I, const Vec3 &N, float eta, Vec3 &refracted)
{
    float cosi = std::clamp(I.dot(N), -1.0f, 1.0f);
    float etai = 1.0f, etat = eta; // Indices of refraction
    Vec3 n = N;

    if (cosi < 0)
    {
        // If the ray is inside the medium, set cosi to positive
        cosi = -cosi;
    }
    else
    {
        // Swap indices if ray is exiting the medium
        std::swap(etai, etat);
        n = -N;
    }

    // Calculate refractive index ratio
    float etaRatio = etai / etat;
    float k = 1 - etaRatio * etaRatio * (1 - cosi * cosi);

    // Check for total internal reflection
    if (k < 0)
        return false;

    // Calculate the refracted vector
    refracted = I * etaRatio + n * (etaRatio * cosi - std::sqrt(k));
    return true;
}

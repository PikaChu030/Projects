#include "toneMap.h"

// Function to apply tone mapping using a filmic curve
Vec3 toneMap(const Vec3 &hdrColor)
{
    // Constants for the filmic tone mapping curve
    const float A = 0.22f;
    const float B = 0.30f;
    const float C = 0.10f;
    const float D = 0.20f;
    const float E = 0.01f;
    const float F = 0.30f;

    // Filmic curve function
    auto filmic = [&](float x)
    {
        return ((x * (A * x + C * B) + D * E) / (x * (A * x + B) + D * F)) - E / F;
    };

    // Apply filmic curve to each color component
    Vec3 mappedColor(
        filmic(hdrColor.x),
        filmic(hdrColor.y),
        filmic(hdrColor.z));

    // Calculate the white point using the filmic curve
    const float whitePoint = filmic(11.2f);

    // Normalize the mapped color based on the white point
    mappedColor *= 1.0f / whitePoint;

    return mappedColor; // Return the tone-mapped color
}

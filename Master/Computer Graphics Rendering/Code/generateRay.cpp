#include "generateRay.h"

// Function to generate a ray from the camera based on normalized screen coordinates
Ray generateRay(float x, float y, const Camera &camera, int width, int height)
{
    // Calculate the forward, right, and true up vectors for the camera
    Vec3 forward = (camera.lookAt - camera.position).normalize();
    Vec3 right = forward.cross(camera.upVector).normalize();
    Vec3 trueUp = right.cross(forward);

    // Calculate aspect ratio and field of view angle
    float aspectRatio = static_cast<float>(width) / height;
    float angle = tan((camera.fov / 2.0) * M_PI / 180.0);

    // Calculate the camera space coordinates of the pixel
    float Px = (2 * ((x + 0.5) / width) - 1) * angle * aspectRatio;
    float Py = (1 - 2 * ((y + 0.5) / height)) * angle;

    // Reverse the x-axis to align with image space direction
    Px = -Px;

    // Compute the direction of the ray
    Vec3 rayDir = (forward + right * Px + trueUp * Py).normalize();

    // Check if the camera uses depth of field properties
    if (camera.aperture > 0.0f)
    {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<> dis(-0.5, 0.5);

        // Calculate depth of field offset
        float lensRadius = camera.aperture / 2.0f;
        float lensX = dis(gen) * lensRadius;
        float lensY = dis(gen) * lensRadius;

        // Calculate focus point for the ray
        Vec3 focusPoint = camera.position + rayDir * camera.focusDistance;

        // Offset the origin by a random point on the lens
        Vec3 offset = right * lensX + trueUp * lensY;
        Vec3 origin = camera.position + offset;

        // Recalculate the ray direction from the offset origin
        rayDir = (focusPoint - origin).normalize();

        return Ray(origin, rayDir);
    }
    else
    {
        return Ray(camera.position, rayDir);
    }
}

#ifndef CAMERA_H
#define CAMERA_H

#include "Vec3.h" // Assuming Vec3 is defined in Vec3.h

// Define a Camera class to represent camera properties and setup in a scene
struct Camera {
    // Camera position in 3D space
    Vec3 position;

    // Point at which the camera is looking
    Vec3 lookAt;

    // Up vector defining the camera's orientation
    Vec3 upVector;

    // Field of view (in degrees) for the camera
    float fov;

    // Aperture size, affecting depth of field
    float aperture;

    // Focus distance for depth of field
    float focusDistance;

    // Constructor to initialize the camera with specific parameters
    Camera(const Vec3 &pos, const Vec3 &look, const Vec3 &up, float f, float a, float fd);
};

#endif // CAMERA_H

#include "Camera.h"

// Constructor to initialize the camera with specific parameters
Camera::Camera(const Vec3 &pos, const Vec3 &look, const Vec3 &up, float f, float a, float fd)
    : position(pos), lookAt(look), upVector(up), fov(f), aperture(a), focusDistance(fd) {}

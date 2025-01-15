#include "reflect.h"

// Function to reflect a vector
Vec3 reflect(const Vec3 &I, const Vec3 &N)
{
    return I - N * 2.0f * I.dot(N);
}

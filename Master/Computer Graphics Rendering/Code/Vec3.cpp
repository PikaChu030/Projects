#include "Vec3.h"

// Default constructor initializing the vector to (0, 0, 0)
Vec3::Vec3() : x(0), y(0), z(0) {}

// Parameterized constructor to initialize the vector with specific values
Vec3::Vec3(float a, float b, float c) : x(a), y(b), z(c) {}

// Overloading the addition operator to add two vectors component-wise
Vec3 Vec3::operator+(const Vec3 &other) const {
    return Vec3(x + other.x, y + other.y, z + other.z);
}

// Overloading the subtraction operator to subtract two vectors component-wise
Vec3 Vec3::operator-(const Vec3 &other) const {
    return Vec3(x - other.x, y - other.y, z - other.z);
}

// Overloading the multiplication operator to scale the vector by a scalar
Vec3 Vec3::operator*(float scalar) const {
    return Vec3(x * scalar, y * scalar, z * scalar);
}

// Overloading the multiplication operator for component-wise vector multiplication
Vec3 Vec3::operator*(const Vec3 &other) const {
    return Vec3(x * other.x, y * other.y, z * other.z);
}

// Overloading the negation operator to negate each component of the vector
Vec3 Vec3::operator-() const {
    return Vec3(-x, -y, -z);
}

// Overloads the addition assignment operator to add another vector to the current vector
Vec3& Vec3::operator+=(const Vec3 &other) {
    x += other.x;
    y += other.y;
    z += other.z;
    return *this;
}

// Overloads the multiplication assignment operator to scale the current vector by a scalar
Vec3& Vec3::operator*=(float scalar) {
    x *= scalar;
    y *= scalar;
    z *= scalar;
    return *this;
}

// Overloads the multiplication assignment operator for component-wise vector multiplication
Vec3& Vec3::operator*=(const Vec3 &other) {
    x *= other.x;
    y *= other.y;
    z *= other.z;
    return *this;
}

// Calculates the dot product of the current vector with another vector
float Vec3::dot(const Vec3 &other) const {
    return x * other.x + y * other.y + z * other.z;
}

// Calculates the cross product of the current vector with another vector
Vec3 Vec3::cross(const Vec3 &other) const {
    return Vec3(y * other.z - z * other.y,
                z * other.x - x * other.z,
                x * other.y - y * other.x);
}

// Normalizes the vector to have a magnitude of 1
Vec3 Vec3::normalize() const {
    float len = std::sqrt(x * x + y * y + z * z);
    return Vec3(x / len, y / len, z / len);
}

// Overloads the subscript operator to provide read-only access to vector components
float Vec3::operator[](int index) const {
    if (index == 0) return x;
    if (index == 1) return y;
    return z;
}

// Overloads the equality operator to compare two vectors for equality
bool Vec3::operator==(const Vec3 &other) const {
    return std::fabs(x - other.x) < 1e-5f &&
           std::fabs(y - other.y) < 1e-5f &&
           std::fabs(z - other.z) < 1e-5f;
}

// Global function to allow scalar multiplication from the left
Vec3 operator*(float scalar, const Vec3 &vec) {
    return Vec3(vec.x * scalar, vec.y * scalar, vec.z * scalar);
}

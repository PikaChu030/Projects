#ifndef VEC3_H
#define VEC3_H

#include <cmath>  // For std::sqrt and std::fabs

// Define a 3D vector class to represent points or directional vectors in 3D space
struct Vec3 {
    // Data members representing the x, y, and z components of the vector
    float x, y, z;

    // Default constructor initializing the vector to (0, 0, 0)
    Vec3();
    
    // Parameterized constructor to initialize the vector with specific values
    Vec3(float a, float b, float c);

    // Overloading the addition operator to add two vectors component-wise
    Vec3 operator+(const Vec3 &other) const;

    // Overloading the subtraction operator to subtract two vectors component-wise
    Vec3 operator-(const Vec3 &other) const;

    // Overloading the multiplication operator to scale the vector by a scalar
    Vec3 operator*(float scalar) const;

    // Overloading the multiplication operator for component-wise vector multiplication
    Vec3 operator*(const Vec3 &other) const;

    // Overloading the negation operator to negate each component of the vector
    Vec3 operator-() const;

    // Overloads the addition assignment operator to add another vector to the current vector
    Vec3 &operator+=(const Vec3 &other);

    // Overloads the multiplication assignment operator to scale the current vector by a scalar
    Vec3 &operator*=(float scalar);

    // Overloads the multiplication assignment operator for component-wise vector multiplication
    Vec3 &operator*=(const Vec3 &other);

    // Calculates the dot product of the current vector with another vector
    float dot(const Vec3 &other) const;

    // Calculates the cross product of the current vector with another vector
    Vec3 cross(const Vec3 &other) const;

    // Normalizes the vector to have a magnitude of 1
    Vec3 normalize() const;

    // Overloads the subscript operator to provide read-only access to vector components
    float operator[](int index) const;

    // Overloads the equality operator to compare two vectors for equality
    bool operator==(const Vec3 &other) const;
};

// Global function to allow scalar multiplication from the left
Vec3 operator*(float scalar, const Vec3 &vec);

#endif // VEC3_H

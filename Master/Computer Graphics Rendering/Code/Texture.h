#ifndef TEXTURE_H
#define TEXTURE_H

#include <string>
#include <iostream>
#include "Vec3.h" // Assuming Vec3 is defined in Vec3.h

class Texture {
public:
    // Width, height, and number of color channels in the texture
    int width, height, channels;
    unsigned char *data; // Pointer to the raw image data

    // Constructor that loads an image from a file
    Texture(const std::string &filename);

    // Destructor to release the allocated image data
    ~Texture();

    // Method to sample a color from the texture using UV coordinates
    Vec3 sample(float u, float v) const;
};

#endif // TEXTURE_H

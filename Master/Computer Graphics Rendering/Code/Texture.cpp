#include "Texture.h"
#include <cmath>  // For std::floor
#include "stb_image.h"  // Assuming stb_image.h is available for loading images

// Constructor that loads an image from a file
Texture::Texture(const std::string &filename) {
    data = stbi_load(filename.c_str(), &width, &height, &channels, 0); // Load the image
    if (!data) {
        // Log an error message if the image fails to load
        std::cerr << "Error: Could not load texture " << filename << std::endl;
    }
}

// Destructor to release the allocated image data
Texture::~Texture() {
    if (data)
        stbi_image_free(data); // Free the image data if it was loaded
}

// Method to sample a color from the texture using UV coordinates
Vec3 Texture::sample(float u, float v) const {
    // Return white color if no data is loaded
    if (!data)
        return Vec3(1.0f, 1.0f, 1.0f);

    // Wrap the UV coordinates to ensure they are within [0, 1]
    u = u - std::floor(u); // Wrap u
    v = v - std::floor(v); // Wrap v

    // Convert UV coordinates to pixel coordinates
    int x = static_cast<int>(u * width) % width;
    int y = static_cast<int>(v * height) % height;
    int offset = (y * width + x) * channels; // Calculate the data offset

    // Extract the color components and convert to [0, 1] range
    float r = data[offset] / 255.0f;     // Red channel
    float g = data[offset + 1] / 255.0f; // Green channel
    float b = data[offset + 2] / 255.0f; // Blue channel

    // Return the color as a Vec3
    return Vec3(r, g, b);
}

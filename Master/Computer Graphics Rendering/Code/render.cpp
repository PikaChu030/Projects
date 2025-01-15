#include "render.h"

// Function to render the scene based on the given render mode
void render(
    const std::string &renderMode,
    const Camera &camera,
    int width,
    int height,
    const std::vector<Light *> &lights,
    const std::vector<Shape *> &shapes,
    std::vector<uint8_t> &image)
{

    // Brightness factor for the final image
    float brightness = 2.2f;
    const int samplesPerPixel = 16; // Number of samples per pixel (for anti-aliasing)

    // Random number generator setup
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(0.0, 1.0);

    // Loop over each pixel in the image
    for (int y = 0; y < height; ++y)
    {
        for (int x = 0; x < width; ++x)
        {
            Vec3 pixelColor(0, 0, 0); // Initialize pixel color

            // Perform multi-sampling for anti-aliasing
            for (int sample = 0; sample < samplesPerPixel; ++sample)
            {
                // Jittered sub-pixel sampling
                float u = dis(gen);
                float v = dis(gen);
                float subPixelX = x + u;
                float subPixelY = y + v;

                // Generate a ray for the current sub-pixel
                Ray ray = generateRay(subPixelX, subPixelY, camera, width, height);

                // Render based on the selected mode
                if (renderMode == "binary")
                {
                    float t;
                    bool hit = false;
                    for (const auto &shape : shapes)
                    {
                        if (shape->intersect(ray, t))
                        {
                            hit = true;
                            break;
                        }
                    }
                    // Red for hit, black otherwise
                    pixelColor += hit ? Vec3(1, 0, 0) : Vec3(0, 0, 0);
                }
                else if (renderMode == "phong")
                {
                    // Calculate color using the Phong model
                    pixelColor += castRay(ray, shapes, lights);
                }
            }

            // Average the accumulated color values across all samples
            pixelColor *= (1.0f / samplesPerPixel);
            Vec3 mappedColor = toneMap(pixelColor); // Apply tone mapping
            mappedColor *= brightness;              // Apply brightness adjustment

            // Write the final color to the image buffer
            image[(y * width + x) * 3 + 0] = static_cast<uint8_t>(std::clamp(mappedColor.x, 0.0f, 1.0f) * 255);
            image[(y * width + x) * 3 + 1] = static_cast<uint8_t>(std::clamp(mappedColor.y, 0.0f, 1.0f) * 255);
            image[(y * width + x) * 3 + 2] = static_cast<uint8_t>(std::clamp(mappedColor.z, 0.0f, 1.0f) * 255);
        }
    }
}

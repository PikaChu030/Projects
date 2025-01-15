#include "loadLights.h"

// Function to load lights from scene data in a JSON object
void loadLights(const json &sceneData, std::vector<Light *> &lights)
{
    // Check if the "lightsources" section exists in the scene data
    if (auto lightSources = sceneData["scene"].find("lightsources"); lightSources != sceneData["scene"].end())
    {
        // Iterate over each light source defined in the JSON
        for (const auto &lightData : *lightSources)
        {
            // Parse position and intensity from the JSON data
            Vec3 position = parseVec3(lightData, "position");
            Vec3 intensity = parseVec3(lightData, "intensity");

            // Create a new Light object and add it to the lights vector
            lights.push_back(new Light(position, intensity));
        }
    }
}
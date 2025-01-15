#include "parseCamera.h"

// Function to parse a Vec3 from a JSON object given a key
Vec3 parseVec3(const json &js, const std::string &key) {
    return Vec3(js[key][0].get<float>(), js[key][1].get<float>(), js[key][2].get<float>());
}

// Function to parse camera data from a JSON object
Camera parseCamera(const json &cameraData) {
    // Parse position vector from JSON
    Vec3 position = parseVec3(cameraData, "position");

    // Parse lookAt vector from JSON
    Vec3 lookAt = parseVec3(cameraData, "lookAt");

    // Parse upVector from JSON
    Vec3 upVector = parseVec3(cameraData, "upVector");

    // Extract field of view from JSON
    float fov = cameraData.at("fov").get<float>();

    // Extract aperture, with a default value if not specified
    float aperture = cameraData.value("aperture", 0.0f);

    // Extract focus distance, with a default value if not specified
    float focusDistance = cameraData.value("focusDistance", 1.0f);

    // Construct and return a Camera object with the parsed data
    return Camera(position, lookAt, upVector, fov, aperture, focusDistance);
}

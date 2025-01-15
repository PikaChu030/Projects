#include "readJson.h"

// Function to read JSON data from a file
json readJson(const std::string &filepath) {
    std::ifstream file(filepath); // Open the file for reading
    json j;

    if (file) {
        file >> j; // Parse the file contents into a JSON object
    } else {
        // If the file cannot be opened, output an error message
        std::cerr << "Could not open file: " << filepath << std::endl;
    }

    return j; // Return the JSON object (could be empty if file read failed)
}

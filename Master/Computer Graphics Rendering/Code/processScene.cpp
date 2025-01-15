#include "processScene.h"

// Function to process the scene from the input file and save the rendered output to a file
void processScene(const std::string &inputFile, const std::string &outputFile)
{
    // Read JSON data from the input file
    json sceneData = readJson(inputFile);

    // Parse camera data
    auto cameraData = sceneData.at("camera");
    Camera camera = parseCamera(cameraData);

    // Get render mode, default to "binary" if not specified
    std::string renderMode = sceneData.value("rendermode", "binary");

    // Get image dimensions
    int width = cameraData.at("width").get<int>();
    int height = cameraData.at("height").get<int>();

    // Load lights from the scene data
    std::vector<Light *> lights;
    loadLights(sceneData, lights);

    // Initialize an image buffer
    std::vector<uint8_t> image(width * height * 3, 0);

    // Load shapes from the scene data
    std::vector<Shape *> shapes;
    for (const auto &shapeData : sceneData["scene"]["shapes"])
    {
        std::string type = shapeData.at("type");
        Material material;

        // Parse material if present
        if (shapeData.contains("material"))
        {
            material = parseMaterial(shapeData["material"]);
        }

        // Create and add shapes to the scene based on type
        if (type == "sphere")
        {
            Vec3 center = parseVec3(shapeData, "center");
            float radius = shapeData.at("radius").get<float>();
            shapes.push_back(new Sphere(center, radius, material));
        }
        else if (type == "cylinder")
        {
            Vec3 center = parseVec3(shapeData, "center");
            Vec3 axis(0, 1, 0);
            if (shapeData.contains("axis"))
            {
                axis = parseVec3(shapeData, "axis");
            }
            float radius = shapeData.at("radius").get<float>();
            float height = shapeData.at("height").get<float>();
            shapes.push_back(new Cylinder(center, axis, radius, height, material));
        }
        else if (type == "triangle")
        {
            Vec3 v0 = parseVec3(shapeData, "v0");
            Vec3 v1 = parseVec3(shapeData, "v1");
            Vec3 v2 = parseVec3(shapeData, "v2");
            shapes.push_back(new Triangle(v0, v1, v2, material));
        }
    }

    // Render the scene
    render(renderMode, camera, width, height, lights, shapes, image);

    // Write the rendered image to a PPM file
    std::ofstream ppmFile(outputFile);
    ppmFile << "P6\n"
            << width << " " << height << "\n255\n";
    ppmFile.write(reinterpret_cast<char *>(image.data()), image.size());
    ppmFile.close();

    // Clean up dynamically allocated shapes and lights
    for (auto shape : shapes)
    {
        delete shape;
    }
    for (auto light : lights)
    {
        delete light;
    }
    lights.clear();
}

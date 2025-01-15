CXX = g++
CXXFLAGS = -Wall -O3 -std=c++20 -I. -I/path/to/json/include
LDFLAGS = 

SOURCES = s2749500.cpp Vec3.cpp Texture.cpp Material.cpp Light.cpp Ray.cpp AABB.cpp Camera.cpp parseCamera.cpp sampleBRDF.cpp Shape.cpp BVHNode.cpp Sphere.cpp Triangle.cpp Cylinder.cpp readJson.cpp generateRay.cpp parseMaterial.cpp isInShadow.cpp blinnPhongShading.cpp directLightSampling.cpp reflect.cpp refract.cpp castRay.cpp loadLights.cpp toneMap.cpp render.cpp processScene.cpp
OBJS = $(SOURCES:.cpp=.o)
TARGET = raytracer

# Rule to build the target
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

# Rule to build object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJS) $(TARGET)



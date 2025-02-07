# Projects
*My main function is s2749500.cpp*

## How to run the code?
1. Type "run" in Visual Studio
2. Wait until all .o file generate
3. Type "./raytracer"
4. Wait for couple of minutes to ppm file generate

## Objective
1. Implement various functions in software Blender using C++
2. writing JSON and convert into PPM image

### Overview
Great news, Automagic were impressed by your previous work and have hired you as a creative consultant! Your next task is to bootstrap the core renderer for the startup’s augmented reality toolkit. For this assignment you are expected to develop code for a full raytracing renderer along with more advanced features if you can. Automagic want a full report on your work including your methodology and evaluation.

Your expected contribution is as follows: A basic raytrcer that implements Blinn-Phong rendering, implementation of reflective and refractive materials and a report outlining the steps taken to implement your raytracer. On top of this, there are some more advanced features that Automagic think would be a good inclusion, but aren’t required for a basic submission.

### Specifications

#### Raytracer
**Goal**: Code a C++ raytracing renderer from scratch with the following features.

**Features**:
1. Image write (ppm format)
2. Camera implementation, with coordinate transformation
3. Intersection tests (sphere, triangles, cylinder)
4. Binary image writing (intersection/no intersection)
5. Blinn-Phong shading
6. Shadows
7. Tone mapping (linear)
8. Reflection
9. Refraction
10. Textures (on sphere, triangle, cylinder)
11. Bounding volume hierarchy as an acceleration structure

**Constraints**:
1. Make your program capable of loading a provided JSON scene file.
2. Output a ppm image of the scene.
3. Recreate the rendered images of the example scenes (not pixel perfect).
4. The code should be clean and readable, with indicative variable and function naming, and should contain ample comments describing function’s operations and variable roles.

Example renders of a provided JSON scene are shown in figure 1. These images showcase the expected behavior of your raytracer and include a render of a custom scene with the advanced submission features.

#### Pathtracer
**Goal**: Improve your raytracer with a path tracer with the following features.

**Features**:
1. Antialiasing via multi-sampling pixels
2. Defocus in finite-aperture cameras by sampling the camera’s aperture
3. Render materials with BRDF’s (e.g. microfacet)
4. Soft shadows via sampling area lights
5. Multi-bounce path tracing
6. An advanced feature of your choice (e.g., Caustics, Volumetrics, fancy BRDFs, etc.)

**Constraints**: Same as those for the raytracer.

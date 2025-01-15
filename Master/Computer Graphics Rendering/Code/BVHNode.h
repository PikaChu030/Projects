#ifndef BVH_NODE_H
#define BVH_NODE_H

#include <vector>
#include <algorithm>
#include "AABB.h"
#include "Shape.h"
#include "Ray.h"

// BVH Node structure for handling a part of the Bounding Volume Hierarchy (BVH) tree
struct BVHNode
{
    // Bounding box enclosing this node
    AABB box;

    // Pointers to the left and right shapes (leaf nodes)
    Shape *left;
    Shape *right;

    // Pointers to the left and right BVH nodes (interior nodes)
    BVHNode *leftNode;
    BVHNode *rightNode;

    // Constructor initializes all pointers to null
    BVHNode();

    // Method to check if a ray intersects with any shape in this BVH node
    bool intersect(const Ray &ray, float &t) const;
};

// Function to build a BVH tree recursively from a list of shapes
BVHNode *buildBVH(std::vector<Shape *> &shapes, size_t start, size_t end);

// Function to recursively destroy the BVH tree and free memory
void destroyBVH(BVHNode *node);

#endif // BVH_NODE_H

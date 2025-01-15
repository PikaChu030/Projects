#include "BVHNode.h"

// Constructor initializes all pointers to null
BVHNode::BVHNode() : left(nullptr), right(nullptr), leftNode(nullptr), rightNode(nullptr) {}

// Method to check if a ray intersects with any shape in this BVH node
bool BVHNode::intersect(const Ray &ray, float &t) const
{
    // First, check if the ray intersects the bounding box
    if (!box.intersect(ray, 0.001f, t))
        return false;

    // Track intersection with leaf shapes
    bool hitLeft = left && left->intersect(ray, t);
    bool hitRight = right && right->intersect(ray, t);

    // If this node is not a leaf, check child nodes
    if (leftNode && leftNode->intersect(ray, t))
        hitLeft = true;
    if (rightNode && rightNode->intersect(ray, t))
        hitRight = true;

    // Return true if either left or right hit
    return hitLeft || hitRight;
}

// Function to build a BVH tree recursively from a list of shapes
BVHNode *buildBVH(std::vector<Shape *> &shapes, size_t start, size_t end)
{
    BVHNode *node = new BVHNode();   // Create a new BVH node
    size_t shapeCount = end - start; // Determine the number of shapes in this segment

    if (shapeCount == 1)
    {
        // If there's only one shape, it's a leaf node
        node->left = shapes[start];
        AABB box;
        shapes[start]->boundingBox(box);
        node->box = box;
    }
    else if (shapeCount == 2)
    {
        // If there are two shapes, create leaf nodes for both
        node->left = shapes[start];
        node->right = shapes[start + 1];

        // Compute their bounding boxes and create a surrounding box
        AABB boxLeft, boxRight;
        shapes[start]->boundingBox(boxLeft);
        shapes[start + 1]->boundingBox(boxRight);
        node->box = AABB::surroundingBox(boxLeft, boxRight);
    }
    else
    {
        // More than two shapes, split them and recursively build subtrees
        std::nth_element(
            shapes.begin() + start, shapes.begin() + start + shapeCount / 2, shapes.begin() + end,
            [](Shape *a, Shape *b)
            {
                AABB boxA, boxB;
                a->boundingBox(boxA);
                b->boundingBox(boxB);
                return boxA.min.x < boxB.min.x; // Sort shapes along the x-axis
            });

        size_t mid = start + shapeCount / 2;           // Calculate mid-point for splitting
        node->leftNode = buildBVH(shapes, start, mid); // Build left subtree
        node->rightNode = buildBVH(shapes, mid, end);  // Build right subtree

        // Compute the bounding box that covers both subtrees
        node->box = AABB::surroundingBox(node->leftNode->box, node->rightNode->box);
    }

    return node; // Return the constructed node
}

// Function to recursively destroy the BVH tree and free memory
void destroyBVH(BVHNode *node)
{
    if (!node) // Check if the node is null
        return;

    // Recursively destroy left subtree
    if (node->leftNode)
        destroyBVH(node->leftNode);

    // Recursively destroy right subtree
    if (node->rightNode)
        destroyBVH(node->rightNode);

    // Delete the current node
    delete node;
}

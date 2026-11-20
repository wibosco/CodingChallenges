// Created 20/11/2026.

import Foundation

//https://leetcode.com/problems/unique-binary-search-trees-ii/
struct UniqueBinarySearchTreesII {
    
    //Time: O(n * 4^n) where n is the number of nodes in each tree
    //Space: O(n * 4^n)
    //binary search tree
    //recursive
    //bottom-up
    //nested loops
    //array
    //sorted
    //
    //Solution Description:
    //We need to generate every BST that can be built from the values `1...n`. Note that `1... n` is a sorted array. In a
    //BST, the nodes with a value smaller than a node's value are part of its left subtree and the nodes with a larger
    //value are part of its right subtree. Any node in a binary tree is also the root of its own subtree. With these 3
    //pieces of information we know that for any value `i` in the array, the values to its left must make up its left
    //subtree and the values to its right must make up its right subtree. As any node can be a root, this lends itself to
    //a recursive solution. To generate all possible trees we take each value in the range as the root and recursively
    //generate all of its possible left and right subtrees (`leftSubtrees` and `rightSubtrees`) by splitting the range in
    //two at `i`. We then pair every left subtree with every right subtree under a new root for `i`, adding each pairing to
    //`trees`. Once every value in the range has been used as the root, we return `trees`.
    //
    //N.B. When a range is empty we return `[nil]` rather than `[]`. An empty subtree is still a valid subtree, and
    //returning `[]` would stop the nested loops from running, losing every tree that has an empty left or right subtree.
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return generateTrees(1, n)
    }

    private func generateTrees(_ left: Int, _ right: Int) -> [TreeNode?] {
        guard left <= right else {
            return [nil] // nil is a valid subtree
        }

        var trees = [TreeNode?]()

        for i in left...right {
            let leftSubtrees = generateTrees(left, (i - 1))
            let rightSubtrees = generateTrees((i + 1), right)

            for leftSubtree in leftSubtrees {
                for rightSubtree in rightSubtrees {
                    let root = TreeNode(i, leftSubtree, rightSubtree)
                    trees.append(root)
                }
            }
        }

        return trees
    }
}

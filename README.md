[![Build](https://github.com/wibosco/CodingChallenges/actions/workflows/swift.yml/badge.svg)](https://github.com/wibosco/CodingChallenges/actions/workflows/swift.yml)
[![Swift](https://img.shields.io/badge/Swift-5-orange.svg?style=flat)](https://swift.org)
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/wibosco/CodingChallenges/blob/main/LICENSE)
[![Twitter](https://img.shields.io/badge/Twitter-@wibosco-blue.svg?style=flat)](https://twitter.com/wibosco)

# CodingChallenges
A collection of coding challenges and their solutions from:

- HackerRank
  - https://www.hackerrank.com/
- LeetCode
  - https://leetcode.com/
- Cracking the Coding Interview
  - https://www.amazon.co.uk/Cracking-Coding-Interview-6th-Programming/dp/0984782850/

## Hints for how to solve:

| Keywords | Techniques |
| -------- | ---------- |
| "Shortest path" | `BFS`, `Dijkstra` | 
| "Level-by-level" | `BFS` |
| "All paths" | `BFS`, `DFS` |
| "Path exists" | `BFS`, `DFS`, `Disjont sets` |
| "Path may not exist"| `isolated vertices`, `cycles` |
| "Generate all", "All permutations", "All combinations", "All possible" | `Backtracking (DFS)` |
| "Next Permutation" | `pivot & sorting` |
| "Sorted", "Maximum", "Minimum" | `Binary Search`, `Two pointers` |
| "Iterating array comparing elements" | `Stack` |
| "Next greater element", "Next lesser element" | `Monotonic stack` |
| "Longest subsequence", "Smallest subsequence", "Maximum points"| `Sliding window`|
| "Subsequence in a graph" | `Memoization`, `Backtracking (DFS)` |
| "In-place" | `Swap`|
| "Loop/cycle in a linked list"| `Slow and Fast pointers i.e. Hare and Tortoise`|
| "Loop/cycle in a graph" | `Disjoint sets`, `Topological sort` |
| "Minimum cost" | `MST`, `Kruskal`, `Prims` |
| "Compare neighbors in a string", "Comparing right to left elements"| `Stack` |
| "Largest value", "Smallest value"| `Heap` |
| "kth smallest", "kth largest", "kth frequent", "top k", "k closet" | `QuickSelect` |
| "Matrix diagonal" | `r1 - c1 == r2 - c2`|

## Need Tips

| Need to... | Technique | Example |
| ---------- | --------- | ------- |
| Optimise graph traversal | `Memoization`  | `LongestIncreasingSubsequence` |
| Generate all premutations of an array | Offset nested `for` loops with the inner starting at `i+1` | `AdditiveNumber` |
| Find "x" from an infinite array | Treat array as a graph and perform a DFS, at each level include all elements in the array | `CoinChanges` |

## Data Structure Characteristics

### Binary Tree

1. A tree has one root node
2. Each node has only one parent node (apart from the root node which has none)
3. Each node has a maximum of two child nodes - left and right
4. A node without any child nodes is a leaf node
5. Any subtree is also a valid independent binary Tree
6. The depth of a node is the number of edges from the node to the tree's root node - a root node will have a depth of 0
7. The height of a node is the number of edges on the longest path from the node to a leaf - a leaf node will have a height of 0
8. Traversal:
    1. Preorder traversal involves traversing from the root to the left subtree then to the right subtree
    2. Inorder traversal involves traversing from the left subtree to the root then to the right subtree
    3. Postorder traversal involves traversing from the left subtree to the right subtree then to the root
9. Searching:
    1. Breadth First Search (BFS) - queue based, level by level traversal
    2. Depth First Search (DFS) - stack based, go as deep as possible then backtrack
10. A balanced binary tree is a tree in which the height of the left and right subtrees differ by no more than 1
11. A complete binary tree is a tree in which every level, except possibly the last, is completely filled, and all nodes in the last level are filled left to right
12. A full/proper binary tree is a tree in which every node has either 0 or 2 children.
13. A tree is special type of graph
14. Doesn't contain cycles

### Binary Search Tree

> Inherits the characteristics of a Binary Tree

1. Nodes to the left of the root are less than or equal than that of the root
2. Nodes to the right of the root are greater than that of the root
3. Inorder traversal results in a sorted list of the nodes in a BST
4. Searching takes O(log n) time as at each node it is possible to discard half of the remaining nodes (as being either too small of too large)

### Graph

1. Non-linear data structure consisting of nodes/vertices and edges
2. Can be weighted or unweighted
    1. Weighted - each edge has a cost
    2. Unweighted - each edge is the same i.e. no cost
3. Can be directed or undirected
    1. Directed - only allow travel down an edge in a certain direction,
    2. Undirected - edge can be used for travel both ways
4. Each node has an `indegree` - this is the number of node connecting into that node   
5. Each node has n `outdegree` - this is the number of nodes, this node is connecting to
6. A node can have any number of edges to other nodes
7. Can contain unconnected nodes
8. Adjacency list can be used to store the `outdegree` of each node in a graph
9. A matrix can be used to show edges between Nodes
    1. Wasteful spacewise
10. A path is sequence of nodes that it takes to get from A -> Z
11. Directed Acyclic Graph (DAG) is a directed graph with no directed cycles
    1. Topological sort only works on DAGs
12. Searching:
    1. Breadth First Search (BFS) - queue based, level by level traversal
    2. Depth First Search (DFS) - stack (of recursive) based, go as deep as possible then backtrack
13. Can contain cycles

### Matrix

1. Just a disguised graph
2. Relative indexing allows for moving/search a matrix without going out of bounds by mapping the possible movements and determining if that movement is valid
3. Visited arrays ensure that when search we don't get caught in an infinite loop
4. Searching:
    1. Breadth First Search (BFS) - queue based, level by level traversal
    2. Depth First Search (DFS) - stack based, go as deep as possible then backtrack
5. Backtracking involves exhaustively searching down one path before reversing back up that path to search down alternative paths at each branching point

## Techniques

### What is Dynamic Programming?

Dynamic programming is a technique for solving problems of recursive nature, iteratively and is applicable when the computations of the subproblems overlap.

Dynamic programming is typically implemented using tabulation, but can also be implemented using memoization. So as you can see, neither one is a "subset" of the other.

When you solve a dynamic programming problem using tabulation you solve the problem "bottom up", i.e., by solving all related sub-problems first, typically by filling up an n-dimensional table. Based on the results in the table, the solution to the "top" / original problem is then computed.

If you use memoization to solve the problem you do it by maintaining a map of already solved sub problems. You do it "top down" in the sense that you solve the "top" problem first (which typically recurses down to solve the sub-problems).

Top-down - First you say I will take over the world. How will you do that? You say I will take over Asia first. How will you do that? I will take over India first. I will become the Chief Minister of Delhi, etc.

Bottom-up - You say I will become the Chief Minister of Delhi. Then I will take over India, then all other countries in Asia and finally I will take over the world. 

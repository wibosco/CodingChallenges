[![Build](https://github.com/wibosco/CodingChallenges/actions/workflows/swift.yml/badge.svg)](https://github.com/wibosco/CodingChallenges/actions/workflows/swift.yml)
[![Swift](https://img.shields.io/badge/Swift-5-orange.svg?style=flat)](https://swift.org)
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/wibosco/CodingChallenges/blob/main/LICENSE)
[![Twitter](https://img.shields.io/badge/Twitter-@wibosco-blue.svg?style=flat)](https://twitter.com/wibosco)

# CodingChallenges
A collection of coding challenges and their solutions from:

- LeetCode
  - https://leetcode.com/
- HackerRank
  - https://www.hackerrank.com/
- Cracking the Coding Interview
  - https://www.amazon.co.uk/Cracking-Coding-Interview-6th-Programming/dp/0984782850/

## Big O

| Complexity | Name |
| ---------- | ---- |
| O(1) | Constant |
| O(log n) | Logarithmic |
| O(n) | Linear |
| O(n log n) | Linear-logarithmic |
| O(n ^ 2) | Quadratic |
| O(n ^ c) | Polynomial |
| O(2 ^ n) | Exponential |
| O(n!) | Factorial |

## Hints for how to solve:

| Keywords | Techniques |
| -------- | ---------- |
| "Shortest path", "Minimum", "closest" | `BFS`, `Dijkstra` | 
| "Level-by-level", "Least number of moves", "Batch" | `BFS` |
| "All paths", "Choices", "Branching" | `BFS`, `DFS` |
| "Path exists" | `BFS`, `DFS`, `Disjont sets` |
| "Path may not exist"| `isolated vertices`, `cycles` |
| "Generate all", "All permutations", "All combinations", "All possible", "Choices", "Branching" | `Backtracking (DFS)` |
| "Next Permutation" | `pivot & sorting` |
| "Sorted", "Maximum", "Minimum" | `Binary Search`, `Two pointers` |
| "Right-most", "Left-most"| `Binary Search` |
| "Iterating array comparing elements" | `Stack` |
| "Next greater element", "Next lesser element" | `Monotonic stack` |
| "Longest subsequence", "Smallest subsequence", "Maximum", "Minimum", "Neighbors"| `Sliding window`|
| "Subsequence in a graph" | `Memoization`, `Backtracking (DFS)` |
| "In-place" | `Swap`|
| "Loop/cycle in a linked list"| `Slow and Fast pointers i.e. Hare and Tortoise`|
| "Loop/cycle in a graph" | `Disjoint sets`, `Topological sort`, `DFS - Visited` |
| "Minimum cost" | `MST`, `Kruskal`, `Prims` |
| "Compare neighbors in a string", "Comparing right to left elements"| `Stack` |
| "Largest value", "Smallest value"| `Heap` |
| "kth smallest", "kth largest", "kth frequent", "Top k", "k closet" | `QuickSelect` |
| "Matrix diagonal" | `r1 - c1 == r2 - c2`|
| "Consecutive" | `sort` |
| "Merge", "Intervals", "Neighbors" | `sort` |
| "Rotate by k" | `(i + k) % array.count` |

## Need to... Tips

| Need to... | Technique | Example |
| ---------- | --------- | ------- |
| Optimise graph traversal | `Memoization`  | `LongestIncreasingSubsequence` |
| Generate all premutations of an array | Offset nested `for` loops with the inner starting at `i+1` | `AdditiveNumber` |
| Find "x" from an infinite array | Treat array as a graph and perform a DFS, at each level include all elements in the array | `CoinChanges` |
| Explore possible replacement values for a given element in an array/string | `DFS`, `Memoization` | `ValidParenthesisString` |
| Can't use additional memory when working with an array | `Negative Marking` | `FindAllNumbersDisappearedInAnArray` |
| Combine numbers together to form one number e.g. `[5, 10]` to `510`| Convert the numbers to strings | `LargestNumber` |
| Simulate time passing or different rounds | Batch up changes either using a `Queue` or caching state between rounds | `PushDominoes` |
| Count possible substrings | `count * (count + 1) / 2` | `Substring` |
| Count possible subarrays | `count * (count + 1) / 2` | `CountTheNumberOfIncremovableSubarraysI` |
| Count possible subsequences | `(2 ^ count) - 1` | `Subsequence` |
| Repeatedly find the min and max value in subarrays| Sort the overall array and take the first and last element in the subarray | `MinimumDifferenceBetweenHighestAndLowestOfKScore` |
| Find the end of duplicates in an array | Nested while loop that only increments one of the pointers i.e. fast forward | `RemoveDuplicatesFromSortedListII` |
| Find the minimum distance from one element to multiple elements in a graph | Multi-source BFS | `AsFarFromLandAsPossible` |
| Traverse up a tree | Turn the tree into a directed graph with `child -> parent` and `parent -> child` | `ClosestLeafInABinaryTree` |
| Sort two "linked" arrays together | Merge the two array into one tuple array | `MaximumCoinsHeroesCanCollect` |
| Work out the cost/total of all previous elements in sorted data | `PrefixSum` | `MaximumCoinsHeroesCanCollect` |
| Flip neighbors to find the maximum/minimum | `Sliding window` | `MaximizeTheConfusionOfAnExam` |
| Reverse order of substrings while keeping the same order of each substring| Two passes - one to reverse all, one to reverse each substring | `ReverseWordsInAStringII` |
| Wrap an arrays indexes round an offset | `Modulo` | `CircularArrayLoop` |

A lot of problems can be treated as graph problems.

## Techniques

| Technique | What is it? | Example |
| --------- | ----------- | ------- |
| BFS | Breadth-first search involves searching a graph level by level - ensuring all vertices on a level have been searched before moving onto the next level. A level is all immediate vertices connected to a vertice from the previous level. | `BFS` |
| DFS | Depth-first search involves searching a graph by fully exploring one path from root before searching any other other vertices from root. | `DFS` |
| Binary search | Binary search works by selecting the middle index in the sorted array `values` and comparing its value against `target`. If `values[mid]` matches `target` then we have found our target and can return; if  `values[mid]` does not match `target` then we half the search space by moving either `left` to the right (if `values[mid]` was smaller than `target`) or moving `right` to the left (if `values[mid]` was larger than `target`). We can reduce the search space like this because `values` sorted so we know that if `values[mid]` was smaller than `target` then any index less than `mid` will contain an even smaller value than `values[mid]` so searching those other indexes would be pointless (the opposite is true for reducing the search space to the right of `mid`). | `BinarySearch` |
|Dynamic Programming | Dynamic programming is a technique for solving problems of recursive nature where we re-use work to speed up the process of solving the problem. It can look like dynamic programming solutions are brute force in nature. <br /><br /> Dynamic programming can be implemented **bottom-up** or **top-down**: <br /><br /> - **Bottom-up** is when we solve the easiest sub-problem first and use that solution directly to solve a "higher" problem. <br /><br /> - **Top-down** is when we cache the solutions to sub-problems in the course of solving a "higher" problem. We can then access those cached solutions when attempting to solve other similar "higher" problems (not the original "higher problem"). | `HouseRobberIII` |

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
    1. Breadth First Search (BFS) - queue based, level-by-level traversal
    2. Depth First Search (DFS) - stack (recursive) based, go as deep as possible then backtrack
13. Can contain cycles

### Matrix

1. Just a disguised graph
2. Relative indexing allows for moving/search a matrix without going out of bounds by mapping the possible movements and determining if that movement is valid
3. Visited arrays ensure that when search we don't get caught in an infinite loop
4. Searching:
    1. Breadth First Search (BFS) - queue based, level by level traversal
    2. Depth First Search (DFS) - stack based, go as deep as possible then backtrack
5. Backtracking involves exhaustively searching down one path before reversing back up that path to search down alternative paths at each branching point

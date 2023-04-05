//
//  DFS.swift
//  Algorithms
//
//  Created by William Boles on 27/05/2022.
//

import Foundation

struct DFS {
    
    // MARK: - BinarySearchTree
    
    //Time: O(log n) where n is the number of nodes in the tree
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //DFS
    //graph theory
    //binary search tree
    //visited
    //stack
    //recursive
    //
    //Solution Description:
    //Depth-first search involves searching by searching fully down one path until we either find `target` or go beyond the left
    //vertices e.g.
    //
    //                    +---+
    //          +---------+ 4 +---------+
    //          |         +---+         |
    //          |                       |
    //          v                       v
    //        +---+                   +---+
    //   +----+ 1 +----+         +----+ 6 +----+
    //   |    +---+    |         |    +---+    |
    //   |             |         |             |
    //   v             v         v             v
    // +---+         +---+     +---+         +---+
    // | 0 |         | 2 |     | 5 |    +----+ 11+----+
    // +---+         +---+     +---+    |    +---+    |
    //                                  |             |
    //                                  v             v
    //                                +---+         +---+
    //                           +----+ 9 |         | 12|
    //                           |    +---+         +---+
    //                           |
    //                           v
    //                         +---+
    //                         | 8 |
    //                         +---+
    //
    //
    //The paths of the above tree are:
    //
    //Path 1: 4, 1, 0
    //Path 2: 4, 1, 2
    //Path 3: 4, 6, 5
    //Path 4: 4, 6, 11, 9, 8
    //Path 4: 4, 6, 11, 12
    //
    //In this fashion it is possible to find a path (not necessary the shortest path) from the `source` to the `target` node by
    //traversing fully each branch of the graph. Starting with the `source` node we and place the first connected node into a
    //stack (LIFO) - in the recursive approach this stack is the call stack. As we are searching a binary-search-tree we don't
    //need to search both branches at each level instead we can choose whether to continue searching the left or right branch by
    //comparing the current nodes value against `target` - if `target` is less than the current node we continue searching down
    //the left branch only i.e. we put `node.left` into the stack; if `target` is greater than the current node we continue
    //searching down the right branch only i.e. we put `node.right` into the stack. To keep track of the path we have taken we
    //also put the path into the stack. If at any time we find `target` we return immediately. If after searching all of
    //the tree we haven't found `target` we return nil
    //
    //N.B. By selecting only one branch to traverse we eliminate approx half of all remaining nodes to be search giving this
    //search a time of O(log n)
    static func pathBinarySearchTree(_ root: BinaryTreeNode?, _ target: Int) -> [Int]? {
        guard let root = root else {
            return nil
        }
        
        var targetPath: [Int]?
        var currentPath = [Int]()
        
        dfsBinarySearchTree(root, target, &currentPath, &targetPath)
        
        return targetPath
    }
    
    private static func dfsBinarySearchTree(_ node: BinaryTreeNode, _ target: Int, _ currentPath: inout [Int], _ targetPath: inout [Int]?) {
        guard targetPath == nil else {
            return
        }
        
        currentPath.append(node.val)
        
        if node.val == target {
            targetPath = currentPath
        } else if node.val > target { //important to note that here we compare against node not node.left
            if let left = node.left {
                dfsBinarySearchTree(left, target, &currentPath, &targetPath)
            }
        } else {
            if let right = node.right {
                dfsBinarySearchTree(right, target, &currentPath, &targetPath)
            }
        }
        
        currentPath.removeLast()
    }
    
    // MARK: - BinaryTree
    
    //Time: O(log n) where n is the number of nodes in the tree
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //DFS
    //graph theory
    //binary tree
    //stack
    //recursive
    //backtracking
    //
    //Solution Description:
    //Depth-first search involves searching by searching fully down one path until we either find `target` or go beyond the left
    //vertices e.g.
    //
    //                    +---+
    //          +---------+ 4 +---------+
    //          |         +---+         |
    //          |                       |
    //          v                       v
    //        +---+                   +---+
    //   +----+ 7 +----+         +----+ 6 +----+
    //   |    +---+    |         |    +---+    |
    //   |             |         |             |
    //   v             v         v             v
    // +---+         +---+     +---+         +---+
    // | 11|         | 2 |     | 5 |    +----+ 0 +----+
    // +---+         +---+     +---+    |    +---+    |
    //                                  |             |
    //                                  v             v
    //                                +---+         +---+
    //                           +----+ 9 |         | 8 |
    //                           |    +---+         +---+
    //                           |
    //                           v
    //                         +---+
    //                         | 12 |
    //                         +---+
    //
    //
    //The paths of the above tree are:
    //
    //Path 1: 4, 7, 11
    //Path 2: 4, 7, 2
    //Path 3: 4, 6, 5
    //Path 4: 4, 6, 0, 9, 12
    //Path 4: 4, 6, 0, 8
    //
    //In this fashion it is possible to find a path (not necessary the shortest path) from the `source` to the `target` node by
    //traversing fully each branch of the graph. Starting with the `source` node we and place the first connected node into a
    //stack (LIFO) - in the recursive approach this stack is the call stack. As we are searching a binary-tree and not a
    //binary-search-tree we can't make any assumptions about value ranges contained within each branch so we need to search
    //each branch for `target`. To keep track of the path we have taken we also put the path into the stack. If at any time we
    //find `target` we return immediately. If after having completed a branch of the tree and we haven't found `target` we
    //backtrack one level to the parent/previous node and select the next node (if it exists else we backtrack further) to repeat
    //the process. If after searching all of the tree we haven't found `target` we return nil.
    static func pathBinaryTree(_ root: BinaryTreeNode?, _ target: Int) -> [Int]? {
        guard let root = root else {
            return nil
        }
        
        var targetPath: [Int]?
        var currentPath = [Int]()
        
        dfsBinaryTree(root, target, &currentPath, &targetPath)
        
        return targetPath
    }
    
    private static func dfsBinaryTree(_ node: BinaryTreeNode, _ target: Int, _ currentPath: inout [Int], _ targetPath: inout [Int]?) {
        guard targetPath == nil else {
            return
        }
        
        currentPath.append(node.val)
        
        guard node.val != target else {
            targetPath = currentPath
            return
        }
        
        if let left = node.left {
            dfsBinaryTree(left, target, &currentPath, &targetPath)
        }
        
        if let right = node.right {
            dfsBinaryTree(right, target, &currentPath, &targetPath)
        }
        
        currentPath.removeLast()
    }
    
    // MARK: - Graph
    
    //Time: O(v + e) where v is the number of nodes in the graph, e is the number of edges in the graph
    //Space: O(v)
    //DFS
    //graph theory
    //unweighted graph
    //adjacency list
    //visited
    //stack
    //recursive
    //backtracking
    //
    //Solution Description:
    //Depth-first search involves searching by searching fully down one path until we either find `target` or go beyond the left
    //vertices e.g.
    //
    //          +---+      +---+        +---+
    //   +----->| 1 +----->| 4 +---+--->| 7 |
    //   |      +---+      +-+-+   |    +---+
    //   |                   |     |
    //   |                   v     |
    // +-+-+    +---+      +---+   |
    // | 0 +--->| 2 +----->| 5 |   |
    // +-+-+    +-+-+      +---+   |
    //   |        |          ^     |
    //   |        v          |     |
    //   |      +---+      +-+-+   |
    //   +----->| 3 +----->| 6 |<--+
    //          +---+      +---+
    //
    //The path of the above directed graph (from a source of `0`) are:
    //
    //Path 1: 0, 1, 4, 5
    //Path 2: 0, 1, 4, 6, 5*
    //Path 3: 0, 1, 4, 7
    //Path 4: 0, 2, 3, 6, 5
    //Path 5: 0, 2, 5*
    //Path 6: 0, 3, 6, 5
    //
    // *note for both come before different paths leading from 0 as we exhaust all paths from each vertices before returning
    //  (or backtrackng) to any other vertices that the parent vertice is connected to.
    //
    //In this fashion it is possible to find a path (not necessary the shortest path) from the `source` to the `target` vertice
    //by traversing fully each branch of the graph. Starting with the `source` vertice we place the first connected vertice into
    //a stack (LIFO) - in the recursive this stack is the call stack. As a graph can have multiple paths to get the same vertice
    //we also track the path that got us to this vertice by placing it into the stack as well. We then immediatelt move on this
    //neighbor vertice and repeat the process. As a graph can contain loops, to avoid searching the same vertice multiple times
    //we place each vertice we encounter into the `visited` set - before searching a vertices we check if it already exists in
    //`visited` and skip it if it does. If at any time we find `target` we return immediately. If after having completed a branch
    //of the graph and we haven't found `target` we backtrack one level to the parent/previous vertice and select the next vertice
    //(if it exists else we backtrack further) to repeat the process. If after searching all of the graph we haven't found `target`
    //we return nil
    static func pathGraph(_ adjList: [[Int]], _ source: Int, _ target: Int) -> [Int]? {
        var visited = Set<Int>()
        var targetPath: [Int]?
        var currentPath = [Int]()
        
        dfsGraph(adjList, source, target, &visited, &currentPath, &targetPath)
        
        return targetPath
    }
    
    private static func dfsGraph(_ adjList: [[Int]], _ source: Int, _ target: Int, _ visited: inout Set<Int>, _ currentPath: inout [Int], _ targetPath: inout [Int]?) {
        guard targetPath == nil else { //basecase
            return
        }
        
        currentPath.append(source)
        
        guard source != target else { //basecase
            targetPath = currentPath
            return
        }
        
        visited.insert(source)
        
        for neighbor in adjList[source] {
            guard !visited.contains(neighbor) else {
                continue
            }
            
            dfsGraph(adjList, neighbor, target, &visited, &currentPath, &targetPath)
            
            guard targetPath == nil else { //found the target, skip searching further 
                return
            }
        }
    
        currentPath.removeLast() //backtracking
    }
}

//
//  BFS.swift
//  Algorithms
//
//  Created by William Boles on 26/05/2022.
//

import Foundation

struct BFS {
    
    // MARK: - Graph
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //BFS
    //graph theory
    //unweighted graph
    //adjacency list
    //visited
    //queue
    //iterative
    //
    //Solution Description:
    //Breadth first search involves searching a graph level by level - ensuring all vertices on a level have been searched
    //before moving onto the next level. In this fashion it is possible to find the shortest path from the `source` to the
    //`target` vertice. We do by placing each vertice we encounter in a queue to control which vertice should be searched
    //next. To avoid searching the same vertice multiple (due to a loop existing in the graph) times we place each vertice we
    //encounter into the `visited` set - before searching a vertices we check if it already exists in `visited` and skip it if
    //it does. If at any time we find `target` we return immediately. If after searching all of the tree we haven't found
    //`target` we return nil
    static func shortestPathGraph(_ adjList: [[Int]], _ source: Int, _ target: Int) -> [Int]? {
        var queue = [(source, [Int]())]
        var visited = Set<Int>()
        
        while !queue.isEmpty {
            let (node, pathToHere) = queue.removeFirst()
            let currentPath = pathToHere + [node]
            
            guard node != target else {
                return currentPath
            }
            
            visited.insert(node)
            
            for neighbor in adjList[node] {
                guard !visited.contains(neighbor) else {
                    continue
                }
                
                queue.append((neighbor, currentPath))
            }
        }
        
        return nil
    }
    
    // MARK: - BinaryTree
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //BFS
    //binary tree
    //queue
    //iterative
    //
    //Solution Description:
    //Breadth first search involves searching a tree level by level - ensuring all nodes on a level have been searched before
    //moving onto the next level. In this fashion it is possible to find the shortest path from the `root` to the `target` node.
    //We do by placing each node we encounter in a queue to control which node should be searched next. As we are searching a
    //binary-tree and not a binary-search-tree we can't make any assumptions about value ranges contained within each branch so
    //we need to search each branch for `target`. To keep track of the path we have taken we also put the path into the queue.
    //If at any time we find `target` we return immediately. If after searching all of the tree we haven't found `target` we
    //return nil
    static func shortestPathBinaryTree(_ root: BinaryTreeNode?, _ target: Int) -> [Int]? {
        guard let root = root else {
            return nil
        }
        
        var queue = [(root, [Int]())]
        
        while !queue.isEmpty {
            let (node, pathToHere) = queue.removeFirst()
            let currentPath = pathToHere + [node.val]
            
            guard node.val != target else {
                return currentPath
            }
            
            //as a binary tree isn't ordered we need to check every node
            if let left = node.left {
                queue.append((left, currentPath))
            }
            
            //as a binary tree isn't ordered we need to check every node
            if let right = node.right {
                queue.append((right, currentPath))
            }
        }
        
        return nil
    }
    
    // MARK: - BinarySearchTree
    
    //Time: O(log n) where n is the number of nodes in the tree
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //BFS
    //binary search tree
    //queue
    //iterative
    //
    //Solution Description:
    //Breadth first search involves searching a tree level by level - ensuring all nodes on a level have been searched before
    //moving onto the next level. In this fashion it is possible to find the shortest path from the `root` to the `target` node.
    //We do by placing each node we encounter in a queue to control which node should be searched next. As we are searching a
    //this binary-search-tree at each level we choose whether to continue searching the left or right branch by comparing the
    //left and right nodes value against `target`. To keep track of the path we have taken we also put the path into the queue.
    //If at any time we find `target` we return immediately. If after searching all of the tree we haven't found `target` we
    //return nil
    //
    //N.B. By selecting only one branch to traverse we eliminate approx half of all remaining nodes to be search giving this
    //search a time of O(log n)
    static func shortestPathBinarySearchTree(_ root: BinaryTreeNode?, _ target: Int) -> [Int]? {
        guard let root = root else {
            return nil
        }
        
        var queue = [(root, [Int]())]
        
        while !queue.isEmpty {
            let (node, pathToHere) = queue.removeFirst()
            let currentPath = pathToHere + [node.val]
            
            if node.val == target {
                return currentPath
            } else if target < node.val { //important to note that here we compare against node not node.left
                if let left = node.left {
                    queue.append((left, currentPath))
                }
            } else if target > node.val { //important to note that here we compare against node not node.right
                if let right = node.right {
                    queue.append((right, currentPath))
                }
            }
        }
        
        return nil
    }
}

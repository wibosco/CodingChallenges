// Created 26/05/2022.

import Foundation

struct BFS {
    
    // MARK: - Graph
    
    //Time: O(v + e) where v is the number of nodes in the graph, e is the number of edges in the graph
    //Space: O(v)
    //BFS
    //graph theory
    //unweighted graph
    //adjacency list
    //visited
    //queue
    //iterative
    //
    //Solution Description:
    //Breadth-first search involves searching a graph level by level - ensuring all vertices on a level have been searched
    //before moving onto the next level. A level is all immediate vertices connected to a vertice from the previous level e.g.
    //
    //          +---+      +---+
    //   +----->| 1 +----->| 4 |
    //   |      +---+      +-+-+
    //   |                   |
    //   |                   v
    // +-+-+    +---+      +---+
    // | 0 +--->| 2 |      | 5 |
    // +-+-+    +-+-+      +---+
    //   |        |          ^
    //   |        v          |
    //   |      +---+      +-+-+
    //   +----->| 3 +----->| 6 |
    //          +---+      +---+
    //
    //The levels of the above directed graph (from a source of `0`) are:
    //
    //Level 1: 0
    //Level 2: 1, 2, 3
    //Level 3: 4, 6 *
    //Level 4: 5
    //
    // *note that while it is possible to get to 3 from a level 2 vertice, we could get there sooner from level 1 so we omit it
    //
    //In this fashion it is possible to find the shortest path from the `source` to the `target` vertice by systemically
    //traversing the graph level by level. Starting with the `source` vertice we place all connected vertices into a queue
    //(FIFO). As a graph can have multiple paths to get the same vertice we also track the path that got us to this vertice by
    //placing it into the queue as well. We repeat this process for all connected vertices of those original connected vertices
    //so ensuring that all vertices in one level are searched before moving onto the next level. As a graph can contain loops,
    //to avoid searching the same vertice multiple times we place each vertice we encounter into the `visited` set - before
    //searching a vertices we check if it already exists in `visited` and skip it if it does. If at any time we find `target` we
    //return immediately. If after searching all of the graph we haven't found `target` we return nil
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
    
    //Time: O(v + e) where v is the number of nodes in the graph, e is the number of edges in the graph
    //Space: O(v)
    //BFS
    //graph theory
    //unweighted graph
    //adjacency list
    //visited
    //queue
    //iterative
    //
    //Solution Description:
    //Breadth-first search involves searching a graph level by level - ensuring all vertices on a level have been searched
    //before moving onto the next level. A level is all immediate vertices connected to a vertice from the previous level e.g.
    //
    //          +---+      +---+
    //   +----->| 1 +----->| 4 |
    //   |      +---+      +-+-+
    //   |                   |
    //   |                   v
    // +-+-+    +---+      +---+
    // | 0 +--->| 2 |      | 5 |
    // +-+-+    +-+-+      +---+
    //   |        |          ^
    //   |        v          |
    //   |      +---+      +-+-+
    //   +----->| 3 +----->| 6 |
    //          +---+      +---+
    //
    //The levels of the above directed graph (from a source of `0`) are:
    //
    //Level 1: 0
    //Level 2: 1, 2, 3
    //Level 3*: 4, 6
    //Level 4: 5
    //
    // *note that while it is possible to get to 3 from a level 2 vertice, we could get there sooner from level 1 so we omit it
    //
    //In this fashion it is possible to find the shortest path from the `source` to the `target` vertice by systemically
    //traversing the graph level by level. Starting with the `source` vertice we place all connected vertices into a queue
    //(FIFO). We repeat this process for all connected vertices of those original connected vertices so ensuring that all
    //vertices in one level are searched before moving onto the next level. After each level we increment the `level` count as we
    //moving further away from `source` - note it doesn't matter how many vertices a level contains we are only interested in the
    //number of levels as the measure of distance. As a graph can contains loops, to avoid searching the same vertice multiple
    //times we place each vertice we encounter into the `visited` set - before searching a vertices we check if it already exists
    //in `visited` and skip it if it does. If at any time we find `target` we return immediately. If after searching all of the
    //graph we haven't found `target` we return nil
    static func shortestDistanceGraph(_ adjList: [[Int]], _ source: Int, _ target: Int) -> Int? {
        var queue = [(source, [Int]())]
        var visited = Set<Int>()
        var level = 0
        
        while !queue.isEmpty {
            var newQueueItems = [(Int, [Int])]()
            
            for (node, pathToHere) in queue { //we need to track when a level is "complete"
                let currentPath = pathToHere + [node]
                
                guard node != target else {
                    return (level + 1)
                }
                
                visited.insert(node)
                
                for neighbor in adjList[node] {
                    guard !visited.contains(neighbor) else {
                        continue
                    }
                    
                    newQueueItems.append((neighbor, currentPath))
                }
            }
            
            queue = newQueueItems
            
            level += 1
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
    //Breadth-first search involves searching a graph level by level - ensuring all vertices on a level have been searched
    //before moving onto the next level. A level is all immediate vertices connected to a vertice from the previous level e.g.
    //
    //                    +---+
    //          +---------+ 9 +---------+
    //          |         +---+         |
    //          |                       |
    //          v                       v
    //        +---+                   +---+
    //   +----+ 6 +----+         +----+ 1 +----+
    //   |    +---+    |         |    +---+    |
    //   |             |         |             |
    //   v             v         v             v
    // +---+         +---+     +---+         +---+
    // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
    // +---+         +---+     +---+    |    +---+    |
    //                                  |             |
    //                                  v             v
    //                                +---+         +---+
    //                                | 7 |         | 4 |
    //                                +---+         +---+
    //
    //The levels of the above tree re:
    //
    //Level 1: 9
    //Level 2: 6, 1
    //Level 3: 8, 2, 5, 0
    //Level 4: 7, 4
    //
    //In this fashion it is possible to find the shortest path from the `source` to the `target` vertice by systemically
    //traversing the tree level by level. Starting with the `source` vertice we place all connected vertices into a queue
    //(FIFO). As we are searching a binary-tree and not a binary-search-tree we can't make any assumptions about value ranges
    //contained within each branch so we need to search each branch for `target`. To keep track of the path we have taken we also
    //put the path into the queue. If at any time we find `target` we return immediately. If after
    //searching all of the tree we haven't found `target` we return nil
    static func shortestPathBinaryTree(_ root: BinaryTreeNode<Int>?, _ target: Int) -> [Int]? {
        guard let root = root else {
            return nil
        }
        
        var queue = [(root, [Int]())]
        
        while !queue.isEmpty {
            var newQueueItems = [(BinaryTreeNode<Int>, [Int])]()
            
            for (node, pathToHere) in queue {
                let currentPath = pathToHere + [node.val]
                
                guard node.val != target else {
                    return currentPath
                }
                
                //as a binary tree isn't ordered we need to check every node
                if let left = node.left {
                    newQueueItems.append((left, currentPath))
                }
                
                //as a binary tree isn't ordered we need to check every node
                if let right = node.right {
                    newQueueItems.append((right, currentPath))
                }
            }
            
            queue = newQueueItems
        }
        
        return nil
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //BFS
    //binary tree
    //queue
    //iterative
    //level traversal
    //
    //Solution Description:
    //Breadth-first search involves searching a tree level by level - ensuring all nodes on a level have been searched before
    //moving onto the next level. A level is all immediate nodes connected to a node from the previous level e.g.
    //
    //                    +---+
    //          +---------+ 9 +---------+
    //          |         +---+         |
    //          |                       |
    //          v                       v
    //        +---+                   +---+
    //   +----+ 6 +----+         +----+ 1 +----+
    //   |    +---+    |         |    +---+    |
    //   |             |         |             |
    //   v             v         v             v
    // +---+         +---+     +---+         +---+
    // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
    // +---+         +---+     +---+    |    +---+    |
    //                                  |             |
    //                                  v             v
    //                                +---+         +---+
    //                                | 7 |         | 4 |
    //                                +---+         +---+
    //
    //The levels of the above tree are:
    //
    //Level 1: 9
    //Level 2: 6, 1
    //Level 3: 8, 2, 5, 0
    //Level 4: 7, 4
    //
    //In this fashion it is possible to find the shortest path from the `source` to the `target` vertice by systemically
    //traversing the tree level by level. Starting with the `source` vertice we place all connected vertices into a queue
    //(FIFO). As we are searching a binary-tree and not a binary-search-tree we can't make any assumptions about value ranges
    //contained within each branch so we need to search each branch for `target`. After each level we increment the `level` count
    //as we moving further away from `source` - note it doesn't matter how many vertices a level contains we are only interested
    //in the number of levels as the measure of distance. If at any time we find `target` we return immediately. If after searching
    //all of the tree we haven't found `target` we return nil
    static func shortestDistanceBinaryTree(_ root: BinaryTreeNode<Int>?, _ target: Int) -> Int? {
        guard let root = root else {
            return nil
        }
        
        var queue = [(root, [Int]())]
        var level = 0
        
        while !queue.isEmpty {
            var newQueueItems = [(BinaryTreeNode<Int>, [Int])]()
            
            for (node, pathToHere) in queue { //we need to track when a level is "complete"
                let currentPath = pathToHere + [node.val]
                
                guard node.val != target else {
                    return (level + 1)
                }
                
                //as a binary tree isn't ordered we need to check every node
                if let left = node.left {
                    newQueueItems.append((left, currentPath))
                }
                
                //as a binary tree isn't ordered we need to check every node
                if let right = node.right {
                    newQueueItems.append((right, currentPath))
                }
            }
            
            queue = newQueueItems
            
            level += 1
        }
        
        return nil
    }
    
    // MARK: - BinarySearchTree
    
    //Time: O(log n) where n is the number of nodes in the tree
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //BFS
    //binary tree
    //binary search tree
    //queue
    //iterative
    //
    //Solution Description:
    //Breadth-first search involves searching a tree level by level - ensuring all nodes on a level have been searched before
    //moving onto the next level. A level is all immediate node connected to a node from the previous level e.g.
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
    // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
    // +---+         +---+     +---+    |    +---+    |
    //                                  |             |
    //                                  v             v
    //                                +---+         +---+
    //                                | 7 |         | 9 |
    //                                +---+         +---+
    //
    //The levels of the above tree are:
    //
    //Level 1: 4
    //Level 2: 1, 6
    //Level 3: 0, 2, 5, 8
    //Level 4: 7, 9
    //
    //In this fashion it is possible to find the shortest path from the `source` to the `target` vertice by systemically
    //traversing the tree level by level. Starting with the `source` vertice we place all connected vertices into a queue
    //(FIFO). As we are searching this binary-search-tree at each level we choose whether to continue searching the left or
    //right branch by comparing the current nodes value against `target` - if `target` is less than the current node we continue
    //searching down the left branch only i.e. we put `node.left` into the queue; if `target` is greater than the current node we
    //continue searching down the right branch only i.e. we put `node.right` into the queue. To keep track of the path we have
    //taken we also put the path into the queue. If at any time we find `target` we return immediately. If after searching all of
    //the tree we haven't found `target` we return nil
    //
    //N.B. By selecting only one branch to traverse we eliminate approx half of all remaining nodes to be search giving this
    //search a time of O(log n)
    static func shortestPathBinarySearchTree(_ root: BinaryTreeNode<Int>?, _ target: Int) -> [Int]? {
        guard let root = root else {
            return nil
        }
        
        var queue = [(root, [Int]())]
        
        while !queue.isEmpty {
            var newQueueItems = [(BinaryTreeNode<Int>, [Int])]()
            
            for (node, pathToHere) in queue {
                let currentPath = pathToHere + [node.val]
                
                if node.val == target {
                    return currentPath
                } else if target < node.val { //important to note that here we compare against node not node.left
                    if let left = node.left {
                        newQueueItems.append((left, currentPath))
                    }
                } else if target > node.val { //important to note that here we compare against node not node.right
                    if let right = node.right {
                        newQueueItems.append((right, currentPath))
                    }
                }
            }
            
            queue = newQueueItems
        }
        
        return nil
    }
     
    //Time: O(n) where n is the number of nodes in the tree (O(log n) for a balanced BST)
    //Space: O(max(l) * log n) where l is the number of nodes at the largest level, n is the number of nodes in the tree
    //BFS
    //binary tree
    //binary search tree
    //queue
    //iterative
    //level traversal
    //
    //Solution Description:
    //Breadth-first search involves searching a tree level by level - ensuring all node on a level have been searched before
    //moving onto the next level. A level is all immediate nodes connected to a node from the previous level e.g.
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
    // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
    // +---+         +---+     +---+    |    +---+    |
    //                                  |             |
    //                                  v             v
    //                                +---+         +---+
    //                                | 7 |         | 9 |
    //                                +---+         +---+
    //
    //The levels of the above tree are:
    //
    //Level 1: 4
    //Level 2: 1, 6
    //Level 3: 0, 2, 5, 8
    //Level 4: 7, 9
    //
    //In this fashion it is possible to find the shortest path from the `source` to the `target` vertice by systemically
    //traversing the tree level by level. Starting with the `source` vertice we place all connected vertices into a queue
    //(FIFO). As we are searching this binary-search-tree at each level we choose whether to continue searching the left or
    //right branch by comparing the current nodes value against `target` - if `target` is less than the current node we continue
    //searching down the left branch only i.e. we put `node.left` into the queue; if `target` is greater than the current node we
    //continue searching down the right branch only i.e. we put `node.right` into the queue. After each level we increment the
    //`level` count as we moving further away from `source` - note it doesn't matter how many vertices a level contains we are
    //only interested in the number of levels as the measure of distance. If at any time we find `target` we return immediately.
    //If after searching all of the tree we haven't found `target` we return nil
    //
    //N.B. With a balanced BST by selecting only one branch to traverse we eliminate approx half of all remaining nodes to be
    //search giving this search a time of O(log n)
    static func shortestDistanceBinarySearchTree(_ root: BinaryTreeNode<Int>?, _ target: Int) -> Int? {
        guard let root = root else {
            return nil
        }
        
        var queue = [(root, [Int]())]
        var level = 0
        
        while !queue.isEmpty {
            var newQueueItems = [(BinaryTreeNode<Int>, [Int])]()

            for (node, pathToHere) in queue { //we need to track when a level is "complete"
                let currentPath = pathToHere + [node.val]
                
                if node.val == target {
                    return (level + 1)
                } else if target < node.val { //important to note that here we compare against node not node.left
                    if let left = node.left {
                        newQueueItems.append((left, currentPath))
                    }
                } else if target > node.val { //important to note that here we compare against node not node.right
                    if let right = node.right {
                        newQueueItems.append((right, currentPath))
                    }
                }
            }
            
            queue = newQueueItems
            
            level += 1
        }
        
        return nil
    }
}

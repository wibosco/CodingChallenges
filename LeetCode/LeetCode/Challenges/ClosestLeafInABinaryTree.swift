// Created 22/11/2023.

import Foundation

//https://leetcode.com/problems/closest-leaf-in-a-binary-tree/
struct ClosestLeafInABinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h + h) where n is the number of nodes in the tree
    //                where h is the height of the tree
    //binary tree
    //graph theory
    //DFS
    //recursive
    //BFS
    //iterative
    //adjacency list
    //visited
    //set
    //dictionary
    //inout
    //sentinel head
    //
    //Solution Description:
    //In order to traverse both up and down the tree we first need to turn it into a directed graph with `parent->child` and
    //`child->parent` relationships. This will allow us to use BFS to find the minimum path from `k` to a leaf node. So to
    //build a graph out of the tree we use DFS to traverse all paths in the tree and add each edge to `adjList`. We need to
    //add an additional node in here `sentinelHead` to allow us to correctly identify leaf nodes - a leaf node will have an
    //out-degree of 1 (to it's parent) whoever the root (which doesn't have parent) could also an out-degree of 1 despite
    //not being a leaf node, the `sentinelHead` ensures in that case it would have an out-degree of 2. Once we have built
    //the graph we perform a BFS from `k` to the leaf nodes. As our graph now has loops, to avoid searching the same edge
    //repeatedly we use a `visited` set to store the nodes we have been to. Once we find a leaf node we return it.
    //
    //Similar to: https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/
    func findClosestLeaf(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        //we will know we have a leaf node if that node has an out-degree of 1
        //(back to it's parent) however it's possible for `root` to also have
        //an out-degree of 1 (because it doesn't have a parent). By using a
        //sentinel head attached to `root` we ensure that only leaf nodes have
        //an out-degree of 1 (`root` could still have an out-degree but only
        //when `root` is also a leaf node).
        let sentinelHead = TreeNode(-1)
        var adjList = [Int: [Int]]()
        buildGraph(root, sentinelHead, &adjList)
        
        var visited = Set<Int>()
        visited.insert(k)
        visited.insert(-1) //don't want to visit the sentinel head
        
        var queue = [Int]()
        queue.append(k)
        
        while !queue.isEmpty {
            var nextIteration = [Int]()
            
            for node in queue {
                let neighbors = adjList[node, default: [Int]()]
                
                if neighbors.count == 1 { //leaf node as only connection is the parent
                    return node
                } else {
                    for neighbor in neighbors {
                        if !visited.contains(neighbor) {
                            nextIteration.append(neighbor)
                            visited.insert(neighbor)
                        }
                    }
                }
            }
            
            queue = nextIteration
        }
        
        return -1
    }
    
    private func buildGraph(_ node: TreeNode?, _ parent: TreeNode, _ adjList: inout [Int: [Int]]) {
        guard let node = node else {
            return
        }
        
        adjList[node.val, default: [Int]()].append(parent.val)
        adjList[parent.val, default: [Int]()].append(node.val)
        
        buildGraph(node.left, node, &adjList)
        buildGraph(node.right, node, &adjList)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h + h) where n is the number of nodes in the tree
    //                where h is the height of the tree
    //binary tree
    //graph theory
    //DFS
    //recursive
    //BFS
    //iterative
    //adjacency list
    //visited
    //set
    //dictionary
    //inout
    //
    //Solution Description:
    //In order to traverse both up and down the tree we first need to turn it into a directed graph with `parent->child` and
    //`child->parent` relationships. This will allow us to use BFS to find the minimum path from `k` to a leaf node. So to
    //build a graph out of the tree we use DFS to traverse all paths in the tree and add each edge to `adjList`. As we are
    //interested in finding the shortest path to a leaf node from `k`, each left node we encounter we add to a `leafs` set.
    //Once we have built the graph and found all leafs we perform a BFS from `k` to the leaf nodes. As our graph now has
    //loops, to avoid searching the same edge repeatedly we use a `visited` set to store the nodes we have been to. Each
    //node that we encounter we check if it in `leafs`, if it is we return the leaf node (BFS ensures it is the shortest).
    //
    //Similar to: https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/
    func findClosestLeaf2(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root else {
            return -1
        }

        var adjList = [Int: [Int]]()
        var leafs = Set<Int>()

        convertTreeIntoGraph(root, &adjList, &leafs)

        guard !leafs.contains(k) else {
            return k
        }
        
        return findShortestPathToLeaf(k, adjList, leafs)
    }

    private func convertTreeIntoGraph(_ node: TreeNode, _ adjList: inout [Int: [Int]], _ leafs: inout Set<Int>) {
        // adjList[node.val, default: [Int]()].append(parent.val)
        guard (node.left != nil || node.right != nil) else {
            leafs.insert(node.val)
            return
        }

        if let left = node.left {
            adjList[node.val, default: [Int]()].append(left.val)
            adjList[left.val, default: [Int]()].append(node.val)

            convertTreeIntoGraph(left, &adjList, &leafs)
        }

        if let right = node.right {
            adjList[node.val, default: [Int]()].append(right.val)
            adjList[right.val, default: [Int]()].append(node.val)

            convertTreeIntoGraph(right, &adjList, &leafs)
        }
    }

    private func findShortestPathToLeaf(_ root: Int, _ adjList: [Int: [Int]], _ leafs: Set<Int>) -> Int {
        var queue = [Int]()
        queue.append(root)

        var visited = Set<Int>()

        while !queue.isEmpty {
            var nextQueue = [Int]()

            for nextNode in queue {
                visited.insert(nextNode)

                for neighbor in adjList[nextNode, default: [Int]()] {
                    guard !visited.contains(neighbor) else {
                        continue
                    }

                    guard !leafs.contains(neighbor) else{
                        return neighbor
                    }

                    nextQueue.append(neighbor)
                }
            }

            queue = nextQueue
        }

        return root
    }
    
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //DFS
    //recursive
    //inout
    //bottom-up
    //
    //Solution Description:
    //There are two ways for `k` to be "close" to a leaf node - downwards and upwards. In our binary tree we don't have
    //a parent pointer associated with the nodes so in order to be able to move upwards we need to use the recursive
    //stack. Using DFS we traverse to the leaf nodes and then as the recursive stack unwinds we pass back the distance
    //from that node to a leaf node, the distance to `k` (2000 if distance is unknown) and the value of that leaf node.
    //When two branches converge on a node we take the branch with the closer leaf node as the set of values to return.
    //Once we find `k` we can now set `closestLeaf` with the "downwards" closest leaf node. After finding `k` the nodes
    //we are checking against will be first "upwards" then "downwards" from `k`. In order to do this we need to
    //calculate the distance from the current node to `k` and add that the distance from the current node to a leaf
    //node - if that value is smaller than `closestLeaf` we update it and return the new closest leaf details. We repeat
    //this process until return to the root and can return `closestLeaf`.
    func findClosestLeaf3(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        var closestLeaf = (Int.max, root.val)
        
        _ = dfs(root, k, &closestLeaf)
        
        return closestLeaf.1
    }
    
    private func dfs(_ node: TreeNode, _ k: Int, _ closestLeaf: inout (Int, Int)) -> (Int, Int, Int) { //distanceToK, distanceToLeaf, nodeVal
        if node.left == nil && node.right == nil {
            if node.val == k {
                closestLeaf = (0, node.val)
                
                return (0, 1, node.val)
            } else {
                return (2000, 1, node.val) //2000 is out of the range of for number of nodes
            }
        }
        
        var (leftDistanceToK, leftDistanceToLeaf, leftLeafNodeVal) = (2000, 2000, 2000)
        if let left = node.left {
            (leftDistanceToK, leftDistanceToLeaf, leftLeafNodeVal) = dfs(left, k, &closestLeaf)
        }
        
        var (rightDistanceToK, rightDistanceToLeaf, rightLeafNodeVal) = (2000, 2000, 2000)
        if let right = node.right {
            (rightDistanceToK, rightDistanceToLeaf, rightLeafNodeVal) = dfs(right, k, &closestLeaf)
        }
         
        let minDistanceToK = min(leftDistanceToK, rightDistanceToK) + 1
        let minDistanceToLeaf: (Int, Int)
        if leftDistanceToLeaf < rightDistanceToLeaf {
            minDistanceToLeaf = ((leftDistanceToLeaf + 1), leftLeafNodeVal)
        } else {
            minDistanceToLeaf = ((rightDistanceToLeaf + 1), rightLeafNodeVal)
        }
        
        if node.val == k {
            //checking distance below K to leaf
            closestLeaf = minDistanceToLeaf
            
            return (0, minDistanceToLeaf.0, minDistanceToLeaf.1)
        } else if leftDistanceToK != 2000 || rightDistanceToK != 2000 {
            //checking if it a leaf is closer by going up the tree from K and then down to the leaf
            let distanceFromKToLeaf = minDistanceToK + minDistanceToLeaf.0
            
            if distanceFromKToLeaf < closestLeaf.0 {
                closestLeaf = minDistanceToLeaf
            }
        }
        
        return (minDistanceToK, minDistanceToLeaf.0, minDistanceToLeaf.1)
    }
}

// Created 25/11/2021.

import Foundation

//https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
struct PopulatingNextRightPointers {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree - perfect
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we traverse the tree and set the `next` property for each node's child nodes we encounter. To conenct
    //subtrees we use the `next` property of the current node to get to it's `next` nodes child nodes.
    func connect(_ root: TreeNodeNext?) -> TreeNodeNext? {
        dfs(root)

        return root
    }

    private func dfs(_ node: TreeNodeNext?) {
        guard let node else {
            return
        }

        node.left?.next = node.right
        node.right?.next = node.next?.left

        dfs(node.left)
        dfs(node.right)
    }
    
    //Time: O(n) where n is the number nodes in the tree
    //Space: O(m) where m is number of nodes at the last level (as it's a perfect tree)
    //binary tree - perfect
    //BFS
    //iterative
    //level traversal
    //queue
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level. At each level we track the previous (left) node for the current
    //node and then set the `next` property on the `prev` node to the current node. We repeat this process for each
    //node in each level until all nodes have been processed. We then return `root`.
    func connect2(_ root: TreeNodeNext?) -> TreeNodeNext? {
        guard let root else {
            return nil
        }

        var queue = [TreeNodeNext]()
        queue.append(root)

        while !queue.isEmpty {
            var nextQueue = [TreeNodeNext]()
            var prev: TreeNodeNext?

            for node in queue {
                prev?.next = node
                prev = node

                if let left = node.left {
                    nextQueue.append(left)
                }

                if let right = node.right {
                    nextQueue.append(right)
                }
            }

            queue = nextQueue
        }

        return root
    }
    
    //Time: O(n) where n is the number nodes in the tree
    //Space: O(1)
    //binary tree - perfect
    //BFS
    //iterative
    //linked list - treat each level as a linked list
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level and set the `next` property for each node's child nodes we
    //encounter. To conenct subtrees we use the `next` property of the current node to get to it's `next` nodes
    //child nodes.
    func connect3(_ root: TreeNodeNext?) -> TreeNodeNext? {
        guard let root = root else {
            return nil
        }
        
        root.left?.next = root.right //connect up roots child
        var leftMostNode = root.left //`leftMostNode` will enable us to move down the tree level by level
        
        while leftMostNode != nil {
            var head = leftMostNode //`head` will enable us to move across this level
            
            while head != nil {
                //use the fact that the current level (`head`) is
                //already connected via `next` to connect the n+1 (next)
                //level (`left` and `right`)
                head?.left?.next = head?.right
                head?.right?.next = head?.next?.left
                
                head = head?.next //move onto next node on same level
            }
            
            leftMostNode = leftMostNode?.left //move onto left most node on the next level
        }
        
        return root
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree - perfect
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we traverse the tree and set the `next` property for each node's child nodes we encounter. To conenct
    //subtrees we use the `next` property of the current node to get to it's `next` nodes child nodes.
    func connect4(_ root: TreeNodeNext?) -> TreeNodeNext? {
        //need basecase to prevent infinite calls
        guard let root else {
            return nil
        }

        root.left?.next = root.right
        root.right?.next = root.next?.left

        _ = connect4(root.left)
        _ = connect4(root.right)

        return root
    }
}

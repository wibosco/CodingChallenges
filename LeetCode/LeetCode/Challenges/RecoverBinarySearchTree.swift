// Created 23/01/2022.

import Foundation

//https://leetcode.com/problems/recover-binary-search-tree/
struct RecoverBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree stored in `inorder` array
    //binary tree
    //binary search tree
    //array
    //DFS
    //in-order
    //two pointers
    //
    //Solution Description:
    //Performing an inorder traversal of a binary search tree should result in an array of ordered/sorted nodes. We can use
    //this property to find which nodes are out-of-order in our tree and switch them. A node is out-of-order if it breaks
    //the ascending order so first we search for a node that is greater then the node that comes after it. Then we look for
    //another node that is out-of-order that comes after `p1`. To avoid potentally having both pointers at the same index,
    //the second search at the far end of the ordered array and works it's way towards `p1`. When we find both nodes,
    //instead of having to actually switch the nodes which would involve breaking their existing left and right connections
    //we can instead merely change the `val` of each node to the opposite nodes `val`.
    //
    //IMPORTANT NOTE: carefully read any data structure you are given as the `TreeNode` had it's `val` property as `var` -
    //hinting at updating `val` value rather than truly swapping the nodes (connections and all)
    func recoverTree(_ root: TreeNode?) {
        var order = [TreeNode]()
        dfs(root, &order)

        var p1 = 0
        while p1 < order.count - 1 {
            guard order[p1].val < order[(p1 + 1)].val else { //NB. how we take the left pointer of the failed pairing
                break
            }

            p1 += 1
        }

        var p2 = order.count - 1
        while p2 > p1 {
            guard order[p2].val > order[(p2 - 1)].val else { //NB. how we take the right pointer of the failed pairing
                break
            }

            p2 -= 1
        }

        let tmp = order[p1].val
        order[p1].val = order[p2].val
        order[p2].val = tmp
    }

    private func dfs(_ node: TreeNode?, _ order: inout [TreeNode]) {
        guard let node else {
            return
        }

        dfs(node.left, &order)
        order.append(node)
        dfs(node.right, &order)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree stored in `inorder` array
    //binary tree
    //binary search tree
    //array
    //DFS
    //in-order
    //two pointers
    //
    //Solution Description:
    //Performing an inorder traversal of a binary search tree should result in an array of ordered/sorted nodes. We can use
    //this property to find which nodes are out-of-order in our tree and switch them. There are two possible scenarios for
    //out-of-order nodes:
    //
    //1. Adjacent nodes
    //2. Distant nodes
    //
    //To handle both these scenarios we set both the first and second nodes to be `i` and `i + 1` the first time we encounter
    //an out-of-order node. We then continue searching to see if the array has another out-of-order node. If it does we know
    //that the originally set second node isn't right and we instead set to this new out-of-order node i.e. we are in the
    //distant node scenario; if it doesn't then we are in the adjacent node scenario. Instead of having to actually switch the
    //nodes which would involve breaking their existing left and right connections we can instead merely change the `val` of
    //each node to the opposite nodes `val`.
    //
    //IMPORTANT NOTE: carefully read any data structure you are given as the `TreeNode` had it's `val` property as `var` -
    //hinting at updating `val` value rather than truly swapping the nodes (connections and all)
    func recoverTree2(_ root: TreeNode?) {
        var inorder = [TreeNode]()
        dfs2(root, &inorder)
        
        var first: TreeNode?
        var second: TreeNode?
        
        for i in 0..<(inorder.count - 1) {
            if inorder[i].val > inorder[(i + 1)].val {
                second = inorder[(i + 1)]
                if first == nil {
                    first = inorder[i]
                } else {
                    break //second time we have encountered an out-of-order node i.e. distant nodes scenario
                }
            }
        }
        
        guard let f = first, let s = second else {
            return
        }
        
        let tmp = f.val
        f.val = s.val
        s.val = tmp
    }
    
    private func dfs2(_ node: TreeNode?, _ inorder: inout [TreeNode]) {
        guard let node = node else {
            return
        }
        
        dfs(node.left, &inorder)
        inorder.append(node)
        dfs(node.right, &inorder)
    }
}

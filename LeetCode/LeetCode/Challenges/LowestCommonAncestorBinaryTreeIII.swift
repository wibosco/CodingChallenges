// Created 16/01/2022.

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/
struct LowestCommonAncestorBinaryTreeIII {
    
    //Time: O(n + m) where n is the level of `p`
    //               where m is the level of `q`
    //Space: O(1)
    //binary tree
    //two pointers
    //
    //Solution Description:
    //Treating this tree as a linked list we can race the two pointers to find the root by moving through child -> parent
    //levels. As `p` and `q` can begin at different levels in the tree, simply waiting for `p` and `q` to meet will not
    //guarantee that the lowest common ancestor is where they meet e.g. if `p` starts at level 8 and `q` starts at level
    //4 then this approach will result in the ancestor being declared as the root when it may be level 3. To overcome this
    //limitation, we need a way to overcome any difference in levels - we can do this with two pointers. First we start both
    //pointers at the levels for `p` and `q` we then navigate up the tree until one of the pointers hits the root at which
    //we reset it to the starting position of the slower pointer, we continue to process the nodes until the other pointer
    //also hits root at which point it is reset to the quicker pointers starting position. Both pointers will now be at the
    //same level as the difference will of the extra levels the slower needs to traverse will have been eaten up by switching
    //the fast pointer to the slower starting position. When they meet we can guarantee that node will be the lowest common
    //ancestor.
    //
    //See: https://leetcode.com/problems/intersection-of-two-linked-lists/discuss/49785/Java-solution-without-knowing-the-difference-in-len for more details and a graphic showing the above
    //Similar to: https://leetcode.com/problems/intersection-of-two-linked-lists/
    //Similar to: https://leetcode.com/problems/find-the-duplicate-number/
    func lowestCommonAncestor(_ p: TreeNodeParent?, _ q: TreeNodeParent?) -> TreeNodeParent? {
        guard let p = p, let q = q else {
            return nil
        }
        
        var p1 = p
        var p2 = q
        
        while p1.val != p2.val {
            p1 = p1.parent ?? q //note that we reach the root, rather than reset `p1` to `p` we reset to `q`
            p2 = p2.parent ?? p //note that we reach the root, rather than reset `p2` to `q` we reset to `p`
        }
        
        return p1 //could have used p2
    }
    
    //Time: O(n + m) where n is the level of `p`
    //               where m is the level of `q`
    //Space: O(n)
    //binary tree
    //visited
    //set
    //
    //Solution Description:
    //We traverse from `p` to root, storing each node we encounter in `visited`. We then traverse from `q` to root and compare
    //each node encountered against `visited`. When we find a match we return that node as the lowest common ancestor.
    func lowestCommonAncestor2(_ p: TreeNodeParent?, _ q: TreeNodeParent?) -> TreeNodeParent? {
        var visited = [Int: TreeNodeParent]()

        var p = p
        while let n = p {
            visited[n.val] = n
            p = n.parent
        }

        var q = q
        while let n = q {
            if let match = visited[n.val] {
                return match
            }

            q = n.parent
        }

        return nil
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //
    //Solution Description:
    //First we need to find the root node for this root. Once we have that root node we traverse the tree using DFS. In order
    //for a node to be a common ancestor it needs 2 of the 3 below to be true:
    //
    //1. be either be `p` or `q` itself
    //2. contain `p` in it's right or left branches
    //3. contain `q` in it's right or left branch
    //
    //As we are only interested in the lowest common ancestor rather than any common ancestor we need to ensure that we pass
    //back the first node that is true for 2 of the above 3 scenarios. When we find this node we set it to `lca`
    func lowestCommonAncestor3(_ p: TreeNodeParent?, _ q: TreeNodeParent?) -> TreeNodeParent? {
        guard let p = p, let q = q else {
            return nil
        }
        
        var root = p
        while root.parent != nil {
            root = root.parent!
        }
        
        var lca: TreeNodeParent?
        
        dfs(root, p, q, &lca)
        
        return lca
    }
    
    @discardableResult
    private func dfs(_ root: TreeNodeParent?, _ p: TreeNodeParent, _ q: TreeNodeParent, _ lca: inout TreeNodeParent?) -> Bool {
        guard let root = root, lca == nil else {
            return false
        }
        
        let isRootPOrQ = (root.val == p.val) || (root.val == q.val)
        
        let isLeftPOrQ = dfs(root.left, p, q, &lca)
        if isRootPOrQ && isLeftPOrQ {
            lca = root
            
            return true
        }
        
        let isRightPOrQ = dfs(root.right, p, q, &lca)
        if isRootPOrQ && isRightPOrQ {
            lca = root
            
            return true
        }
        
        if isLeftPOrQ && isRightPOrQ {
            lca = root
            
            return true
        }
        
        return isRootPOrQ || isLeftPOrQ || isRightPOrQ
    }
}

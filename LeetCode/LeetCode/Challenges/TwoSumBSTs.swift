// Created 10/12/2023.

import Foundation

//https://leetcode.com/problems/two-sum-bsts/
struct TwoSumBSTs {
    
    //Time: O(n + m) where n is the number of nodes in `root1`
    //               where m is the number of nodes in `root2`
    //Space: O(n + m)
    //binary tree
    //DFS
    //recursive
    //set
    //
    //Solution Description:
    //Using DFS we first convert the tree `root1` into a set - we use a set as we don't care how many times a value appears in
    //the tree only that it does appear. Then using DFS again we search through the tree `root2` and attempt to find if the delta
    //of `target` and the current node value is in `root1Values` - if it is present then we return true else we continue the left
    //and right branches of the tree. 
    //
    //Similar to: https://leetcode.com/problems/two-sum/
    func twoSumBSTs(_ root1: TreeNode?, _ root2: TreeNode?, _ target: Int) -> Bool {
        var root1Values = Set<Int>()
        convertToSet(root1, &root1Values)
        
        return findTarget(root2, root1Values, target)
    }
    
    private func convertToSet(_ node: TreeNode?, _ values: inout Set<Int>) {
        guard let node = node else {
            return
        }
        
        values.insert(node.val)
        
        convertToSet(node.left, &values)
        convertToSet(node.right, &values)
    }
    
    private func findTarget(_ node: TreeNode?, _ values: Set<Int>, _ target: Int) -> Bool {
        guard let node = node else {
            return false
        }
        
        let delta = target - node.val
        if values.contains(delta) {
            return true
        }
        
        return findTarget(node.left, values, target) || findTarget(node.right, values, target)
    }
}

//
//  SumOfRootToLeafBinaryNumbers.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
struct SumOfRootToLeafBinaryNumbers {
    
    //Time: O(n * h) where n is the number of nodes in the tree
    //               where h is the depth of the tree
    //Space: O(h)
    //binary tree
    //DFS
    //recursive
    //inout
    //backtracking
    //
    //Solution Description:
    //Using DFS we traverse to each leaf node, gradually building up the `bits` at each level. Once we reach the leaf node, we convert
    //the bits array into a decomal value by reversing the array elements (so that the MSB is in the largest index) and then raising 2
    //to the power of the index, to ensure we only count bits with a value of `1` we then multiple that raised value but the bit. This
    //decimal value is then added to `total`. We then remove the last value of `bits` as the recursive stack unwinds. We repeat this
    //process for all leaf nodes. One the DFS has completed we return `total`.
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var bits = [Int]()
        var total = 0
        
        dfs(root, &bits, &total)
        
        return total
    }
    
    private func dfs(_ root: TreeNode?, _ bits: inout [Int], _ total: inout Int) {
        guard let root else {
            return
        }
        
        bits.append(root.val)
        
        if root.left != nil || root.right != nil {
            dfs(root.left, &bits, &total)
            dfs(root.right, &bits, &total)
        } else {
            //convert to decimal and add to total
            var decimal = 0
            for (index, bit) in bits.reversed().enumerated() { //reverse to move MSB to largest index
                decimal += (bit * Int(pow(2.0, Double(index)))) // 2^index won't product the right value
            }
            total += decimal
        }
        
        bits.removeLast()
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //bit shifting
    //bit manipulation
    //
    //Solution Description:
    //Using DFS we gradually build up the value of the nodes as we descend each level. Once we get to the leaf nodes we
    //return the completed value. As the call stack unwinds we sum the values of the left and right child together and pass
    //that summed value up to the next level. We repeat this process until all we are back at the root at which point we
    //return that final summed value.
    func sumRootToLeaf2(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return dfs(root, 0)
    }
    
    private func dfs(_ node: TreeNode, _ value: Int) -> Int {
        let nextValue = value << 1 + node.val //bit shift
        
        if node.left == nil && node.right == nil { //leaf node
            return nextValue
        }
        
        var leftValue = 0
        if let left = node.left {
            leftValue = dfs(left, nextValue)
        }
        
        var rightValue = 0
        if let right = node.right {
            rightValue = dfs(right, nextValue)
        }
        
        return leftValue + rightValue
    }
}

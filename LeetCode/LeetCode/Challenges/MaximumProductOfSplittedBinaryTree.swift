// Created 21/01/2026.

import Foundation

//https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/
struct MaximumProductOfSplittedBinaryTree {
    
    //Time:
    //Space:
    //
    //
    //Solution Description:
    //
    func maxProduct(_ root: TreeNode?) -> Int {
        let treeSum = treeSum(root)

        var maxProduct = 0

        _ = treeProduct(root, treeSum, &maxProduct)

        return maxProduct % 1_000_000_007
    }

    private func treeSum(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        let leftSum = treeSum(root.left)
        let rightSum = treeSum(root.right)

        return leftSum + rightSum + root.val
    }

    private func treeProduct(_ root: TreeNode?, _ treeSum: Int, _ maxProduct: inout Int) -> Int {
        guard let root else {
            return 0
        }

        let leftSum = treeProduct(root.left, treeSum, &maxProduct)
        let rightSum = treeProduct(root.right, treeSum, &maxProduct)

        let productMinusLeft = (treeSum - leftSum) * leftSum
        maxProduct = max(maxProduct, productMinusLeft)

        let productMinusRight = (treeSum - rightSum) * rightSum
        maxProduct = max(maxProduct, productMinusRight)

        return leftSum + rightSum + root.val
    }
}

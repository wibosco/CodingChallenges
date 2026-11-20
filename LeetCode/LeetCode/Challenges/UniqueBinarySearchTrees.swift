// Created 22/12/2021.

import Foundation

//https://leetcode.com/problems/unique-binary-search-trees/
struct UniqueBinarySearchTrees {
    
    //Time: O(n ^ 2)
    //Space: O(n) where n is the size of `memo` and the depth of the recursive stack
    //binary tree
    //binary search tree
    //recursive
    //top-down
    //memoization
    //dictionary
    //inout
    //
    //Solution Description:
    //Rather than think of `n` as just a number, think of it as a range - `1...n`. In a BST, the nodes with a value smaller
    //than a node's value are part of its left subtree and the nodes with a larger value are part of its right subtree. Any
    //node in a binary tree is also the root of its own subtree. With these 3 pieces of information we know that for any
    //value `i` in the range, the values to its left must make up its left subtree and the values to its right must make up
    //its right subtree. As any node can be a root, this lends itself to a recursive solution. As we are not generating the
    //subtrees, the actual values in each subtree aren't important - a BST's shape depends only on how its values compare to
    //each other, so any `k` consecutive values produce the same number of trees as `1...k`. This means we only need to pass
    //the number of nodes in a subtree rather than its left and right bounds. When a subtree has 0 or 1 nodes, the count is
    //1 (an empty subtree is still a valid subtree). Many different roots lead to subtrees of the same size, so the same
    //counts would be calculated again and again. To avoid this, we store each count in `memo` once it has been calculated,
    //and before calculating a count we check `memo`, returning the stored count if there is one. As any value in `1...n`
    //can be the root, we take each value `i` in turn as the root, which divides the range into a left subtree of `i - 1`
    //nodes and a right subtree of `n - i` nodes. We recursively calculate `leftCount` and `rightCount` and, as every left
    //subtree can be paired with every right subtree, multiply them to get the number of trees with `i` as the root, adding
    //that to `count`. Once every value has been the root, `count` holds the total number of trees for `n`, which we store
    //in `memo` before returning it.
    //
    //Similar to: https://leetcode.com/problems/unique-binary-search-trees-ii/
    func numTrees(_ n: Int) -> Int {
        var memo = [Int: Int]()
        
        return countTrees(n, &memo)
    }
    
    private func countTrees(_ n: Int, _ memo: inout [Int: Int]) -> Int {
        guard n > 1 else {
            return 1
        }
        
        guard memo[n] == nil else {
            return memo[n]!
        }

        var count = 0

        for i in 1...n { //note the 1 as the problem goes from 1 to `n`
            let leftCount = countTrees((i - 1), &memo) //here we calculate from the end as we want `1..<i`
            let rightCount = countTrees((n - i), &memo) //here we calculate from the end as we want `(i + 1)...n`

            count += leftCount * rightCount
        }
        
        memo[n] = count

        return count
    }
    
    //Time: O(3 ^ n)
    //Space: O(n) where n is the depth of the recursive stack
    //binary tree
    //binary search tree
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Rather than think of `n` as just a number, think of it as a range - `1...n`. In a BST, the nodes with a value smaller
    //than a node's value are part of its left subtree and the nodes with a larger value are part of its right subtree. Any
    //node in a binary tree is also the root of its own subtree. With these 3 pieces of information we know that for any
    //value `i` in the range, the values to its left must make up its left subtree and the values to its right must make up
    //its right subtree. As any node can be a root, this lends itself to a recursive solution. As we are not generating the
    //subtrees, the actual values in each subtree aren't important - a BST's shape depends only on how its values compare
    //to each other, so any `k` consecutive values produce the same number of trees as `1...k`. This means we only need to
    //pass the number of nodes in a subtree rather than its left and right bounds. When a subtree has 0 or 1 nodes, the
    //count is 1 (an empty subtree is still a valid subtree). As any value in `1...n` can be the root, we take each value
    //`i` in turn as the root, which divides the range into a left subtree of `i - 1` nodes and a right subtree of `n - i`
    //nodes. We recursively calculate `leftCount` and `rightCount` and, as every left subtree can be paired with every right
    //subtree, multiply them to get the number of trees with `i` as the root, adding that to `count`. Once every value has
    //been the root, `count` holds the total number of trees for `n` and is returned.
    //
    //Similar to: https://leetcode.com/problems/unique-binary-search-trees-ii/
    func numTrees2(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }

        var count = 0

        for i in 1...n { //note the 1 as the problem goes from 1 to `n`
            let leftCount = numTrees2((i - 1)) //here we calculate from the end as we want `1..<i`
            let rightCount = numTrees2((n - i)) //here we calculate from the end as we want `(i + 1)...n`

            count += leftCount * rightCount
        }

        return count
    }
    
    //Time: O(n^2) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //sorted
    //
    //Solution Description:
    //Iterating through all possible roots (0..n) we split the tree around each root with everything left of the root being
    //the left branch and everything right of the root being the right branch. We then combine all those possible left and
    //right branches to form one whole tree with the root being `i` in `count`.
    //
    //N.B. https://www.youtube.com/watch?v=GgP75HAvrlY
    //N.B. https://leetcode.com/problems/unique-binary-search-trees/discuss/1425684/For-those-who-don't-understand-why-Cartesian-product-(Visualization)
    func numTrees3(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        
        var count = Array(repeating: 0, count: (n + 1))
        
        count[0] = 1
        count[1] = 1
        
        for i in 2...n {
            for j in 1...i {
                count[i] += count[(j - 1)] * count[(i - j)]
            }
        }
        
        return count[n]
    } 
}

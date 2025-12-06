// Created 08/12/2023.

import Foundation

//https://leetcode.com/problems/make-costs-of-paths-equal-in-a-binary-tree/
struct MakeCostsOfPathsEqualInABinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //inout
    //
    //Solution Description:
    //In order to make all paths equal in the tree we need to make all paths equal to the maximum existing path, this means
    //that one path in the tree should not have any increments made to it. In order to get the minimum increments we want
    //to ensure that the maximum increments possible are made at the highest level in the tree as one increment to a node
    //affects both child/subtrees of that node vs individually incrementing each child node i.e. 1 increment vs 2
    //increments. While it's possible to do this top-down, it is actually easier to do it bottom-up by equalising sibling
    //pairs - in order for a change to a parent node to have equal impact on the child/subtree nodes, those child/subtree
    //nodes need to be equal. So by equalising the child nodes to the greater value of those nodes we make the minimum
    //number of changes at that level. This also ensures that the path that doesn't need to change isn't changed. We
    //repeat this process as the recursive stack unwinds until we are back at root.
    func minIncrements(_ n: Int, _ cost: [Int]) -> Int {
        var increments = 0
        
        _ = dfs(cost, 0, &increments)
        
        return increments
    }
    
    private func dfs(_ graph: [Int], _ index: Int, _ increments: inout Int) -> Int {
        guard index < graph.count else {
            return 0
        }
        
        let val = graph[index]
        
        let leftChildIndex = (2 * index) + 1 //+1 as the example if 1-indexed but graph is 0-indexed
        let rightChildIndex = (2 * index) + 2
        
        let leftMaxPathValue = dfs(graph, leftChildIndex, &increments)
        let rightMaxPathValue = dfs(graph, rightChildIndex, &increments)
            
        increments += abs(leftMaxPathValue - rightMaxPathValue) //cost to equalise left and right branches
        
        return val + max(leftMaxPathValue, rightMaxPathValue) //no need to actually update values just pretend we have
    }
}

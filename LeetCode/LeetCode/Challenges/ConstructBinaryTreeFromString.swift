//
//  ConstructBinaryTreeFromString.swift
//  LeetCode
//
//  Created by William Boles on 01/04/2022.
//

import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-string/
struct ConstructBinaryTreeFromString {
    
    //Time: O(n) where n is the number of characters in s
    //Space: O(n)
    //string
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //inout
    //
    //Solution Description:
    //A binary tree is made up of smaller binary trees. When parsing `s`, a number (or collection of numbers) indicates the
    //`val` of a node, a "(" indicates a new subtree and a ")" indicates the end of a subtree. So as we can iterate through
    //`s` we are looking for those three components. We perform this iteration and building of the tree uses DFS - to avoid
    //re-parsing `s` multiple time we pass a shared `index` between each recursive. At each level we first extract the number
    //from `s` for that level and use it to create that levels node instance. We then determine if that node has any child
    //nodes by checking if there are more characters in `s` to parse and that the first of those characters is a "(" - for
    //the first "(" we encounter at that level we assign that subtree to the `left` property of `node` and if we encounter
    //another "(" we assign that subtree to the `right` property of `node`. To ensure that we treat the root the same as the
    //rest of the nodes before parsing a subtree we move `index` forward to omit the "(" from that levels version of `s`
    //(root doesn't have a "("). At the end of each level we also increment `index` to move past the closing bracket for that
    //level ")"
    func str2tree(_ s: String) -> TreeNode? {
        guard !s.isEmpty else {
            return nil
        }
        
        let characters = Array(s)
        var index = 0
       
        let root = dfs(characters, &index)
        
        return root
    }
    
    private func dfs(_ characters: [Character], _ index: inout Int) -> TreeNode? {
        guard index < characters.count else {
            return nil
        }
        
        let num = extractNum(characters, &index)
        let node = TreeNode(num)
        
        if index < characters.count && characters[index] == "(" {
            index += 1 //omit "(" from the next DFS call
            node.left = dfs(characters, &index)
        }
        
        if node.left != nil && index < characters.count && characters[index] == "(" {
            index += 1 //omit "(" from the next DFS call
            node.right = dfs(characters, &index)
        }
        
        index += 1 //brackets are balanced so move past ")"
        
        return node
    }
    
    private func extractNum(_ characters: [Character], _ index: inout Int) -> Int {
        var strNum = ""
        while index < characters.count {
            let c = characters[index]
            
            guard c.isWholeNumber || c == "-" else { //can't just check that `c` is a digit as we need to handle negative numbers
                break
            }
            
            strNum += String(c)
            index += 1
        }
        
        return Int(strNum)!
    }
}

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
    //Space: O(h) where h is height of the tree
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
            
            //can't just check that `c` is a digit as we need to handle negative numbers
            guard c.isWholeNumber || c == "-" else {
                break
            }
            
            strNum += String(c)
            index += 1
        }
        
        return Int(strNum)!
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is height of the tree
    //string
    //binary tree
    //stack
    //
    //Solution Description:
    //As we iterate through `s` and nodes we gradually add to and remove from a stack. The stack allows us to hold onto the
    //parents while we build the child subtrees, regardless of how deep the child subtrees might be. We only add nodes to the
    //stack if they are parent nodes i.e. not leaf nodes. We can determine if a node is a leaf node whether a ")" character
    //immediately follows the number value of the node. If we encounter a ")" preceded by another ")" then we know that the
    //subbtree with the `stack.last` parent as the root node has been completed and can pop that node from the stack. The
    //overall root node does not have a parent so will never be popped from the stack. Once we process all characters in `s`
    //we return the root node from the stack.
    func str2tree2(_ s: String) -> TreeNode? {
        let chars = Array(s)

        var stack = [TreeNode]()

        var p1 = 0

        while p1 < chars.count {
            if chars[p1] == "-" || chars[p1].isNumber {
                let sign = chars[p1] == "-" ? -1 : 1
                if sign == -1 {
                    p1 += 1
                }

                var num = 0
                while p1 < chars.count, chars[p1].isNumber {
                    num *= 10
                    num += chars[p1].wholeNumberValue!

                    p1 += 1
                }
                num *= sign

                let node = TreeNode(num)

                if let parent = stack.last {
                    //always fill left to right
                    if parent.left == nil {
                        parent.left = node
                    } else {
                        parent.right = node
                    }

                    if chars[p1] == "(" {
                        //not a leaf node so add it to the stack
                        stack.append(node)
                    }
                } else {
                    //root node
                    stack.append(node)
                }
            } else if chars[p1] == ")" {
                stack.removeLast()
            }

            p1 += 1
        }

        return stack.first
    }
}

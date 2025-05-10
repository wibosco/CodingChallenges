// Created 10/05/2025.

import Foundation

//https://leetcode.com/problems/print-immutable-linked-list-in-reverse/
struct PrintImmutableLinkedListInReverse {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //graph theory
    //DFS
    //recursion
    //
    //Solution Description:
    //Treating the linked list as a graph can use DFS to reach the tail and then as the stack unwinds call `printValue` to
    //print the values tail->head.
    func printLinkedListInReverse(_ head: ImmutableListNode?) {
        dfs(head)
    }

    private func dfs(_ head: ImmutableListNode?) {
        guard let head else {
            return
        }

        dfs(head.getNext())
        head.printValue()
    }
}

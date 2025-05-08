// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/winner-of-the-linked-list-game/
struct WinnerOfTheLinkedListGame {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //
    //Solution Description:
    //Using two counters as we iterate through the list we increment one or the other based on the which node has the larger
    //value. Once all nodes have been processed, we compare the two counters and return the result.
    func gameResult(_ head: ListNode?) -> String {
        var oddCount = 0
        var evenCount = 0
        
        var head = head
        while let even = head, let odd = head?.next {
            if even.val > odd.val {
                evenCount += 1
            } else {
                oddCount += 1
            }
            
            head = head?.next?.next
        }
        
        if evenCount > oddCount {
            return "Even"
        } else if oddCount > evenCount {
            return "Odd"
        } else {
            return "Tie"
        }
    }
}

// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/next-greater-node-in-linked-list/
struct NextGreaterNodeInLinkedList {
    
    //Time: O(n) where n is the number of elements in this list
    //Space: O(n)
    //linked list
    //stack
    //monotonic stack
    //fast forward
    //
    //Solution Description:
    //We iterate through the list and add the value of each node to `values`. With `values` we now know the number of elements
    //in the linked list and can default the `answers` array elements to 0. We then iterate through `values` and gradually fill
    //in `answers`. To avoid having to look forward in the stack we build up a monotonic stack - this stack will have the
    //smallest unanswered value element at its head. If the current value is greater than the head of the stack then it means
    //that the current value is the next greater node for that stack element so we can update `answers` with that details -
    //it's important to note that we are the stack elements answer not the current elements answer. We repeat this process
    //until the stack element is either greater than the current element or empty. We then add the current element to the stack
    //and repeat the process. Once all elements have been processed we return `answers`.
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var values = [Int]()
        var current = head
        while let c = current {
            values.append(c.val)
            
            current = c.next
        }
        
        var answers = Array(repeating: 0, count: values.count)
        var stack = [Int]()
        
        for i in 0..<values.count {
            while let last = stack.last, values[i] > values[last] {
                //the current value is greater than the previous unanswered elements
                //so is that previous elements next greater node
                answers[last] = values[i]
                stack.removeLast()
            }
            //add current value to be solved in a future iteration
            stack.append(i)
        }
        
        return answers
    }
    
    //Time: O(n ^ 2) where n is the number of elements in this list
    //Space: O(n)
    //linked list
    //nested loops
    //
    //Solution Description:
    //We iterate through the elements in the list and for ever current element we attempt to look forward in the list to find
    //the next node that is larger in value. To look forward we have a nested while loop. If we find a larger value we set it
    //in the `answer` array; if we don't find a larger value we set 0. We repeat this process for all elements in the list.
    //Once all elements have been processed we return `answer`.
    func nextLargerNodes2(_ head: ListNode?) -> [Int] {
        var answer = [Int]()

        var current = head
        while let c = current {
            var greater = c.next
            while let g = greater {
                if g.val > c.val {
                    answer.append(g.val)
                    break
                }

                greater = g.next
            }

            if greater == nil {
                answer.append(0)
            }

            current = c.next
        }

        return answer
    }
}

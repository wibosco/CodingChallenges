//
//  IntersectionOfTwoLinkedLists.swift
//  LeetCode
//
//  Created by William Boles on 03/08/2023.
//

import Foundation

//https://leetcode.com/problems/intersection-of-two-linked-lists/
struct IntersectionOfTwoLinkedLists {
    
    //Time: O(n +  m) where n is the number of nodes in `headA` list
    //                where m is the number of nodes in `headB` list
    //Space: O(1)
    //linked list
    //two pointers
    //
    //Solution Description:
    //As `headA` and `headA` can begin at different distances from any possible intersection in the tree, simply moving
    //through both lists might not result in us finding the intersection without using additional memory to store each node.
    //To overcome this limitation and avoid using additional memory, we need a way to "adjust" any difference in starting
    //distance to the intersection node - we can do this with two pointers. First we start both pointers at `headA` and
    //`headB` we navigate through each list up the tree until one of the pointers hits the end at which we reset it to the
    //starting position of the slower pointer, we continue to process the nodes until the other pointer also hits the end of
    //its list at which point it is reset to the quicker pointers starting position. Both pointers will now be the same
    //distance away from the intersection node and we move through both lists until they meet. If there is no intersection
    //node and either of them reaches the end of their list then we break the loop and return nil.
    //
    //Similar to https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/
    //Similar to: https://leetcode.com/problems/find-the-duplicate-number/
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p1 = headA
        var p2 = headB
        
        var p1ReachedTopCount = 0
        var p2ReachedTopCount = 0
        
        while p1 !== p2 && p1ReachedTopCount < 2 && p2ReachedTopCount < 2 {
            if let next = p1?.next {
                p1 = next
            } else {
                //reached the end of `headA` list so switching over to `headB` list
                p1ReachedTopCount += 1
                p1 = headB
            }
            
            if let next = p2?.next {
                p2 = next
            } else {
                //reached the end of `headB` list so switching over to `headA` list
                p2ReachedTopCount += 1
                p2 = headA
            }
        }
        
        return p1 === p2 ? p1 : nil //could have been p2
    }
    
    //Time: O(n +  m) where n is the number of nodes in `headA` list
    //              where m is the number of nodes in `headB` list
    //Space: O(n)
    //linked list
    //set
    //
    //Solution Description:
    //First we iterate through the `headA` list and store each node that we encounter into a set. We then iterate
    //through the `headB` list and attempt to find each we encounter in that set, if we find a node then we know that
    //that node is the first intersection node and so we return it immediately. If having iterated through all nodes
    //in the `headB` list and we haven't found the same node in the set then we know that there is no intersection
    //node and can return nil.
    func getIntersectionNodeSet(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var nodesInA = Set<ListNode>()
        var currentA = headA
        
        while let c = currentA {
            nodesInA.insert(c)
            currentA = c.next
        }
        
        var currentB = headB
        
        while let c = currentB {
            if nodesInA.contains(c) {
                return c
            }
            
            currentB = c.next
        }
        
        return nil
    }
}

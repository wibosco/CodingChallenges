// Created 30/05/2016.

import Foundation

//CtCI 2.7
final class LinkedListIntersectingNode {
     static func areIntersecting(linkedListA: SingleLinkedList, linkedListB: SingleLinkedList) -> Bool {
        var linkedListANode = linkedListA.head
        
        while linkedListANode != nil {
            var linkedListBNode = linkedListB.head
            while linkedListBNode != nil {
                if linkedListBNode ==  linkedListANode {
                    return true
                }
                
                linkedListBNode = linkedListBNode?.next
            }
            linkedListANode = linkedListANode?.next
        }
        return false
    }
}

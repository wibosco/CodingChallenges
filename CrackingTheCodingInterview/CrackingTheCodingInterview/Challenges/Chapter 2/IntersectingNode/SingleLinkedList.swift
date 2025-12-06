// Created 30/05/2016.

import Foundation

final class SingleLinkedList {
    var head: LinkedListNode?
    
    // MARK: - Add
    
    func addNode(node: LinkedListNode) {
        guard var head = head else {
            self.head = node
            return
        }
        
        while head.next != nil {
            head = head.next!
        }
        head.next = node
    }
}

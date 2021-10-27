//
//  CircularLinkedList.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 2.8
class CircularLinkedList: NSObject {

    class func isCircular(linkedList: SingleLinkedList) -> Bool {
        
        var slow = linkedList.head
        var fast = slow!.next
        
        while fast != nil {
            
            if slow == fast {
                
                return true
            }
            
            slow = slow!.next
            fast = fast!.next?.next
        }
        
        return false
    }
    
    class func isCircularOnNode(linkedList: SingleLinkedList) -> LinkedListNode? {
        
        var node = linkedList.head
        
        var nodesVisited = [LinkedListNode: Bool]()
        
        while node != nil {
            
            if nodesVisited[node!] != nil  {
                
                return node
            }
            else {
                
                nodesVisited[node!] = true
            }
        
            node = node!.next
        }
        
        return nil
    }
    
    class func isCircularFromNode(linkedList: SingleLinkedList) -> LinkedListNode? {
        
        var advanced = linkedList.head?.next
        var followUp = linkedList.head
        
        var nodesVisited = [LinkedListNode: Bool]()
        
        while advanced != nil {
            
            if nodesVisited[advanced!] != nil  {
                
                return followUp
            }
            else {
                
                nodesVisited[advanced!] = true
            }
            
            advanced = advanced?.next
            followUp = followUp?.next
        }
        
        return nil
    }
}

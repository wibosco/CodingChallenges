//
//  LinkedListIntersectingNodeTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class LinkedListIntersectingNodeTests: XCTestCase {
    
    // MARK: Tests
    
    func test_linkedListIntersectingNodeA() {
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(LinkedListNode.init(value: 1))
        linkedListA.addNode(LinkedListNode.init(value: 2))
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(LinkedListNode.init(value: 1))
        linkedListB.addNode(LinkedListNode.init(value: 2))
        linkedListB.addNode(LinkedListNode.init(value: 3))
        linkedListB.addNode(LinkedListNode.init(value: 4))
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA, linkedListB: linkedListB)
        
        XCTAssertFalse(intersecting)
    }
    
    func test_linkedListIntersectingNodeB() {
        
        let commonNode = LinkedListNode.init(value: 2)
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(LinkedListNode.init(value: 1))
        linkedListA.addNode(commonNode)
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(LinkedListNode.init(value: 1))
        linkedListB.addNode(LinkedListNode.init(value: 2))
        linkedListB.addNode(commonNode)
        linkedListB.addNode(LinkedListNode.init(value: 4))
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA, linkedListB: linkedListB)
        
        XCTAssertTrue(intersecting)
    }
    
    func test_linkedListIntersectingNodeC() {
        
        let commonNode = LinkedListNode.init(value: 2)
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(commonNode)
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(LinkedListNode.init(value: 1))
        linkedListB.addNode(LinkedListNode.init(value: 2))
        linkedListB.addNode(LinkedListNode.init(value: 4))
        linkedListB.addNode(commonNode)
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA, linkedListB: linkedListB)
        
        XCTAssertTrue(intersecting)
    }
    
    func test_linkedListIntersectingNodeD() {
        
        let commonNode = LinkedListNode.init(value: 2)
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        linkedListA.addNode(LinkedListNode.init(value: 3))
        linkedListA.addNode(LinkedListNode.init(value: 4))
        linkedListA.addNode(commonNode)
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(LinkedListNode.init(value: 1))
        linkedListB.addNode(LinkedListNode.init(value: 2))
        linkedListB.addNode(LinkedListNode.init(value: 4))
        linkedListB.addNode(commonNode)
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA, linkedListB: linkedListB)
        
        XCTAssertTrue(intersecting)
    }
    
}

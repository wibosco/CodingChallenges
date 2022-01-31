//
//  LinkedListIntersectingNodeTests.swift
//  CodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

class LinkedListIntersectingNodeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_linkedListIntersectingNodeA() {
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(node: LinkedListNode(value: 1))
        linkedListA.addNode(node: LinkedListNode(value: 2))
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(node: LinkedListNode(value: 1))
        linkedListB.addNode(node: LinkedListNode(value: 2))
        linkedListB.addNode(node: LinkedListNode(value: 3))
        linkedListB.addNode(node: LinkedListNode(value: 4))
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA: linkedListA, linkedListB: linkedListB)
        
        XCTAssertFalse(intersecting)
    }
    
    func test_linkedListIntersectingNodeB() {
        let commonNode = LinkedListNode(value: 2)
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(node: LinkedListNode(value: 1))
        linkedListA.addNode(node: commonNode)
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(node: LinkedListNode(value: 1))
        linkedListB.addNode(node: LinkedListNode(value: 2))
        linkedListB.addNode(node: commonNode)
        linkedListB.addNode(node: LinkedListNode(value: 4))
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA: linkedListA, linkedListB: linkedListB)
        
        XCTAssertTrue(intersecting)
    }
    
    func test_linkedListIntersectingNodeC() {
        
        let commonNode = LinkedListNode(value: 2)
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(node: commonNode)
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(node: LinkedListNode(value: 1))
        linkedListB.addNode(node: LinkedListNode(value: 2))
        linkedListB.addNode(node: LinkedListNode(value: 4))
        linkedListB.addNode(node: commonNode)
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA: linkedListA, linkedListB: linkedListB)
        
        XCTAssertTrue(intersecting)
    }
    
    func test_linkedListIntersectingNodeD() {
        
        let commonNode = LinkedListNode(value: 2)
        
        let linkedListA = SingleLinkedList()
        
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        linkedListA.addNode(node: LinkedListNode(value: 3))
        linkedListA.addNode(node: LinkedListNode(value: 4))
        linkedListA.addNode(node: commonNode)
        
        let linkedListB = SingleLinkedList()
        
        linkedListB.addNode(node: LinkedListNode(value: 1))
        linkedListB.addNode(node: LinkedListNode(value: 2))
        linkedListB.addNode(node: LinkedListNode(value: 4))
        linkedListB.addNode(node: commonNode)
        
        let intersecting = LinkedListIntersectingNode.areIntersecting(linkedListA: linkedListA, linkedListB: linkedListB)
        
        XCTAssertTrue(intersecting)
    }
    
}

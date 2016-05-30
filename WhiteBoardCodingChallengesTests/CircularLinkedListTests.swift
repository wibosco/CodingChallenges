//
//  CircularLinkedListTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class CircularLinkedListTests: XCTestCase {
    
    // MARK: Circular
    
    func test_circularLinkedListA() {
        
        let circularNodeA = LinkedListNode.init(value: 3)
        let circularNodeB = LinkedListNode.init(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(circularNodeA)
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(circularNodeB)
        
        XCTAssertTrue(CircularLinkedList.isCircular(linkedList))
    }
    
    func test_circularLinkedListB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        
        XCTAssertFalse(CircularLinkedList.isCircular(linkedList))
    }
    
    // Mark CircularOnNode
    
    func test_isCircularOnNodeA() {
        
        let circularNodeA = LinkedListNode.init(value: 3)
        let circularNodeB = LinkedListNode.init(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(circularNodeA)
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(circularNodeB)
        
        XCTAssertEqual(circularNodeA, CircularLinkedList.isCircularOnNode(linkedList))
    }
    
    func test_isCircularOnNodeB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        
        XCTAssertNil(CircularLinkedList.isCircularOnNode(linkedList))
    }
    
    // Mark CircularFromNode
    
    func test_isCircularFromNodeA() {
        
        let circularNodeA = LinkedListNode.init(value: 3)
        let circularNodeB = LinkedListNode.init(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(circularNodeA)
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(circularNodeB)
        
        XCTAssertEqual(circularNodeB, CircularLinkedList.isCircularFromNode(linkedList))
    }
    
    func test_isCircularFromNodeB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        linkedList.addNode(LinkedListNode.init(value: 3))
        
        XCTAssertNil(CircularLinkedList.isCircularFromNode(linkedList))
    }


}

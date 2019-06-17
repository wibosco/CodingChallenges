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
        
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: circularNodeA)
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: circularNodeB)
        
        XCTAssertTrue(CircularLinkedList.isCircular(linkedList: linkedList))
    }
    
    func test_circularLinkedListB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        
        XCTAssertFalse(CircularLinkedList.isCircular(linkedList: linkedList))
    }
    
    // Mark CircularOnNode
    
    func test_isCircularOnNodeA() {
        
        let circularNodeA = LinkedListNode.init(value: 3)
        let circularNodeB = LinkedListNode.init(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: circularNodeA)
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: circularNodeB)
        
        XCTAssertEqual(circularNodeA, CircularLinkedList.isCircularOnNode(linkedList: linkedList))
    }
    
    func test_isCircularOnNodeB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        
        XCTAssertNil(CircularLinkedList.isCircularOnNode(linkedList: linkedList))
    }
    
    // Mark CircularFromNode
    
    func test_isCircularFromNodeA() {
        
        let circularNodeA = LinkedListNode.init(value: 3)
        let circularNodeB = LinkedListNode.init(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: circularNodeA)
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: circularNodeB)
        
        XCTAssertEqual(circularNodeB, CircularLinkedList.isCircularFromNode(linkedList: linkedList))
    }
    
    func test_isCircularFromNodeB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        linkedList.addNode(node: LinkedListNode.init(value: 3))
        
        XCTAssertNil(CircularLinkedList.isCircularFromNode(linkedList: linkedList))
    }


}

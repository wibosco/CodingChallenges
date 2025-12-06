// Created 30/05/2016.


import XCTest

@testable import CrackingTheCodingInterview

final class CircularLinkedListTests: XCTestCase {
    
    // MARK: Circular
    
    func test_circularLinkedListA() {
        let circularNodeA = LinkedListNode(value: 3)
        let circularNodeB = LinkedListNode(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: circularNodeA)
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: circularNodeB)
        
        XCTAssertTrue(CircularLinkedList.isCircular(linkedList: linkedList))
    }
    
    func test_circularLinkedListB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        
        XCTAssertFalse(CircularLinkedList.isCircular(linkedList: linkedList))
    }
    
    // Mark CircularOnNode
    
    func test_isCircularOnNodeA() {
        
        let circularNodeA = LinkedListNode(value: 3)
        let circularNodeB = LinkedListNode(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: circularNodeA)
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: circularNodeB)
        
        XCTAssertEqual(circularNodeA, CircularLinkedList.isCircularOnNode(linkedList: linkedList))
    }
    
    func test_isCircularOnNodeB() {
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        
        XCTAssertNil(CircularLinkedList.isCircularOnNode(linkedList: linkedList))
    }
    
    // Mark CircularFromNode
    
    func test_isCircularFromNodeA() {
        let circularNodeA = LinkedListNode(value: 3)
        let circularNodeB = LinkedListNode(value: 3)
        
        circularNodeB.next = circularNodeA
        
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: circularNodeA)
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: circularNodeB)
        
        XCTAssertEqual(circularNodeB, CircularLinkedList.isCircularFromNode(linkedList: linkedList))
    }
    
    func test_isCircularFromNodeB() {
        let linkedList = SingleLinkedList()
        
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        linkedList.addNode(node: LinkedListNode(value: 3))
        
        XCTAssertNil(CircularLinkedList.isCircularFromNode(linkedList: linkedList))
    }
}

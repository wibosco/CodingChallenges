//
//  IntersectionOfTwoLinkedListsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/08/2023.
//

import XCTest

@testable import LeetCode

final class IntersectionOfTwoLinkedListsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let dataA = [4, 1, 8, 4, 5]
        let dataB = [5, 6, 1, 8, 4, 5]
        
        let headA = ListNode.deserialize(dataA)
        let headB = ListNode.deserialize(dataB)
        
        let skipA = 2
        let skipB = 3
        
        var intersectionNodeA = headA
        
        for _ in 0..<skipA {
            intersectionNodeA = intersectionNodeA?.next
        }
        
        var intersectionParentNodeB = headB
        
        for _ in 0..<(skipB - 1) {
            intersectionParentNodeB = intersectionParentNodeB?.next
        }
        
        intersectionParentNodeB?.next = intersectionNodeA
        
        let result = IntersectionOfTwoLinkedLists().getIntersectionNode(headA, headB)
        
        XCTAssertTrue(result === intersectionNodeA)
    }
    
    func test_B() {
        let dataA = [1, 9, 1, 2, 4]
        let dataB = [3, 2, 4]
        
        let headA = ListNode.deserialize(dataA)
        let headB = ListNode.deserialize(dataB)
        
        let skipA = 3
        let skipB = 1
        
        var intersectionNodeA = headA
        
        for _ in 0..<skipA {
            intersectionNodeA = intersectionNodeA?.next
        }
        
        var intersectionParentNodeB = headB
        
        for _ in 0..<(skipB - 1) {
            intersectionParentNodeB = intersectionParentNodeB?.next
        }
        
        intersectionParentNodeB?.next = intersectionNodeA
        
        let result = IntersectionOfTwoLinkedLists().getIntersectionNode(headA, headB)
        
        XCTAssertTrue(result === intersectionNodeA)
    }
    
    func test_C() {
        let dataA = [2, 6, 4]
        let dataB = [1, 5]
        
        let headA = ListNode.deserialize(dataA)
        let headB = ListNode.deserialize(dataB)
        
        
        
        let result = IntersectionOfTwoLinkedLists().getIntersectionNode(headA, headB)
        
        XCTAssertNil(result)
    }
}

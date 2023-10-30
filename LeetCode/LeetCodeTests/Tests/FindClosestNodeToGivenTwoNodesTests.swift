//
//  FindClosestNodeToGivenTwoNodesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/10/2023.
//

import XCTest

@testable import LeetCode

final class FindClosestNodeToGivenTwoNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let edges = [2,2,3,-1]
        let node1 = 0
        let node2 = 1
            
        let result = FindClosestNodeToGivenTwoNodes.closestMeetingNode(edges, node1, node2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let edges = [1,2,-1]
        let node1 = 0
        let node2 = 2
            
        let result = FindClosestNodeToGivenTwoNodes.closestMeetingNode(edges, node1, node2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let edges = [5,3,1,0,2,4,5]
        let node1 = 3
        let node2 = 2
            
        let result = FindClosestNodeToGivenTwoNodes.closestMeetingNode(edges, node1, node2)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let edges = [9,8,7,0,5,6,1,3,2,2]
        let node1 = 1
        let node2 = 6
            
        let result = FindClosestNodeToGivenTwoNodes.closestMeetingNode(edges, node1, node2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_E() {
        let edges = [2,0,0]
        let node1 = 2
        let node2 = 0
            
        let result = FindClosestNodeToGivenTwoNodes.closestMeetingNode(edges, node1, node2)
        
        XCTAssertEqual(result, 0)
    }
}

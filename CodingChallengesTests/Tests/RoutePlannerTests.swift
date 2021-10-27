//
//  RoutePlannerTests.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class RoutePlannerTests: XCTestCase {
    
    // MARK: PathExists
    
    func test_routeExistsAsDirectConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        
        nodeA.addConnection(node: nodeB)
        
        routePlanner.addNode(node: nodeA)
        routePlanner.addNode(node: nodeB)
        
        XCTAssertTrue(routePlanner.pathExistsBetweenNodes(source: nodeA, destination: nodeB))
    }
    
    func test_routeExistsAsDistantConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        let nodeD = RoutePlannerNode()
        let nodeE = RoutePlannerNode()
        
        nodeA.addConnection(node: nodeB)
        nodeB.addConnection(node: nodeC)
        nodeB.addConnection(node: nodeD)
        nodeD.addConnection(node: nodeE)
        
        routePlanner.addNode(node: nodeA)
        routePlanner.addNode(node: nodeB)
        routePlanner.addNode(node: nodeC)
        routePlanner.addNode(node: nodeD)
        routePlanner.addNode(node: nodeE)
        
        XCTAssertTrue(routePlanner.pathExistsBetweenNodes(source: nodeA, destination: nodeE))
    }
    
    func test_routeDoesNotExist() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        
        nodeA.addConnection(node: nodeB)
        
        routePlanner.addNode(node: nodeA)
        routePlanner.addNode(node: nodeB)
        routePlanner.addNode(node: nodeC)
        
        XCTAssertFalse(routePlanner.pathExistsBetweenNodes(source: nodeA, destination: nodeC))
    }
    
    // MARK: Path
    
    func test_pathAsDirectConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        
        nodeA.addConnection(node: nodeB)
        
        routePlanner.addNode(node: nodeA)
        routePlanner.addNode(node: nodeB)
        
        XCTAssertEqual([nodeB, nodeA], routePlanner.pathBetweenNodes(source: nodeA, destination: nodeB)!)
    }
    
    func test_pathExistsAsDistantConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        let nodeD = RoutePlannerNode()
        let nodeE = RoutePlannerNode()
        
        nodeA.addConnection(node: nodeB)
        nodeB.addConnection(node: nodeC)
        nodeB.addConnection(node: nodeD)
        nodeD.addConnection(node: nodeE)
        
        routePlanner.addNode(node: nodeA)
        routePlanner.addNode(node: nodeB)
        routePlanner.addNode(node: nodeC)
        routePlanner.addNode(node: nodeD)
        routePlanner.addNode(node: nodeE)
        
        XCTAssertEqual([nodeE, nodeD, nodeB, nodeA], routePlanner.pathBetweenNodes(source: nodeA, destination: nodeE)!)
    }
    
    func test_pathDoesNotExist() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        
        nodeA.addConnection(node: nodeB)
        
        routePlanner.addNode(node: nodeA)
        routePlanner.addNode(node: nodeB)
        routePlanner.addNode(node: nodeC)
        
        XCTAssertNil(routePlanner.pathBetweenNodes(source: nodeA, destination: nodeC))
    }
    
}

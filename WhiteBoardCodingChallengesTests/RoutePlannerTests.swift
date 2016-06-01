//
//  RoutePlannerTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class RoutePlannerTests: XCTestCase {
    
    // MARK: PathExists
    
    func test_routeExistsAsDirectConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        
        nodeA.addConnection(nodeB)
        
        routePlanner.addNode(nodeA)
        routePlanner.addNode(nodeB)
        
        XCTAssertTrue(routePlanner.pathExistsBetweenNodes(nodeA, destination: nodeB))
    }
    
    func test_routeExistsAsDistantConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        let nodeD = RoutePlannerNode()
        let nodeE = RoutePlannerNode()
        
        nodeA.addConnection(nodeB)
        nodeB.addConnection(nodeC)
        nodeB.addConnection(nodeD)
        nodeD.addConnection(nodeE)
        
        routePlanner.addNode(nodeA)
        routePlanner.addNode(nodeB)
        routePlanner.addNode(nodeC)
        routePlanner.addNode(nodeD)
        routePlanner.addNode(nodeE)
        
        XCTAssertTrue(routePlanner.pathExistsBetweenNodes(nodeA, destination: nodeE))
    }
    
    func test_routeDoesNotExist() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        
        nodeA.addConnection(nodeB)
        
        routePlanner.addNode(nodeA)
        routePlanner.addNode(nodeB)
        routePlanner.addNode(nodeC)
        
        XCTAssertFalse(routePlanner.pathExistsBetweenNodes(nodeA, destination: nodeC))
    }
    
    // MARK: Path
    
    func test_pathAsDirectConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        
        nodeA.addConnection(nodeB)
        
        routePlanner.addNode(nodeA)
        routePlanner.addNode(nodeB)
        
        XCTAssertEqual([nodeB, nodeA], routePlanner.pathBetweenNodes(nodeA, destination: nodeB)!)
    }
    
    func test_pathExistsAsDistantConnection() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        let nodeD = RoutePlannerNode()
        let nodeE = RoutePlannerNode()
        
        nodeA.addConnection(nodeB)
        nodeB.addConnection(nodeC)
        nodeB.addConnection(nodeD)
        nodeD.addConnection(nodeE)
        
        routePlanner.addNode(nodeA)
        routePlanner.addNode(nodeB)
        routePlanner.addNode(nodeC)
        routePlanner.addNode(nodeD)
        routePlanner.addNode(nodeE)
        
        XCTAssertEqual([nodeE, nodeD, nodeB, nodeA], routePlanner.pathBetweenNodes(nodeA, destination: nodeE)!)
    }
    
    func test_pathDoesNotExist() {
        
        let routePlanner = RoutePlanner()
        
        let nodeA = RoutePlannerNode()
        let nodeB = RoutePlannerNode()
        let nodeC = RoutePlannerNode()
        
        nodeA.addConnection(nodeB)
        
        routePlanner.addNode(nodeA)
        routePlanner.addNode(nodeB)
        routePlanner.addNode(nodeC)
        
        XCTAssertNil(routePlanner.pathBetweenNodes(nodeA, destination: nodeC))
    }
    
}

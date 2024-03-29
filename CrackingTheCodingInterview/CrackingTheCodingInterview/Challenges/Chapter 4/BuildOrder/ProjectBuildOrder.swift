//
//  BuildOrder.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 02/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 4.7
struct ProjectBuildOrder {

     static func buildOrder(projects: [String], dependencies: [[String]]) -> [ProjectBuildOrderNode]? {
        let nodes = buildNodes(projects: projects, dependencies: dependencies)
        for node in nodes {
            for dependency in node.dependencies {
                if dependencyCycleExistsBetweenNodes(source: dependency, destination: node) {
                    return nil
                }
            }
        }
        
        var orderedNodes = [ProjectBuildOrderNode]()
    
        for node in nodes {
            if !node.pathVisited {
                buildOrder(rootNode: node, visitedNodes: &orderedNodes)
            }
        }
        
        return orderedNodes
    }
    
    private  static func buildOrder(rootNode: ProjectBuildOrderNode, visitedNodes: inout [ProjectBuildOrderNode]) {
        for dependency in rootNode.dependencies {
            if !dependency.pathVisited {
                buildOrder(rootNode: dependency, visitedNodes: &visitedNodes)
            }
        }
        
        visitedNodes.append(rootNode)
        rootNode.pathVisited = true
    }
    
    private  static func buildNodes(projects: [String], dependencies: [[String]]) -> [ProjectBuildOrderNode] {
        var nodes = [String: ProjectBuildOrderNode]()
        
        for project in projects {
            let node = ProjectBuildOrderNode(value: project)
            
            nodes[project] = node
        }
        
        for dependencyPair in dependencies {
            let dependent = dependencyPair[1]
            let dependency = dependencyPair[0]
            
            let dependentNode = nodes[dependent]
            let dependencyNode = nodes[dependency]
            
            dependentNode?.addDependency(dependency: dependencyNode!)
        }
        
        return Array(nodes.values)
    }
    
    private  static func dependencyCycleExistsBetweenNodes(source: ProjectBuildOrderNode, destination: ProjectBuildOrderNode) -> Bool {
        var queue = [ProjectBuildOrderNode]()
        queue.append(source)
        
        while queue.count > 0 {
            let node = queue.removeFirst()
            
            for dependency in node.dependencies {
                if dependency == destination {
                    return true
                }
                
                if !dependency.visited {
                    dependency.visited = true
                    
                    queue.append(dependency)
                }
            }
        }
        
        return false
    }
}

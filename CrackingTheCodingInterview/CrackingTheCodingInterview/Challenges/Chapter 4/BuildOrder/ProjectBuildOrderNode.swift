//
//  BuildOrderNode.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 02/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

final class ProjectBuildOrderNode {
    var value: String
    
    var visited = false
    var pathVisited = false
    var dependencies = [ProjectBuildOrderNode]()
    
    // MARK: - Init
    
    init(value: String) {
        self.value = value
    }
    
    // MARK: - Dependency
    
    func addDependency(dependency: ProjectBuildOrderNode) {
        
        dependencies.append(dependency)
    }
}

extension ProjectBuildOrderNode: Equatable {
    static func == (lhs: ProjectBuildOrderNode, rhs: ProjectBuildOrderNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

//
//  BuildOrderNode.swift
//  CodingChallenges
//
//  Created by William Boles on 02/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ProjectBuildOrderNode: NSObject {

    // MARK: Properties
    
    var value: String
    
    var visited = false
    var pathVisited = false
    
    var dependencies: [ProjectBuildOrderNode] = {
       
        return [ProjectBuildOrderNode]()
    }()
    
    // MARK: Init
    
    init(value: String) {
        
        self.value = value
        
        super.init()
    }
    
    // MARK: Dependency
    
    func addDependency(dependency: ProjectBuildOrderNode) {
        
        dependencies.append(dependency)
    }
}

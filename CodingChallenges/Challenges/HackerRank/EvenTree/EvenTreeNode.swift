//
//  EvenTreeNode.swift
//  CodingChallenges
//
//  Created by William Boles on 29/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class EvenTreeNode: NSObject {

    // MARK: - Properties
    
    var value: Int // to help with debugging
    var parent: EvenTreeNode?
    var children: [EvenTreeNode] = {
        return [EvenTreeNode]()
    }()
    
    // MARK: - Lifecycle
    
    init(value: Int) {
        self.value = value
        
        super.init()
    }
    
    // MARK: Child
    
    func addChild(child: EvenTreeNode) {
        children.append(child)
        child.parent = self
    }
    
    // MARK: Parent
    
    func removeChild(child: EvenTreeNode) {
        let childIndex = children.firstIndex(of: child)!
        children.remove(at: childIndex)
        child.parent = nil
    }
}

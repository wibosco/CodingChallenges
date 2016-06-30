//
//  EvenTreeNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 29/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class EvenTreeNode: NSObject {

    // MARK: - Properties
    
    var value: Int
    var parent: EvenTreeNode?
    var immediateChildren: [EvenTreeNode] = {
        return [EvenTreeNode]()
    }()
    var totalChildren = 0
    
    // MARK: - Lifecycle
    
    init(value: Int) {
        self.value = value
        
        super.init()
    }
    
    // MARK: Child
    
    func addChild(child: EvenTreeNode) {
        immediateChildren.append(child)
        child.parent = self
        
        totalChildren += 1
        
        if let parent = parent {
            parent.childAddedChild()
        }
    }
    
    func childAddedChild() {
        totalChildren += 1
        
        if let parent = parent {
            parent.childAddedChild()
        }
    }
    
    // MARK: Parent
    
    func breakConnectionWithParent() {
        if let parent = parent {
            parent.removeChild(self)
        }
        
        parent = nil
    }
    
    func removeChild(child: EvenTreeNode) {
        totalChildren -= 1
        
        let index = immediateChildren.indexOf(child)!
        immediateChildren.removeAtIndex(index)
        
        if let parent = parent {
            parent.childRemovedChild()
        }
    }
    
    func childRemovedChild() {
        totalChildren -= 1
        
        if let parent = parent {
            parent.childRemovedChild()
        }
    }
}

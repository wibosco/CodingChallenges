//
//  NaryTreeNode.swift
//  CodingChallenges
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class NaryTreeNode {
    let val: Int
    
    var children = [NaryTreeNode]()
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension NaryTreeNode {
    //Nary-Tree input serialization is represented in their level order traversal,
    //each group of children is separated by the null value e.g.
    //[1, nil, 3, 2, 4, nil, 5, 6]
    static func deserialize(_ array: [Int?]) -> NaryTreeNode? {
        guard !array.isEmpty else {
            return nil
        }
        
        let root = NaryTreeNode(array[0]!)
        var queue: [NaryTreeNode?] = [root]
        var i = 2
        
        
        while !queue.isEmpty {
            var levelCount = queue.count
            var node = queue.removeFirst()
            
            while levelCount > 0, i < array.count {
                guard let val = array[i] else {
                    levelCount -= 1

                    i += 1
                    
                    if levelCount == 0 {
                        break
                    } else {
                        if !queue.isEmpty {
                            node = queue.removeFirst()
                        }
                        continue
                    }
                }
                
                let child = NaryTreeNode(val)
                node?.children.append(child)
                queue.append(child)
                
                i += 1
            }
        }
        
         return root
    }
    
    static func extractValuesInLevelOrder(fromNaryTree root: NaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var queue = [root]
        var levels = [[root.val]]
        
        while !queue.isEmpty {
            let count = queue.count
            var level = [Int]()
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                for child in node.children {
                    level.append(child.val)
                    queue.append(child)
                }
            }
            
            if !level.isEmpty {
                levels.append(level)
            }
        }
        
        return levels
    }
}

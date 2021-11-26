//
//  TreeNodeNext.swift
//  CodingChallenges
//
//  Created by William Boles on 25/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class TreeNodeNext {
    let val: Int
    
    var left: TreeNodeNext?
    var right: TreeNodeNext?
    var next: TreeNodeNext?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension TreeNodeNext {
    static func createBinaryTree(fromLevelOrderArray array: [Int?]) -> TreeNodeNext? {
        guard !array.isEmpty else {
            return nil
        }
        
        var mArray = array
        let root = TreeNodeNext(mArray.removeFirst()!)
        var queue = [root]
        
        while !queue.isEmpty {
            let levelCount = queue.count

            for _ in 0..<levelCount {
                let root = queue.removeFirst()
                
                //left
                if !mArray.isEmpty { //check needed incase these are leaf nodes
                    if let val = mArray.removeFirst() {
                        let node = TreeNodeNext(val)
                        root.left = node

                        queue.append(node)
                    }
                }
                
                //right
                if !mArray.isEmpty {
                    if let val = mArray.removeFirst() {
                        let node = TreeNodeNext(val)
                        root.right = node
                        
                        queue.append(node)
                    }
                }
            }
        }

        return root
    }
    
    static func extractValuesInLevelOrder(fromBinaryTree root: TreeNodeNext?) -> [String] {
        guard let root = root else {
            return []
        }
        
        var queue = [root]
        var values = [String]()
        
        while !queue.isEmpty {
            let levelCount = queue.count //how many node pairs are in this level
            
            for _ in 0..<levelCount {//need to know how many times we remove from the queue for this level
                let node = queue.removeFirst()
                values.append(String("\(node.val)"))
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            values.append("#")
        }
        
        return values
    }
}

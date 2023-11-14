//
//  TreeNodeRandom.swift
//  LeetCode
//
//  Created by William Boles on 10/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

final class TreeNodeRandom {
    let val: Int
    
    var left: TreeNodeRandom?
    var right: TreeNodeRandom?
    var random: TreeNodeRandom?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension TreeNodeRandom {
    //level order
    static func deserialize(_ array: [[Int?]?]) -> TreeNodeRandom? {
        guard !array.isEmpty else {
            return nil
        }
        
        var nodeArray = [TreeNodeRandom?]()
        for nodeDetails in array {
            guard let nodeDetails = nodeDetails else {
                nodeArray.append(nil)
                continue
            }
            let node = TreeNodeRandom(nodeDetails[0]!)
            nodeArray.append(node)
        }
        
        let root = nodeArray[0]!
        if let details = array[0], let node = nodeArray[0] {
            if let indexOfRandom = details[1] {
                node.random = nodeArray[indexOfRandom]
            }
        }
        var queue = [root]
        var i = 1
        
        while i < array.count {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                let root = queue.removeFirst()
                
                //left
                if let details = array[i], let node = nodeArray[i] {
                    if let indexOfRandom = details[1] {
                        node.random = nodeArray[indexOfRandom]
                    }
                    root.left = node
                    
                    queue.append(node)
                }
                
                i += 1
                
                guard i < array.count else {
                    continue
                }
                
                //right
                if let details = array[i], let node = nodeArray[i] {
                    if let indexOfRandom = details[1] {
                        node.random = nodeArray[indexOfRandom]
                    }
                    root.right = node
                    
                    queue.append(node)
                }
                
                i += 1
            }
        }
        
        return root
    }
    
    static func serialize(_ root: TreeNodeRandom?) -> [[Int?]?] {
        guard let root = root else {
            return [[Int?]?]()
        }
        
        let levelOrder = levelOrderTraversal(fromBinaryTree: root)
    
        var queue = [TreeNodeRandom?]()
        queue.append(root)
        var values = [[Int?]?]()

        while !queue.isEmpty {
            let levelCount = queue.count

            for _ in 0..<levelCount {
                guard let node = queue.removeFirst() else {
                    values.append(nil)
                    continue
                }
                var indexOfRandom: Int?
                if let random = node.random {
                    indexOfRandom = levelOrder.firstIndex(of: random)
                }
            
                values.append([node.val, indexOfRandom])

                queue.append(node.left)
                queue.append(node.right)
            }
        }

        //trim `nil` from end
        var i = (values.count - 1)
        while i > 0 {
            if values[i] != nil {
                break
            }
            i -= 1
        }

        return Array(values[0...i])
    }
    
    private static func levelOrderTraversal(fromBinaryTree root: TreeNodeRandom?) -> [TreeNodeRandom?] {
        var queue = [TreeNodeRandom?]()
        queue.append(root)
        var levelOrder = [TreeNodeRandom?]()
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                guard let node = queue.removeFirst() else {
                    levelOrder.append(nil)
                    continue
                }
                
                levelOrder.append(node)
                
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        
        return levelOrder
    }
}

extension TreeNodeRandom: Equatable {
    static func == (lhs: TreeNodeRandom, rhs: TreeNodeRandom) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension TreeNodeRandom: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

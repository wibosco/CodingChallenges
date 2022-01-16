//
//  BinaryTreeNodeRandom.swift
//  CodingChallenges
//
//  Created by William Boles on 10/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class BinaryTreeNodeRandom {
    let val: Int
    
    var left: BinaryTreeNodeRandom?
    var right: BinaryTreeNodeRandom?
    var random: BinaryTreeNodeRandom?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension BinaryTreeNodeRandom {
    //level order
    static func deserialize(_ array: [[Int?]?]) -> BinaryTreeNodeRandom? {
        guard !array.isEmpty else {
            return nil
        }
        
        var nodeArray = [BinaryTreeNodeRandom?]()
        for nodeDetails in array {
            guard let nodeDetails = nodeDetails else {
                nodeArray.append(nil)
                continue
            }
            let node = BinaryTreeNodeRandom(nodeDetails[0]!)
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
    
    static func serialize(_ root: BinaryTreeNodeRandom?) -> [[Int?]?] {
        guard let root = root else {
            return [[Int?]?]()
        }
        
        let levelOrder = levelOrderTraversal(fromBinaryTree: root)
    
        var queue = [BinaryTreeNodeRandom?]()
        queue.append(root)
        var values = [[Int?]?]()

        while !queue.isEmpty {
            let levelCount = queue.count

            for _ in 0..<levelCount {
                guard let node = queue.removeFirst() else {
                    values.append(nil)
                    continue
                }
                var indexOfRandom: Int? = nil
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
    
    private static func levelOrderTraversal(fromBinaryTree root: BinaryTreeNodeRandom?) -> [BinaryTreeNodeRandom?] {
        var queue = [BinaryTreeNodeRandom?]()
        queue.append(root)
        var levelOrder = [BinaryTreeNodeRandom?]()
        
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

extension BinaryTreeNodeRandom: Equatable {
    static func == (lhs: BinaryTreeNodeRandom, rhs: BinaryTreeNodeRandom) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension BinaryTreeNodeRandom: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

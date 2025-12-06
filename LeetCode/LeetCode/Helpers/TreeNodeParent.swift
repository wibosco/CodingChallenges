// Created 16/01/2022.

import Foundation

final class TreeNodeParent {
    let val: Int
    
    var left: TreeNodeParent?
    var right: TreeNodeParent?
    var parent: TreeNodeParent?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension TreeNodeParent {
    //level order
    static func deserialize(_ array: [Int?], _ pVal: Int, _ qVal: Int) -> (TreeNodeParent?, TreeNodeParent?) {
        guard !array.isEmpty, array[0] != nil else {
            return (nil, nil)
        }
        
        var queue = [TreeNodeParent(array[0]!)]
        var i = 1
        var nodes = queue
        
        while i < array.count {
            let node = queue.removeFirst()
            
            if let leftValue = array[i] {
                let left = TreeNodeParent(leftValue)
                node.left = left
                left.parent = node
                
                queue.append(left)
                nodes.append(left)
            }
            
            i += 1
            
            guard i < array.count else {
                continue
            }
            
            if let rightValue = array[i] {
                let right = TreeNodeParent(rightValue)
                node.right = right
                right.parent = node
                
                queue.append(right)
                nodes.append(right)
            }
            
            i += 1
        }
        
        var p: TreeNodeParent?
        var q: TreeNodeParent?
        
        for node in nodes {
            if node.val == pVal {
                p = node
            } else if node.val == qVal {
                q = node
            }
        }
        
        return (p, q)
    }
}

extension TreeNodeParent: Equatable {
    static func == (lhs: TreeNodeParent, rhs: TreeNodeParent) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension TreeNodeParent: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

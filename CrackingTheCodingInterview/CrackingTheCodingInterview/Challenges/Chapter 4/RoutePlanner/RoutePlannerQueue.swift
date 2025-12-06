// Created 01/06/2016.

import Foundation

final class RoutePlannerQueue {
    lazy var nodes = [RoutePlannerNode]()
    
    // MARK: - Meta
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    // MARK: - Actions
    
    func enqueue(node: RoutePlannerNode) {
        nodes.append(node)
    }
    
    func dequeue() -> RoutePlannerNode {
        return nodes.removeFirst()
    }
}

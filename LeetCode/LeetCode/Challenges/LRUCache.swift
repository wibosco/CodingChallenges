// Created 30/07/2025.

import Foundation

//https://leetcode.com/problems/lru-cache/
//linked list
//doubly linked list
//sentinel head
//sentinel tail
//queue
//dictionary
class LRUCache {
    class Node {
        let key: Int
        let value: Int
        
        var prev: Node?
        var next: Node?
        
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    private let head = Node(key: -1, value: -1)
    private let tail = Node(key: -1, value: -1)
    
    private var nodes = [Int: Node]()
    private let capacity: Int
    
    // MARK: - Init
    
    init(_ capacity: Int) {
        self.capacity = capacity
        
        head.next = tail
        tail.prev = head
    }
    
    // MARK: - Get
    
    func get(_ key: Int) -> Int {
        guard let node = nodes[key] else {
            return -1
        }
        
        //just delete and re-add as the tail to move it the end of the deletion queue
        delete(node)
        add(node)
        
        return node.value
    }
    
    // MARK: - Put
    
    func put(_ key: Int, _ value: Int) {
        if let node = nodes[key] {
            delete(node)
        }
        
        let node = Node(key: key, value: value)
        nodes[key] = node
        add(node)
        
        if nodes.count > capacity {
            if let nodeToBeDeleted = head.next {
                delete(nodeToBeDeleted)
                nodes[nodeToBeDeleted.key] = nil
            }
        }
    }
    
    // MARK: - Delete
    
    private func delete(_ node: Node) {
        //skip over node
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    // MARK: - Add
    
    private func add(_ node: Node) {
        tail.prev?.next = node
        node.prev = tail.prev
        node.next = tail
        tail.prev = node
    }
}

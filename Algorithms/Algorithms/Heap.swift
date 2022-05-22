//
//  Heap.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

//A heap is a complete binary tree (not s binary search tree) inside an array, so it does not use parent/child pointers. A heap
//is sorted based on the "heap property" that determines the order of the nodes in the tree. There are two kinds of heaps: a
//max-heap and a min-heap which are different by the order in which they store the tree nodes. In a max-heap, parent nodes have
//a greater value than each of their children. In a min-heap, every parent node has a smaller value than its child nodes - this
//is called the "heap property". As a result of this heap property, a max-heap always stores its largest item at the root of the
//tree. For a min-heap, the root is always the smallest item in the tree. The root of the heap has the maximum or minimum element,
//but the sort order of other elements are not predictable. For example, the maximum element is always at index 0 in a max-heap,
//but the minimum element isn’t necessarily the last one - the only guarantee you have is that it is one of the leaf nodes, but
//not which one.
//
//See: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap
struct Heap<Element> {
    private var elements : [Element]
    private let priorityFunction : (Element, Element) -> Bool
    
    // MARK: - Init
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    private mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    // MARK: - Helpers
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    // MARK: - Indexing
    
    private func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1 //left child of an element is always 2i + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2 //left child of an element is always 2i + 2 i.e. left child + 1
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2 //parent of an element is always (i - 1)/2) which is an integer division i.e. floor
    }
    
    // MARK: - Priority
    
    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    private func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        
        return childIndex
    }
    
    private func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    // MARK: - Swap
    
    private  mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }
        
        elements.swapAt(firstIndex, secondIndex)
    }
    
    // MARK: - Queuing
    
    mutating func enqueue(_ elements: [Element]) {
        for element in elements {
            enqueue(element)
        }
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1) //move newer added element to correct index in heap
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        //swap the top of the heap with the last element in the heap before removing the old top to maintain the correct
        //heap structure of a balanced binary tree
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            //new top is potentially out of order now so need to sift it down to its correct position/index
            siftDown(elementAtIndex: 0)
        }
        
        return element
    }
    
    // MARK: - Sifting
    
    private mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        
        swapElement(at: index, with: parent) //move child into parents index
        siftUp(elementAtIndex: parent) //check if child can move higher again
    }
    
    private mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard index != childIndex else { //element is at the right index
            return
        }
        
        swapElement(at: index, with: childIndex) //move parent into childs index
        siftDown(elementAtIndex: childIndex) //check if child can move lower again
    }
}

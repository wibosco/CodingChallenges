//
//  Heap.swift
//  LeetCode
//
//  Created by William Boles on 08/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//A heap (also known as a binary heap) is a complete binary tree (not s binary search tree) inside an array, so it does not use
//parent/child pointers. A heap is sorted based on the "heap property" that determines the order of the nodes in the tree. There
//are two kinds of heaps: a max-heap and a min-heap which are different by the order in which they store the tree nodes. In a
//max-heap, parent nodes have a greater value than each of their children. In a min-heap, every parent node has a smaller value
//than its child nodes. Just like in any binary tree, a heap can be split into multiple subtrees where the relationship between
//parent and child nodes needs to the same e.g. parent is larger or equal to any child nodes - this relationship in a heap is
//called the "heap property". A max-heap always stores the largest element at the root of the tree; a min-heap, always store the
//smallest item at the root of the tree. The root of the heap has the maximum or minimum element, but the sort order of other
//elements are not predictable. This partially sorted nature allows for insertions and removals to operate in O(log n) time
//rather than O(n) that would be required for a fully sorted array.
//
//N.B. Don’t confuse these heaps with memory heaps - memory heaps are a different concept.
//
//See: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap
struct Heap<Element> {
    private var elements: [Element]
    private let priorityFunction: (Element, Element) -> Bool
    
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
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
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
        return (2 * index) + 2 //right child of an element is always 2i + 2 i.e. left child + 1
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
        return highestPriorityIndex(of: highestPriorityIndex(of: parent,
                                                             and: leftChildIndex(of: parent)),
                                    and: rightChildIndex(of: parent))
    }
    
    // MARK: - Queuing
    
    mutating func insert(_ element: Element) {
        //When inserting an element and element we first add it to the end of `elements` and then "sift" it up into it's correct
        //index. This sifting is controlled by comparing element and ensuring that the higher value element is the parent.
        elements.append(element)
        siftUp(elementAtIndex: count - 1) //move newer added element to correct index in heap
    }
    
    @discardableResult
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        //swap the top of the heap with the last element in the heap before removing the old top to maintain the correct
        //heap structure of a balanced binary tree
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            //new top is potentially out of order now so need to sift it down to its correct position/index
            siftDown(elementAtIndex: 0)
        }
        
        return element
    }
    
    // MARK: - Sifting
    
    private mutating func siftUp(elementAtIndex index: Int) {
        let parentIndex = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parentIndex) else {
            return
        }
        
        elements.swapAt(index, parentIndex) //move child into parents index
        siftUp(elementAtIndex: parentIndex) //child is now at parentIndex location, check if child can move higher again
    }
    
    private mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard index != childIndex else { //element is at the right index
            return
        }
        
        elements.swapAt(index, childIndex)  //move parent into child's index
        siftDown(elementAtIndex: childIndex) //child is now at parentIndex location, check if child can move lower again
    }
}

// Created 23/05/2022.

import Foundation

//A "normal" queue that operates on a FIFO basis where each element is considered equal and the ordering is determine solely
//on when an element was added to the queue. This is not the case with priority queues. In priority queues each element is
//prioritised against the other elements so that those elements with higher priority are removed first from the queue (note
//here that a higher priority doesn't mean a higher value - in a min priority queue those elements with a lower value are
//prioritised higher). Each time an element is added or removed the queue needs to be adjusted so ensure that the next element
//to be removed is the highest priority (note that we don't fully sort all the elements in the queue on adding or removing an
//element, instead we only sort enough so that highest priority element is next). There are two types of priority queue - min
//and max.
struct PriorityQueue<Element: Equatable> {
    private var heap: Heap<Element>
    
    // MARK: - Init
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        heap = Heap(elements: elements, priorityFunction: priorityFunction)
    }
    
    // MARK: - Empty
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    // MARK: - Retrieval
    
    var peek: Element? {
        return heap.peek()
    }
    
    mutating func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
}

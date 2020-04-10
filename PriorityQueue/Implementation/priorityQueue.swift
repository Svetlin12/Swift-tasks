import Foundation

class PriorityQueue {
    private var heap = Array<(Int, Int)>()

    init () {
    }
    
    init (capacity: Int) {
        heap.reserveCapacity(capacity)
    }
    
    private func parent (index: Int) -> Int {
        return (index - 1 ) / 2
    }
    
    private func left (index : Int) -> Int {
        return 2 * index + 1
    }
    
    private func right (index: Int) -> Int {
        return 2 * index + 2
    }
    
    private func hasRight (index: Int) -> Bool {
        return right(index: index) < heap.count
    }
    
    private func hasLeft (index: Int) -> Bool {
        return left(index: index) < heap.count
    }
    
    private func siftUp (index: Int) {
        if index == 0 {
            return
        }
        
        if heap[parent(index: index)] < heap[index]
        {
            heap.swapAt(index, parent(index: index))
            siftUp(index: parent(index: index))
        }
    }
    
    private func siftDown(index: Int) {
        if hasLeft(index: index) == false{
            return
        }
        
        var maxValueChild = left(index: index)
        if hasRight(index: index) && heap[right(index: index)] > heap[maxValueChild] {
            maxValueChild = right(index: index)
        }
        
        if heap[index] < heap[maxValueChild]
        {
            heap.swapAt(index, maxValueChild)
            siftDown(index: maxValueChild)
        }
    }
}

extension PriorityQueue {
    func push (value: (Int, Int)) {
        heap.append(value)
        siftUp(index: heap.count - 1)
    }
    
    func pop() {
        if heap.count == 0 {
            return
        }
        
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        siftDown(index: 0)
    }
    
    func top() -> (Int,Int) {
        if heap.count == 0 {
            return (-1, -1)
        }
        
        return heap[0]
    }
    
    func makeHeap(input: inout Array<(Int, Int)>) {
        heap.reserveCapacity(2 * input.count)
        for i in input {
            heap.append(i)
        }
        
        var i = (input.count / 2) - 1
        while i >= 0 {
            siftDown(index: i)
            i-=1
        }
    }
}

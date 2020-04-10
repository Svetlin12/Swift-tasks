import Foundation

class Queue {
    private var queue: [Int]?
    private var first: Int?
    private var last: Int?
}

extension Queue {
    func push(value: Int) {
        if queue == nil {
            queue = [Int]()
            queue!.append(value)
            first = queue!.first
        }
        else {
            queue!.append(value)
        }
        last = queue!.last
    }
    
    func front() -> Int? {
        return first
    }
    
    func empty() -> Bool {
        if queue != nil {
            return false
        }
        else {
            return true
        }
    }
    
    func pop() {
        if empty() {
            return
        }
        else {
            queue!.removeFirst()
            if queue!.count == 0 {
                queue = nil
                first = nil
                last = nil
            }
            else {
                first = queue!.first
            }
        }
    }
    
    func size() -> Int {
        return queue!.count
    }
    
    func back() -> Int? {
        return last
    }
    
    func print() {
        if queue != nil {
            for i in queue! {
                Swift.print(i, terminator:" ")
            }
            Swift.print()
        }
    }
    
    func reverse() {
        if queue != nil {
            queue!.reverse()
            last = queue!.last
            first = queue!.first
        }
    }
}

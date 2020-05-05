class Node<T> {
    var value: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class List<T> {
    private var head: Node<T>?
}

extension List {
    var last: Node<T>? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    var first: Node<T>? {
        return head
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        }
        else {
            head = newNode
        }
    }
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    func insert(value: T, at: Int) {
        let newNode = Node(value: value)
        
        if at < 0 {
            return
        }
        
        if at == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        }
        else {
            var node = head
            
            var count = 0
            while let next = node?.next {
                if count == (at - 1) {
                    break
                }
                node = next
                count += 1
            }
            
            if count < at - 1{
                return
            }
            
            newNode.next = node?.next
            newNode.previous = node?.previous
            node?.next = newNode
            newNode.next?.previous = newNode
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    func remove(at: Int) {
        if at < 0 {
            return
        }
        
        var node = head
        var count = 0
        while let next = node?.next {
            node = next
            count+=1
            if count == at {
                break
            }
        }
        
        if count < at {
            return
        }
        
        node?.previous?.next = node?.next
        node?.next?.previous = node?.previous
    }
    
    func removeLast() {
        let node = last
        node?.previous?.next = nil
    }
    
    func reverse() {
        var node = head
        var prev: Node<T>? = nil
        var next: Node<T>? = nil
        while let currNode = node {
            next = currNode.next
            currNode.previous = currNode.next
            currNode.next = prev
            prev = currNode
            node = next
        }
        head = prev
    }
    
    func printList() {
        var traverse = head
        while let currNode = traverse {
            print("\(traverse!.value)", terminator: "->")
            traverse = currNode.next;
        }
        print();
    }
}

extension List {
   subscript(index: Int) -> T? {
        if (index < 0 || index > count) {
            return nil;
        }
        else
        {
            var cnt = 0
            var node = head;
            while let currNode = node {
                if (cnt == index) {
                    break
                }
                node = currNode.next
                cnt+=1
            }
            return node?.value
        }
   }
}

// test case
let list = List<Int>()
print(list.isEmpty())
list.append(value: 5)
list.append(value: 6)
list.append(value: 7)
list.append(value: 8)
list.insert(value: 20, at: 2)
list.insert(value: 10, at: -1)
list.insert(value: 10, at: 10)
list.insert(value: 30, at: 5)
list.printList()
print(list.count)
print(list.isEmpty())
list.reverse()
list.printList()
list.remove(at: 10)
list.remove(at: 2)
list.printList()
print(list.count)
list.removeAll()
print(list.count)

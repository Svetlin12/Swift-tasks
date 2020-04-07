import Foundation

class Node : Equatable {
    var value: Int?
    var neighbours: Array<Int>
    
    init () {
        self.neighbours = Array<Int>()
    }
    
    init (value: Int, neighbour: Int) {
        self.value = value
        self.neighbours = Array<Int>()
        self.neighbours.append(neighbour)
    }
}

extension Node {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    func printNeighbours() {
        for i in neighbours {
            print(i, terminator:" ")
        }
    }
}

class Graph {
    var graph:[Node]
    var n:Int
    var m:Int
    
    init () {
        n = 0
        m = 0
        graph = [Node]()
    }
    
    init (n: Int, m: Int) {
        self.n = n
        self.m = m
        graph = [Node]()
        graph = .init(repeating: Node(), count: n + 1)
    }
}

extension Graph {
    func insert(from: Int, to: Int) {
        let newNode = Node(value: from, neighbour: to)
        if graph.contains(newNode) == true {
            graph[from].neighbours.append(to)
        }
        else {
            graph.remove(at: from)
            graph.insert(newNode, at: from)
        }
    }
    
    func printGraph() {
        for i in 1..<graph.count {
            print("\(i)->", terminator:"")
            graph[i].printNeighbours()
            print()
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var graph = Graph(n: n, m: m)

for _ in 1...m {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let node1 = input[0]
    let node2 = input[1]
    graph.insert(from: node1, to: node2)
}

graph.printGraph()

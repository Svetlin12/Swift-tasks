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

extension Node : Sequence {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    func printNeighbours() {
        for i in neighbours {
            print(i, terminator:" ")
        }
    }
    
    func makeIterator() -> Array<Int>.Iterator {
        return neighbours.makeIterator()
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
        let anotherNode = Node(value: to, neighbour: from)
        if graph.contains(newNode) == true {
            graph[from].neighbours.append(to)
        }
        else {
            graph.remove(at: from)
            graph.insert(newNode, at: from)
        }
        
        if graph.contains(anotherNode) == true {
            graph[to].neighbours.append(from)
        }
        else {
            graph.remove(at: to)
            graph.insert(anotherNode, at: to)
        }
    }

    func dfs(current: Int, visited: inout Array<Bool>, vertexCombinations: inout Int) {
        visited[current] = true
        vertexCombinations += 1
        
        for i in graph[current].neighbours {
            if !visited[i] {
                dfs(current: i, visited: &visited, vertexCombinations: &vertexCombinations)
            }
        }
    }
    
    func countPossibilities() -> Int {
        var count = 0
        var visited = Array<Bool>.init(repeating: false, count: n + 1)
        
        for i in 0...n {
            if !visited[i] {
                var vertexCombinations = 0
                dfs(current: i, visited: &visited, vertexCombinations: &vertexCombinations)
                count += vertexCombinations * (vertexCombinations - 1)
            }
        }
        return count;
    }
}

let nm = readLine()!.components(separatedBy: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var graph = Graph(n: n, m: m)

for _ in 1...m {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    graph.insert(from: input[0], to: input[1])
}

print((n * (n - 1) - graph.countPossibilities())/2)

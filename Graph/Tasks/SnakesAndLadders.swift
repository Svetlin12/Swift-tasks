import Foundation

class Tile {
    var value: Int = 0
    var isSnakeOrLadder: Bool = false
    var choices = Array<Int>()
    
    init (value: Int) {
        self.value = value
        switch value {
        case 95:
            for i in 1...5 {
                choices.append(value + i)
            }
        case 96:
            for i in 1...4 {
                choices.append(value + i)
            }
        case 97:
            for i in 1...3 {
                choices.append(value + i)
            }
        case 98:
            for i in 1...2 {
                choices.append(value + i)
            }
        case 99:
            choices.append(100)
        case 100:
            break
        default:
            for i in 1...6 {
                choices.append(value + i)
            }
        }
    }
}

extension Tile {
    func changeDestination(to: Int) {
        self.isSnakeOrLadder = true
        self.value = to
    }
}

class Board {
    var board = Array<Tile>()
    
    init () {
        for i in 0...100 {
            let newTile = Tile(value: i)
            board.append(newTile)
        }
    }
}

extension Board {
    func addLadder(from: Int, to: Int) {
        board[from].changeDestination(to: to)
    }
    
    func addSnake(from: Int, to: Int) {
        board[from].changeDestination(to: to)
    }
    
    func minMoves() -> Int {
        var queue = [Int]()
        queue.append(1)
        var visited: [Bool] = .init(repeating: false, count: 101)
        var counter = 0
        var rollCount = 1
        
        while queue.count != 0 {
            let current = queue.first!
            queue.removeFirst()
            rollCount -= 1
            
            visited[current] = true
            
            for i in board[current].choices {
                if visited[i] == false {
                    if board[i].isSnakeOrLadder == true {
                        if board[i].value == 100 {
                            return counter + 1
                        }
                        queue.append(board[i].value)
                        visited[board[i].value] = true;
                    }
                    else {
                        if i == 100 {
                            return counter + 1
                        }
                        queue.append(i)
                        visited[i] = true
                    }
                }
            }
            
            if rollCount == 0 {
                counter += 1
                rollCount = queue.count
            }
        }
        
        return -1
    }
}

let testCases = Int(readLine()!)!

for _ in 1...testCases {
    let currGame = Board()
    
    let numLadders = Int(readLine()!)!
    
    for _ in 1...numLadders {
        let startEnd = readLine()!.components(separatedBy: " ").map{Int($0)!}
        currGame.addLadder(from: startEnd[0], to: startEnd[1])
    }
    
    let numSnakes = Int(readLine()!)!
    
    for _ in 1...numSnakes {
        let startEnd = readLine()!.components(separatedBy: " ").map{Int($0)!}
        currGame.addSnake(from: startEnd[0], to: startEnd[1])
    }
    
    print(currGame.minMoves())
}

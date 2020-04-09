import Foundation

func binarySearch(leaderboard: inout [Int], target: Int) -> (Int, Int) {
    var left = 0
    var right = leaderboard.count - 1
    
    while left <= right {
        let middle = (left + right)/2
        if leaderboard[middle] == target {
            return (1, middle)
        }
        else if leaderboard[middle] > target {
            left = middle + 1
        }
        else {
            right = middle - 1
        }
    }
    
    return (0, left)
}

let numPeople = Int(readLine()!)!
var leaderboard = readLine()!.components(separatedBy: " ").map{Int($0)!}
let numGames = Int(readLine()!)!
var scores = readLine()!.components(separatedBy: " ").map{Int($0)!}

var positions: [Int] = [Int]()
var currPosition = 0
var previous = -1
for i in leaderboard {
    if i != previous {
        currPosition += 1
        positions.append(currPosition)
    }
    else {
        positions.append(currPosition)
    }
    previous = i
}

for i in scores {
    let pos = binarySearch(leaderboard: &leaderboard, target: i)
    if pos.0 == 1 {
        print(positions[pos.1])
    }
    else {
        if pos.1 == 0 {
            print(1)
        }
        else if pos.1 == positions.count {
            print(positions[positions.count - 1] + 1)
        }
        else {
            print(positions[pos.1])
        }
    }
}

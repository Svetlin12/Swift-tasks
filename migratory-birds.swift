import Foundation

func migratoryBirds(birds: inout [Int])->Int {
    var birdCount : [Int : Int] = [:]
    for i in birds {
        birdCount[i, default: 0] += 1
    }

    var max = 0
    var idMax = 0
    for (bird, count) in birdCount {
        if max < count {
            max = count
            idMax = bird
        }
        else if max == count {
            if idMax > bird {
                idMax = bird
            }
        }
    }

    return idMax
}

let n = Int(readLine()!)!
var birds = readLine()!.components(separatedBy: " ").map{Int($0)!}

print(migratoryBirds(birds: &birds))

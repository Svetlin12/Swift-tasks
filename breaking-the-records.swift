import Foundation

func breakingRecords(scores: inout [Int])->(high: Int, low: Int) {
    var max = scores[0], min = scores[0]
    var changeLow = 0, changeHigh = 0
    for score in scores {
        if max < score {
            max = score
            changeHigh += 1
        }
        else if min > score {
            min = score
            changeLow += 1
        }
    }
    return (changeHigh, changeLow)
}

let n = Int(readLine()!)!
var input = readLine()!.components(separatedBy: " ").map{Int($0)!}
let result = breakingRecords(scores: &input)
print(result.0, result.1)

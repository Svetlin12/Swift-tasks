import Foundation

var size = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").map{Int($0)!}

var count = 0
var max = -1

for i in 0..<size {
    if (arr[i] > max) {
        count = 1
        max = arr[i]
    }
    else if (arr[i] == max) {
        count += 1
    }
}

print(count)

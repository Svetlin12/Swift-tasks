import Foundation

var a = readLine()!.components(separatedBy: " ").map{Int($0)!}
var b = readLine()!.components(separatedBy: " ").map{Int($0)!}

var ptsA = 0
var ptsB = 0

for i in 0...2 {
    if a[i] > b[i] {
        ptsA += 1
    }
    else if a[i] < b[i] {
        ptsB += 1
    }
}

print("\(ptsA) \(ptsB)")

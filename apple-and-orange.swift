import Foundation

let interval = (readLine()!).components(separatedBy: " ").map{Int($0)!}
let trees = (readLine()!).components(separatedBy: " ").map{Int($0)!}
let cnts = (readLine()!).components(separatedBy: " ").map{Int($0)!}
let apples = (readLine()!).components(separatedBy: " ").map{Int($0)!}
let oranges = (readLine()!).components(separatedBy: " ").map{Int($0)!}
var appleCnt = 0
var orangeCnt = 0

for elem in apples {
    if trees[0] + elem >= interval[0] && trees[0] + elem <= interval[1] {
        appleCnt+=1
    }
}

for elem in oranges {
    if trees[1] + elem >= interval[0] && trees[1] + elem <= interval[1] {
        orangeCnt+=1
    }
}

print("\(appleCnt)\n\(orangeCnt)")

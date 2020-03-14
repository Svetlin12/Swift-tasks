import Foundation

func birthday(bar : inout [Int], date : Int, m : Int, n : Int)->Int {
    if n < m {
        return 0
    }

    var cnt = 0
    var sum = 0
    for i in 0..<m {
        sum += bar[i]
    }

    if sum == date {
        cnt += 1
    }

    var startPt = 0
    for i in m..<n {
        sum -= bar[startPt]
        startPt += 1
        sum += bar[i]
        if sum == date {
            cnt += 1
        }
    }

    return cnt
}

let n = Int(readLine()!)!
var chocolateBar = readLine()!.components(separatedBy: " ").map{Int($0)!}
let dm = readLine()!.components(separatedBy: " ").map{Int($0)!}
let d = dm[0]
let m = dm[1]

print(birthday(bar: &chocolateBar,date: d,m: m,n: n))

import Foundation

let n = Int(readLine()!)!
var staircase = ""

for i in 0..<n {
    for _ in 0..<n - 1 - i {
        staircase += " "
    }
    for _ in 0...i {
        staircase += "#"
    }
    staircase += "\n"
}

print(staircase)

import Foundation

let n = Int(readLine()!)!
var arr = [Int]()

for _ in 1...n {
    let grade = Int(readLine()!)!
    let x = grade % 5
    switch x {
    case 3, 8:
        if grade + 2 >= 38 {
            arr.append(grade + 2)
        }
        else {
            arr.append(grade)
        }
    case 4, 9:
        if grade + 1 >= 38 {
            arr.append(grade + 1)
        }
        else {
            arr.append(grade)
        }
    default:
        arr.append(grade)
    }
}

for i in 1...n {
    print(arr[i-1])
}

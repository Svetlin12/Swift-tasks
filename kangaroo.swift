import Foundation 

func kangaroo(x1 : Int, v1 : Int, x2 : Int, v2 : Int)->String {
    if (v1 <= v2) {
        return "NO"
    }
    else {
        if (x2 - x1) % (v1 - v2) == 0 {
            return "YES"
        } 
        else {
            return "NO"
        }
    }
}

let input = (readLine()!).components(separatedBy: " ").map{Int($0)!}
let result = kangaroo(x1: input[0], v1: input[1], x2: input[2], v2: input[3])
print(result)

import Foundation

func keratsubaPower(number: Double, power: Int)->Double {
    if power == 0 {
        return 1
    }
    else if power == 1 {
        return number
    }
    
    if power > 0 {
        if power % 2 == 0 {
            return keratsubaPower(number: number, power: power/2)*keratsubaPower(number: number, power: power/2)
        }
        else {
            return number*keratsubaPower(number: number, power: power - 1)
        }
    }
    else {
        return 1 / keratsubaPower(number: number, power: abs(power))
    }
}

print("Enter number and power:")
let input = readLine()!.components(separatedBy: " ").map{Double($0)!}
var number : Double = input[0]
var power : Int = Int(input[1])

print("\(number) to the power of \(power) is: \(keratsubaPower(number:number, power: power))")

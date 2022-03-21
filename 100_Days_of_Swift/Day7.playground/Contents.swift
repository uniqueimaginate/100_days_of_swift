import UIKit


func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}


func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}


printTimesTables(number: 5, end: 10)


//func rollDice() -> Int {
//    return Int.random(in: 1...6)
//}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}
/*
    여기서 return 을 생략 할 수 있다!!
    이렇게 한줄 밖에 없는 경우에는 return 을 생략할 수 있다.
 */


func rollDice() -> Int {
    Int.random(in: 1...6)
}


func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}


func doMath() -> Int{
    11
}


func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

print(greet(name: "Ta"))


//func getUser() -> [String] {
//    ["Taylor", "Swift"]
//}
//
//let user = getUser()
//print("Name: \(user[0]) \(user[1])")


//func getUser() -> [String: String] {
//    [
//        "firstName": "Taylor",
//        "lastName": "Swift"
//    ]
//}
//
//let user = getUser()
//print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")


func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// 이렇게 받은 값을 전부 무시할 수도 있다.
let (_, _) = getUser()


// parameter label
// 저자는
// for 는 external parameter name
// number 는 internal parameter name
// 이렇게 구별한다.

// 그러나 argument, parameter 이렇게도 본다.
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

import UIKit
import Foundation

// assign function to variable
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

// closure expression
let sayHello0 = {
    print("Hi there!")
}


let sayHello1 = { (name: String) -> String in
    "Hi \(name)!"
}



func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
// 클로져를 이용하면 외부 파라미터가 사라진다.
// 이런식으로 클로져 또는 함수를 다른 변수에 할당하게 되면
// 외부 파라미터는 사용하지 않는다.
let user = data(1989)
print(user)


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)

let captainFirstTeam1 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

print(captainFirstTeam)
print(captainFirstTeam1)

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}


let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}


let reverseTeam = team.sorted {
    return $0 > $1
}


let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)


let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}


let arr = makeArray(size: 10) {
    Int.random(in: 1...100)
}

func makeRandom() -> Int {
    Int.random(in: 1...100)
}

let arr1 = makeArray(size: 10, using: makeRandom)
print(arr1)


// Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let solve = { (numbers: [Int]) in numbers.filter { !($0.isMultiple(of: 2))}
    .sorted()
    .map {
        print("\($0) is a lucky number")
    }

}

solve(luckyNumbers)

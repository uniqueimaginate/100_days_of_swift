import UIKit

// access control
struct BankAccount {
    fileprivate var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 300)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}


// private: don't let anything outside the struct use this
// fileprivate: don't let anything outside the current file use this
// public: let anyone, anywhere use this


// static properties and methods

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)


// static 을 사용하는 경우
// 1. 공통 데이터를 사용할 때
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}


// 2. 예시를 만들 때
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}


// Checkpoint 6

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    mutating func gearUp(){
        if (0...9).contains(currentGear) {
            return
        }
        currentGear += 1
    }
    
    mutating func gearDown(){
        if currentGear <= 1 {
            return
        }
        currentGear -= 1
    }
}

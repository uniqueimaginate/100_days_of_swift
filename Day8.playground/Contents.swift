import UIKit

// default values for parameters
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
// removeAll 은
// .removeAll(keepingCapacity: false) 를 기본으로 갖고 있다.
print(characters.count)


// handle errors in function

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch let error{
    print("There was an error \(error.localizedDescription).")
}


let string_ = "12345"

do {
    let result = try checkPassword(string_)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


// Custom Error 에 localizedDescription 만들기!
enum CustomError: Error {
    case err
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .err:
            return NSLocalizedString("key", comment: "comment")
        }
    }
}

let error: Error = CustomError.err
print(error.localizedDescription)



// Checkpoint 4

enum OutBoundError: Error {
    case outOfBound
    case noRoot
}

func mySqrt(for number: Int) throws -> Int {
    let range = 1...10000
    if !range.contains(number) {
        throw OutBoundError.outOfBound
    }
    
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw OutBoundError.noRoot
}

do {
    let n = try mySqrt(for: 5)
    print(n)
} catch let error {
    print(error)
}

import UIKit

// handle missing data with optionals

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

let numbers:[Int] = []

if let numbers = numbers.first {
    print(numbers)
} else {
    print("nil")
}

// guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        
        // 여기에 return 이 반드시 있어야 한다.
        return
    }

    // number 가 guard 밖에서도 접근 가능하다.
    print("\(number) x \(number) is \(number * number)")
}

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}



// nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
let new1 = captains["Serenity", default: "N/A"]
print(new)

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)

// nil coalescing 은 아래와 같이 체이닝도 가능하다. 물론 자주 쓰이지는 않는다.
//let savedData = first() ?? second() ?? ""



// handle multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")



var book1: Book? = nil
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author1)




// handle function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
} else {
    print("error")
}


// Checkpoint 9
func acceptIntegerArrays(integers: [Int]?) -> Int{
    integers?.randomElement() ?? Int.random(in: 1...100)
}

print(acceptIntegerArrays(integers: [1,2,3]))

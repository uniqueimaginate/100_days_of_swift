import UIKit

// Protocol and Extensions
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}


struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}


let car = Car()

commute(distance: 100, using: car)


// 위에 있는 commute 함수를 살짝 바꾸어보자
// Car 자리에 Vehicle이 있다.
// 이는 Vehicle 프로토콜을 만족하는 타입이 오면 된다는 뜻이다.
func commute_(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}


struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute_(distance: 50, using: bike)


protocol Vehicle1 {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// 프로토콜에 변수가 생겼다.
// get, set 에 따라서 let, var 또는 computed property가 된다.
struct Car1: Vehicle1 {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}


// opaque return types
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())


// extensions
var quote = "    The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

print(trimmed)


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}



quote.trim()

// extension 에 stored property 를 사용하지 않는 이유는
// 사용하게 되었을 때, 원래 데이터 타입의 크기에 영향을 주기 때문이다.


let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}


// 구조체의 memberwise 생성자를 사용하고 싶으면
// 커스텀 생성자를 extension 으로 옮기자!




// protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}


protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello(){
        print("Hi, I'm \(name)")
    }
}


struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }


// Checkpoint 8
protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var estateName: String { get }
    func description()
}

extension Building {
    func description(){
        print("building description")
        print("\(rooms) \(cost) \(estateName)")
    }
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let estateName: String
}


struct Office: Building {
    let rooms: Int
    let cost: Int
    let estateName: String
}


let house = House(rooms: 4, cost: 100000, estateName: "peter's")
let office = Office(rooms: 2, cost: 2200000, estateName: "peter's")

house.description()
office.description()

import UIKit

// Classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Inheritance
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()


// add initializers for classes
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)


// copy classes
class User{
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1

user2.username = "Taylor"

print(user1.username)
print(user2.username)


// 깊은 복사가 되게끔 만들때!
class User1 {
    var username = "Anonymous"

    func copy() -> User1 {
        let user = User1()
        user.username = username
        return user
    }
}


// variables inside classes
class User3 {
    var name = "Paul"
}

let user = User3()
user.name = "Taylor"
print(user.name)

var user3 = User3()
user3.name = "Taylor"
user3 = User3()
print(user3.name)

// deinitializer
class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
}


var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")



// Checkpoint 7

class Animal {
    let leg: Int
    
    init(leg: Int){
        self.leg = leg
    }
    
    func speak(){}
}

class Dog: Animal {
    init() {
        super.init(leg: 4)
    }
    
    override func speak() {
        print("barkbarkbark")
    }
}

class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(leg: 4)
    }
    
    override func speak() {
        print("myaong")
    }
}

let corgi = Dog()
let persian = Cat(isTame: true)

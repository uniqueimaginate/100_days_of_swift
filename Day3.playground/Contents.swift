import UIKit

// Arrays
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])


beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")


let firstBeatle = beatles[0]
let firstNumber = numbers[0]

// 에러가 발생한다. 배열에 담긴 타입이 서로 다르기 때문에. Type Safety
//let notAllowed = firstBeatle + firstNumber


var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// 배열을 선언하는 방법은 2가지가 있다.
var albums = Array<String>()
//albums.append("Folklore")
//albums.append("Fearless")
//albums.append("Red")


//var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")


print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)


let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))


let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)



// Dictionaries
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name"])
print(employee2["job"])
print(employee2["location"])

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206


var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"


print(archEnemies.count)
archEnemies.removeAll()
print(archEnemies.count)


// Set
// let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
// Set 은 입력하면서 중복을 제거하고, 순서대로 입력하지 않는다.
// print(people)


var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L Jackson")


print(people.contains("Tom Cruise"))
print(people.count)
print(people.sorted())


enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

/* 이렇게 한줄로도 할 수 있다.
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
 */

day = .thursday
day = .wednesday

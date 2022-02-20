import UIKit

// if, else if, else, multiple conditions
let score = 85

if score > 80 {
    print("Great job!")
}


let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}


let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)


let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}


// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")


// 스위프트의 카운트는 따로 계산해둔게 있는게 아니라 호출될 때 모든 스트링의 수를 세게 된다. 따라서 느림.
if username.count == 0 {
    username = "Anonymous"
}

// 따라서 위의 count 에 대한 해결책 중 하나로 isEmpty 를 만들어두었다.
// isEmpty 는 string, array, dictionary, set 모두에 있다.
if username.isEmpty == true {
    username = "Anonymous"
}


// Comparable 을 통해 enum 도 비교할 수 있다.
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)



let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}



// Switch
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}



let place = "Metropolis"
/*
    아래와 같은 코드는 불가능하다.
    default 가 먼저나와서 뒤에있는 case에 접근 할 수 없기 때문이다.
    따라서 빌드 자체가 안된다.
*/
//switch place {
//default:
//    print("Who are you?")
//case "Gotham":
//    print("You're Batman!")
//case "Mega-City One":
//    print("You're Judge Dredd!")
//case "Wakanda":
//    print("You're Black Panther!")
//}

/*
    Swift 는 다른언어와 다르게 case 를 만나면 그냥 끝난다.
    그러나 그 뒤에 case 도 만나게 하려면 fallthrough 를 써야 한다.
*/
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


// Ternary conditional operator
let age_ = 18
let canVote = age_ >= 18 ? "Yes" : "No"


let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)


enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

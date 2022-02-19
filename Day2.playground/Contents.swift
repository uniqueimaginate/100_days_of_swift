import UIKit


let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// 토글 기능
var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)



// String Interpolation
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)


let number_ = 11
let missionMessage = "Apollo " + String(number_) + " landed on the moon."

let missionMessage_ = "Apollo \(number_) landed on the moon."

print("5 x 5 is \(5 * 5)")


// CheckPoint 1

let celsius = 30
let fahrenheit = (celsius * 9) / 5  + 32

print("celsius: \(celsius)°C, fahrenheit: \(fahrenheit)°F")

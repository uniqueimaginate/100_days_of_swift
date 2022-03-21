import UIKit

// Why does Swift have type annotations?

/*
    1. Swift can’t figure out what type should be used.
    2. You want Swift to use a different type from its default.
    3. You don’t want to assign a value just yet.
*/

// Type annotation
// Type inference
let surname = "Lasso"
var score = 0

var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()


let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)


// there is one golden rule:
// Swift must at all times know what data types your constants and variables contain.


// 이 코드는 에러가 난다.
//let score: Int = "Zero"




print(albums.count)
print(Set(albums).count)

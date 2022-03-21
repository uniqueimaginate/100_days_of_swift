import UIKit


// var, let
var name = "Ted"
name = "Revecca"
name = "Keeley"

let character = "Daphne"
//character = "Eloise"
//character = "Francesca"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

// Camel Case 로 변수 이름 지음


// String
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

// Backslash
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

print(quote)

// """ 은 시작과 끝에서 홀로 존재해야 함
let movie = """
A day in
the life of an
Apple engineer
"""

let actor = "Denzel Washington"
let nameLength = actor.count
print(nameLength)
print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

// Number
let score = 10
//let reallyBig = 100000000
// 언더바는 사실 어디에 넣어도 상관이 없다. 1__0__0___0 이것도 됨
let reallyBig = 100_000_000

// +=, -=, /=, *= 사용가능


let number = 120
// 이렇게 배수 관계인 것도 알려줌 개꿀
print(number.isMultiple(of: 3))


// Decimal Numbers

let a = 1
let b = 2.0
// let c = a + b -> 이 코드 에러 난다. Int, Double 은 신뢰도가 다르기 때문에
let c = a + Int(b)


var name_ = "Nicolas Cage"
// name_ = 57 -> 이 코드 에러 난다. String 타입이 아니기 때문에

// CGFloat 가 쓰이는 곳에 Double 사용 가능하다.

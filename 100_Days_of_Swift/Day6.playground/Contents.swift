import UIKit

// for

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for platform in platforms {
    print("Swift works great on \(platform).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// nested loop
//for i in 1...12 {
//    print("The \(i) times table:")
//
//    for j in 1...12 {
//        print("  \(j) x \(i) is \(j * i)")
//    }
//
//    print()
//}

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)


let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[1...3])
print(names[1...])

// Range -> NSRange
let title = "A Swift Blog"
let range = title.range(of: "Swift")!
let convertedRange = NSRange(range, in: title)
let attributedString = NSMutableAttributedString(string: title)
attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: convertedRange)
print(attributedString)



// while
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")


// continue, break
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}


let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)



// Checkpoint 3

for i in 1...100 {
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    } else if i.isMultiple(of: 3){
        print("Fizz")
    } else if i.isMultiple(of: 5){
        print("Buzz")
    } else {
        print(i)
    }
}

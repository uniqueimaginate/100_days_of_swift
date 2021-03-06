import UIKit

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    // remove a prefix if it exists
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }

    // remove a suffix if it exists
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
    
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return self
        } else {
            return prefix + self
        }
    }
    
    var isNumeric: Bool {
        if Int(self) != nil {
            return true
        } else if Double(self) != nil {
            return true
        } else {
            return false
        }
    }
    
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
}

extension UIView {
    func bounceOut(duration: Double){
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

extension Int {
    func times(_ action: () -> Void){
        for _ in 0..<self {
            action()
        }
    }
}

extension Array where Element: Comparable {
    mutating func remove(item: Element) -> Array{

        if let index = self.firstIndex(of: item) {
            self.remove(at: index)
        }

        return self
    }
}

var arr = ["a","b","c","d"]

arr.remove(item: "c")


3.times {
    print("Hello World!")
}

let name = "Taylor"

for letter in name {
    print("Give me a \(letter)!")
}
          
print(name[3])


let input = "Swift is like Objective-C without the C"
print(input.contains("Swift"))

let languages = ["Python", "Ruby", "Swift"]
print(languages.contains("Swift"))

print(input.containsAny(of: languages))

print(languages.contains(where: input.contains))

let string = "This is a test string"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

//let attributedString = NSAttributedString(string: string, attributes: attributes)


let attributedString = NSMutableAttributedString(string: string)
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))

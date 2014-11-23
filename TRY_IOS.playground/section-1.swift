// Playground - noun: a place where people can play

import UIKit

var str = "Hello, Xander";
let one = "how are you?";
//let num:Double = 8.0;
println("today is developer's day");
let str_one = "Do";
let str_two = "you";
let str_three = str_one + str_two+"know?";
var chinese = "我是一个好人";
let chinese_you = "你不是一个好人";
let empty_arr = [1,2,3,4,5,6];
for key in empty_arr{
    if key % 2 == 0{
        println(key);
    }
};
var ios_dictionary = [
"1":[1,3,4,5,6],
"2":[7,8,9,10],
"3":[11,12,13,14]
]
for (key,val) in ios_dictionary{
    for num in val{
    println(num)
    }
}
var 我爱你 = "Chen"+"sdfsdf";
println(我爱你)

//array & dictionary definite
let dictions = [:]
let array = [1,2]
let one_arr = [String]()
let one_dic = Dictionary<String,Float>()
if 1 == 1{
println(array)
}

var first_ele = 0

//for loop
for i in 3..<4{
    println(i)
}
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")

//function 1 (have two params and return a double num)
func fibo(param1:Double,param2:Double) ->Double{
    func fibo2(param1:Double,param2:Double)->Double{
    return param1 * param2
    }
    return param1 * param2 * fibo2(3, 4)
}
fibo(2,3)

//function 2(multi params)
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum + 2
}
sumOf()
sumOf(42, 597, 12)


//clojure
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//function as params
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        println(item)
        if condition(item) {
            println(item)
            return true
        }
    }
    println(list)
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 5
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

//array map
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
//let mappedNumbers = "1231"
let mappedNumbers = numbers.map({ number in 3 * number })
mappedNumbers

//object & class
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//var name_shape = NamedShape()
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//
class EquilateralTriangle:NamedShape{
    var sideLength:Double = 0.0
    init(sideLength:Double,name:String){
    self.sideLength = sideLength
        super.init(name: name)
//        numberOfSides = 3
    }
    var perimeter: Double{
        get{
        return 3.0 * sideLength
        }
        set{
        sideLength = newValue / 3.0
        }
    }
    override  func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangel = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangel.perimeter
triangel.perimeter = 9.9
triangel.sideLength

//class three
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

//enum & switch
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
println(ace)
let aceRawValue = ace.toRaw()
//what is toRaw() or fromRam?
if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}


enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

//struct
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//definite a func
let x = 2,
    y = 3,
    z = 5,
minValue = UInt8.min,
maxValue = UInt8.max






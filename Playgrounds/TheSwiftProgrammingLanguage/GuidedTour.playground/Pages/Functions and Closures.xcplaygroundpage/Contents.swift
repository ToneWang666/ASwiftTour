//: ## Functions and Closures
//:
//: Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.
//:
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// self study
func sayHello(person: String, day: String) ->String {
    return "Hello \(person), today is \(day)"
}

print(sayHello(person: "Shannon", day: "Friday"))
//: - Experiment:
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//: By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// self study
func sayHello(_ person: String, on day: String) -> String {
     return "Hello \(person), today is \(day)"
}
print(sayHello("Hannah", on: "Monday"))
//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)


// self study
// Array<Int> 和 [Int] 有什么区别？
func doMath(scores: Array<Int>) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let returnValue = doMath(scores: [5, 3, 100, 3, 9])
print("my result sum = \(returnValue.sum)")
print(returnValue.1)
//: Functions can also take a variable number of arguments, collecting them into an array.
//:
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)


// self study
func maxFrom(numbers: Int...) -> Int {
    var max = 0
    for number in numbers {
        if max < number {
            max = number
        }
    }
    return max
}

print("max = \(maxFrom())")
print("max = \(maxFrom(numbers: 3, 5, 19))")


//: - Experiment:
//: Write a function that calculates the average of its arguments.
//:
//: Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
//:
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// self study
func returnFourteen() -> Int {
    var y = 10
    func add() {
        y += 4
    }
    add()
    return y
}
print("returnFourteen = \(returnFourteen())")


//: Functions are a first-class type. This means that a function can return another function as its value.
//:
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// self study

func whatShouIDo(age: Int) -> ((Bool) -> String) {
    func eat(isSmart: Bool) -> String {
        return "eat"
    }
    if age < 18 {
        return eat
    }
    
    func chaseYourLife(isSmart: Bool) -> String {
        if isSmart {
            return "coding"
        }
        else {
            return "porter"
        }
    }
    return chaseYourLife
}
var result = whatShouIDo(age: 25)
print("my job is \(result(false))")

//: A function can take another function as one of its arguments.
//:
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//: Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body.
//:
let myNumbers = [2, 3, 5, 1]
let mappedNumbersResult = myNumbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print("mappedNumbersResult = \(mappedNumbersResult)")

//: - Experiment:
//: Rewrite the closure to return zero for all odd numbers.
//:
//: You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
//:
let mappedNumbers = myNumbers.map({ number in 3 * number })
print("mappedNumbers = \(mappedNumbers)")

//: You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
//:
let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)



//: [Previous](@previous) | [Next](@next)

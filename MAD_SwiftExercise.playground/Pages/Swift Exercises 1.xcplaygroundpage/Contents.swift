//: # Swift Exercise
//: Welcome to the Swift Exercise. This document is an interactive Playground. The goal of this exercise is to familiarize yourself with the Swift syntax, terminology and concepts.
//:
//: If this text you're currently reading is being displayed as a code comment with `//:`, you can make it look prettier by selecting `Editor` --> `Show Rendered Markup` in the menu bar at the very top of your screen. You can switch back to the raw markup by clicking `Editor` --> `Show Raw Markup`. The document is designed to be viewed in Rendered Markup mode.
//:
//: You can type your Swift code in here and it'll automatically compile.
//: If the automatic compilation annoys you, you can turn it off by clicking-and-holding your mouse on the "Play" icon in the toolbar below. Then, select `Manually Run`.
//:
//: If you need help or have any questions, please feel free to contact me. You can find my contact info on the [course website](https://avf.github.io/mobile-app-dev/). I'm always happy to help!
//:
//: ## How to do the exercises
//: - Follow the instructions for the exercises.
//: - Please write any code that I ask for right into the playground.
//: - Any time I ask a question in an exercise, **please add a comment with the explanation in your own words.**
//:
//: Here's an example:
//:
//: Write a Hello World program in Swift in a single line. Why is this a valid Swift program?

print("Hello, World!") // This works because Swift programs by default execute statements in the global scope. A `main` function or similar is not required.

//: ## Exercises
//: ### Variables and Constants
//: 1. Declare a variable with value `42` that is implicitly assigned type `Int`.

var myInt = 42

//: 2. Declare a constant with value `42` that is implicitly assigned type `Int`.

let myConstantInt = 42

//: 3. Declare a variable with value `42.5`. What type does it have?

var myDouble = 42.5 // Inferred as Double, Swift's default type for floating-point literals.

//: 4. Declare a variable with explicit type `Float` and value `42.5`.

var myFloat: Float = 42.5

//: 5. Declare an uninitialized constant with type `String`. Will you ever be able to assign a value to this constant?

let myUninitializedString: String
// Yes, once. Swift lets a let constant skip its initial value as long as it gets assigned exactly
// once before it's ever read. The compiler checks every code path for this, so it's still fully safe.
myUninitializedString = "Value assigned"

//: ### Strings and String interpolation
//: 1. Create a constant of type `String` containing the text `"This is a String."`.

let myStringConstant: String = "This is a String."

//: 2. Create a mutable String with `"This is an Int: "` as its initial value.

var myMutableString = "This is an Int: "

//: 3. Create an `Int` constant with value 42 and append it to the mutable string, resulting in the value: `"This is an Int: 42"`.

let myIntForString = 42
myMutableString += String(myIntForString)

//: 4. Create another constant containing the same string, but this time use a string literal and string interpolation (the `\()` syntax) to create it.

let myInterpolatedString = "This is an Int: \(myIntForString)"

//: 5. Create a multiline string using the multiline string literal.

let myMultilineString = """
This is
a multiline
string.
"""

//: ### Arrays and Dictionaries
//: Arrays
//: 1. Create an immutable array and initialize it with an array literal containing 3 `String` elements

let myImmutableArray = ["Apple", "Banana", "Kiwi"]

//: 2. Create an empty mutable array of type `[String]`

var myMutableArray: [String] = []

//: 3. Append the second element of the first (immutable) array to the second (mutable) array.

myMutableArray.append(myImmutableArray[1])

//: 4. Can you modify one of the `String` elements in the first array (for example, append a word to it)? Why/why not? What if the elements were not of type `String`, but instead of a class?
// No, myImmutableArray[0] += "!" does not compile, because the array itself is a let and appending
// to an element counts as mutating the array's storage. This would be true even if the elements were
// a class instead of String, you still couldn't replace an element or mutate it through the array's
// own subscript. The one thing that would work with a class is calling a method or setting a var
// property directly on the object an element refers to, since that changes the object, not what the
// array stores, the array still holds the same reference the whole time.

//: 5. What happens if you modify the `String` element in the second array (for example, if you append a word to it)? Will the second element in the first array also change, or stay the same? Explain why.

myMutableArray[0] += "!"
// myImmutableArray[1] stays "Banana", it does not change. String is a value type, so appending it
// into myMutableArray copied the value in, it did not share a reference to the original. Mutating
// myMutableArray[0] only touches that independent copy.

//: 6. Create an immutable empty array of type `[Int]` without any literals, using the name of the class (`Array`) and the standard initializer for generic types (`var value = ClassName<GenericType>()`)

let myEmptyIntArray = Array<Int>()

//: Dictionaries
//: 1. Create a mutable empty Dictionary of type `[String: Double]`

var myDictionary: [String: Double] = [:]

//: 2. Set the value for the key `"Answer to Life, the Universe and Everything"` to `42`.

myDictionary["Answer to Life, the Universe and Everything"] = 42

//: ### Optionals
//: 1. Create an optional `String` variable and assign a non-nil value of your choice

var myOptionalString: String? = "Hello, Optional!"

//: 2. Print the String on the console. Make sure the variable is first unwrapped and only the actual value is printed. You may either force-unwrap the string or use an `if let` construct.

if let unwrappedString = myOptionalString {
    print(unwrappedString)
}

//: 3. What happens if you force-unwrap an optional variable that contains `nil`?
// The app crashes at runtime with a fatal error, something like "Unexpectedly found nil while
// unwrapping an Optional value". Force-unwrapping with `!` tells the compiler "trust me, there's
// definitely a value in here", so if that promise turns out to be false, the program terminates
// immediately instead of continuing with invalid data. This is a deliberate design choice, Swift
// would rather crash loudly and immediately than silently proceed with a missing value.

//: 4. Create another optional `String` variable and asign the value `nil`. Use the nil coalescing operator (`??`) to print the first unwrapped String from above.

var anotherOptionalString: String? = nil
print(anotherOptionalString ?? myOptionalString!)

//: 5. Do the same thing again, but this time use the ternary conditional operator `(a ? b : c)`.

print(anotherOptionalString != nil ? anotherOptionalString! : myOptionalString!)

//: Optional chaining
//: 1. Consider the following `struct`. Use optional chaining to change the value of `anOptionalInt` in `instance` to a new value of your choice in a single line of code. What would happen if we executed that line while `instance` is `nil`?
//: 1. Use the `if let` conditional and optional chaining to print the value of `anOptionalInt` in `instance`. What would happen if `instance` or `anOptionalInt` were `nil`?
//: 1. Use optional chaining to call the method `sayHelloWorld` of `instance`. What would happen if `instance` were `nil`?

struct MyStruct {
    var anOptionalInt: Int? = 5
    
    func sayHelloWorld() {
        print("Hello, World!")
    }
}

var instance: MyStruct? = MyStruct()

instance?.anOptionalInt = 10
// If instance were nil, this line would simply do nothing, no crash. Optional chaining short-circuits,
// the whole expression evaluates to nil and the assignment is skipped entirely.

if let currentOptionalInt = instance?.anOptionalInt {
    print(currentOptionalInt)
}
// If instance or anOptionalInt were nil, the chain instance?.anOptionalInt evaluates to nil, so the
// if let condition fails and the body is skipped, again with no crash.

instance?.sayHelloWorld()
// If instance were nil, the call is simply skipped, nothing happens, no crash.

//: ### Control flow
//: 1. Write a `for-in` loop that sums up all the values in `myNumbers`.
//: 1. Create an empty mutable `[Int: Int]` dictionary. Use a `for-in` loop to iterate over the elements in `myNumbers` and add each value to the dictionary, using the index of each element in `myNumbers` as its key. So for example, the dictionary should contain the key/value pair `0:12`, because 12 is element 0 of `myNumbers`.

let myNumbers = [12, 23, 1, 104]

var myNumbersSum = 0
for number in myNumbers {
    myNumbersSum += number
}

var myNumbersDictionary: [Int: Int] = [:]
for (index, number) in myNumbers.enumerated() {
    myNumbersDictionary[index] = number
}

//: ### Functions and Closures
//: Functions
//: 1. Declare and call a function without any parameters or return type that prints Hello World.
//: 1. Declare and call a function that takes two strings as parameters and returns a string. Remember that in Swift, most funtions have argument labels. Make sure to include them, you don't need to modify the argument labels in any way.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time remove the first argument label.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time make the first argument label **different** from the parameter name (=use a custom argument label).
//: 1. Declare a function with a default parameter value. Call the function twice, once with the argument present, once without.
//: 1. Declare a function with name `callAFunction` that takes another function as parameter and then executes it. Call your newly declared `callAFunction` and pass in one of the functions you previously declared.

func sayHello() {
    print("Hello World")
}
sayHello()

func combineWords(first: String, second: String) -> String {
    return first + " " + second
}
combineWords(first: "Hello", second: "World")

func combineWordsNoFirstLabel(_ first: String, second: String) -> String {
    return first + " " + second
}
combineWordsNoFirstLabel("Hello", second: "World")

func combineWordsCustomLabel(with first: String, second: String) -> String {
    return first + " " + second
}
combineWordsCustomLabel(with: "Hello", second: "World")

func greet(name: String = "World") -> String {
    return "Hello, \(name)!"
}
greet()
greet(name: "Swift")

func callAFunction(_ function: () -> Void) {
    function()
}
callAFunction(sayHello)

//: Closures
//: 1. Create an optional variable that holds a closure (with a `String` parameter and no return type) and assign `nil`.
//: 1. Call the closure using optional chaining. What will happen?
//: 1. Create a `typealias` for this type of closure.

var myOptionalClosure: ((String) -> Void)? = nil

myOptionalClosure?("Hello")
// Since myOptionalClosure is nil, this call is skipped entirely, nothing happens, no crash. Optional
// chaining applies to calling an optional closure just like it does for optional methods and properties.

typealias StringClosure = (String) -> Void
var myTypedOptionalClosure: StringClosure? = nil

//: 1. Take a look at the following function, which takes a closure as parameter and calls it. This function is then called. For each of the following exercises, call the function again, but each time use one more simplification:
//:   * Omit closure parameter types.
//:   * Omit the closure return type
//:   * Omit the round brackets and argument label (we can do that since it's the last function parameter)
//:   * Omit the closure parameters completely. In the closure body, use the shorthand argument names (for example `$0`)
//:   * Omit the keyword `return`

func callAClosure(closure: (String, String) -> String) {
    print(closure("Hello", "World"))
}
callAClosure(closure: { (item1: String, item2: String) -> String in
    return "\(item1) \(item2)"
})

// Simplification 1: omit closure parameter types, inferred from callAClosure's declared parameter type.
callAClosure(closure: { (item1, item2) -> String in
    return "\(item1) \(item2)"
})

// Simplification 2: also omit the closure return type, inferred the same way.
callAClosure(closure: { (item1, item2) in
    return "\(item1) \(item2)"
})

// Simplification 3: also omit the parentheses and argument label, using trailing closure syntax.
callAClosure { (item1, item2) in
    return "\(item1) \(item2)"
}

// Simplification 4: also omit the parameter list, using the shorthand argument names $0 and $1.
callAClosure {
    return "\($0) \($1)"
}

// Simplification 5: also omit the return keyword, since a single-expression closure body is implicit.
callAClosure {
    "\($0) \($1)"
}

//: ### Classes
//: 1. Create a new class named `Person`. Add non-optional `firstName` and `lastName` properties and an initializer.
//: 1. Add a `name` computed property that returns a `String` containing the first and last name.
//: 1. Add a method named `greet` that returns the following `String`: `"Hi, I'm \(name)."`
//: 1. Create a subclass of `Person` and name it `Student`.
//: 1. Add a `Float?` optional property called `grade`. Use the `didSet` property observer to make sure that the grade is not lower than 1.0 and not higher than 5.0 after it was set. Clamp the new value to this interval - so if a value higher than 5.0 is set, set it to 5.0 afterwards. If a value lower than 1.0 is set, set it to 1.0 afterwards.
//: 1. Override the `greet` function from the superclass. If the `grade` property is set, it should now return `"Hi, I'm \(name). My grade is: \(grade)"`. If the `grade property isn't set, return the superclass's implementation.

//: ### Enums and Structs
//: 1. Create an enum named `PetType` with cases `dog` and `cat`
//: 1. In your new enum, create a function or computed property named `animalSound` that returns a `String`. Use a `switch` statement on `self` to differentiate between the cases and return `"woof"` for the `.dog` case and `"meow"` for the `.cat` case.
//: 1. Create a structure named `Pet`, with a `name` property of type `String` and a `type` constant of type `PetType` (both non-optional).
//: 1. Add a function to your structure named `makeNoise` that returns a `String`. In its implementation, return the `animalSound` of its `type`.
//: 1. Create 3 or more instances of your `Pet` struct and store them in `let` constants. Then create a new array that contains all your pets and store it in a variable.
//: 1. Change one of the names of the pets in your array. Does this change the name of any of the pets stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the pets stored in the `let` constants? Explain why/why not.
//: 1. Create 3 or more instances of your `Student` class from above and store them in `let` constants. Then create a new array that contains all your students and store it in a variable.
//: 1. Change one of the names of the students in your array. Does this change the name of any of the students stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the students stored in the `let` constants? Explain why/why not.

//: ### Protocols and extensions
//: 1. Create a protocol called `NamedThing`. Add a `get` variable of type `String`, with the name `name`.
//: 1. Use extensions to make your `Person` class and `Pet` structs from above conform to the new protocol.
//: 1. Create a new array that contains all the objects you declared as `let` constants above. You may have to explicitly specify the type of the array as `[NamedThing]`.
//: 1. Iterate over the objects in the array and print out their names.
//: 1. Create a protocol extension for `NamedThing` that contains a new computed property of type `String` called `initial`. Add a default implementation in your protocol extension, which returns the first character of the `name` property, or, if `name` is empty, an empty string.
//: 1. Print the new `initials` property in the loop you created above.

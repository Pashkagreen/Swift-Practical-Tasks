// 1. Поиск уникальных символов в строке

var uniqueString = "Bye"
var nonUniqueString = "Hello, Paul. Nice to meet you here!"

func sort1(input: String) -> Bool {
    var checkedSymbols = [Character]()
    
    for symbol in input {
        if checkedSymbols.contains(symbol) {
            return false
        }
        
        checkedSymbols.append(symbol)
    }
    
    return true
}

sort1(input: uniqueString)
sort1(input: nonUniqueString)


func sort2(input: String) -> Bool {
    return Set(input).count == input.count
}

sort2(input: uniqueString)



// 2. Является ли строка палиндромом?

var palyndromeString = "А роза упала на лапу Азора"
var palyndromeString2 = "Казак"

func checkIsPalyndrome(_input: String) -> Bool {
    let lowerCasedString = _input.lowercased()
    
    return String(lowerCasedString.reversed()) == lowerCasedString
}

checkIsPalyndrome(_input: palyndromeString2)



// 3. Идентичны ли 2 строки между собой? (Одни и те же символы, любой порядок с учетом регистра)

func checkTheSameString(string1: String, string2: String) -> Bool {
    // .sorted() сортирует массивы по умолчанию порядку букв/цифр
    return string1.sorted() == string2.sorted()
}

checkTheSameString(string1: "Hello, Paul", string2: "Paul, Hello")



// 4. Содержит ли одна строка другую? (Игнорируя регистр)

extension String {
    func customContains(_ string: String) -> Bool {
        return self.lowercased().contains(string.lowercased())
    }
}

func checkIncludedString(string1: String, string2: String) -> Bool {
    return string1.customContains(string2)
}

checkIncludedString(string1: "Hello, Swift", string2: "swift")



// 5. Сколько раз символ встречается в строке? (С учетом регистра)

func checkNumberOfSymbolsInString(input: String, count: Character) -> Int {
    var letterCount = 0
    
    for symbol in input {
        if symbol == count {
            letterCount += 1
        }
    }
    
    return letterCount
}

func checkNumberOfSymbolsInString2(input: String, count: Character) -> Int {
    return input.reduce(0, {
        $1 == count ? $0 + 1 : $0
    })
}

checkNumberOfSymbolsInString(input: "Hello, Swift", count: "l")
checkNumberOfSymbolsInString2(input: "Hello, Swift", count: "l")



// 6. Удаление повторяющихся символов из строки

func removeDuplicatesInString(input: String) -> String {
    var used = [Character]()
    
    for letter in input {
        if !used.contains(letter) {
            used.append(letter)
        }
    }
    
    return String(used)
}

removeDuplicatesInString(input: "Hello")



// 7. Сокращение пробелов до одного

func removeSpace(input: String) -> String {
    var seenSpace = false;
    var returnValue = ""
    
    for letter in input {
        
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        
        returnValue.append(letter)
    }
    
    return returnValue
}

removeSpace(input: "Hel  , lo. I am  Groot")



// 8. Вращение строки (skipped)



// 9. Является ли строка панграммой? (Все буквы алфавита)

let pangrammString = "The quick brown fox jumps over the lazy dog"

func checkIsPangramm(_ input: String) -> Bool {
    let set = Set(input.lowercased())
    
    let letters = set.filter{
        $0 >= "a" && $0 <= "z"
    }
    
    return letters.count == 26
}

checkIsPangramm(pangrammString)



// 10. Количество гласных и согласных

func countVowelsAndConsonants(_ input: String) -> (vowels: Int, consonants: Int) {
    let vowels = "aeoiou"
    let consonants = "bcdfghjklmnpqrstvwxyz"
    
    var vowelCount = 0
    var consonantsCount = 0
    
    for character in input {
        if vowels.contains(character) {
            vowelCount += 1
        } else if consonants.contains(character) {
            consonantsCount += 1
        }
    }
    
    return (vowelCount, consonantsCount)
}

countVowelsAndConsonants("Hello, world!")



// 11. Не более, чем 3 различные буквы (skipped)



// 12. Поиск самого длинного префикса

func findLargestPrefix(_ input: String) -> String {
    // Строка -> массив строк, аналог .split(" ")
    let parts = input.components(separatedBy: " ")
    
    // Проверка на nil
    guard let first = parts.first else { return "" }
    
    var currentPrefix = ""
    var bestPrefix = ""
    
    for letter in first {
        currentPrefix.append(letter)
        
        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        
        bestPrefix = currentPrefix
    }
    
    
    return bestPrefix
}


findLargestPrefix("hello, hell, help helicopter")



// 13. Повторение символов в ряду (skipped)

// 14. Перевернуть слова в строке

import Foundation

func reversedWords(_ input: String) -> String {
    // Массив строк
    let parts = input.components(separatedBy: " ")
    
    // Переворачиваем каждый элемент + приведение к строке + склеивание по " "
    return parts.map { String($0.reversed())
    }.joined(separator: " ")
}

reversedWords("Hello, world")



// Работа с числами



// 15. Остаток от деления (на 3,5)

func devision() -> Void {
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            print("Three five")
        } else if i % 3 == 0 {
            print("Three")
        } else if i % 5 == 0 {
            print("Five")
        } else {
            print(i)
        }
    }
}

devision()



// 16. Сгенерировать рандомное число в диапазоне

func generateRandom(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

generateRandom(min: 20, max: 40)



// 17. Возведение числа в степень

func power(number: Double, power: Double) -> Double {
    guard number > 0, power > 0 else { return 0 }
    
    return pow(number, power)
}

power(number: 2, power: 3)



// 18. Поменять два числа местами

var a = 5
var b = 3

swap(&a, &b)

a
b

(a,b) = (b, a)



// 19. Найти простое число

func primeNumber(number: Int) -> Bool {
    guard number >= 2 else { return false }
    
    for i in 2 ..< number {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

primeNumber(number: 19)



// 22. Числа в строке

func strToInt(input: UInt) -> Bool {
    return UInt(input) != nil
}

UInt.max



// 26. Расширение для коллекции, сортирующее по кол-ву символов

extension Collection where Iterator.Element == String {
    func stringSort() -> [String] {
        return self.sorted { $0.count > $1.count }
    }
}

let d = ["akm", "vd", "freverve", "fefvec"]

d.stringSort()





















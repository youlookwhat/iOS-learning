import UIKit

var greeting = "Hello, playground"

// 第三章 字符、字符串与集合类型


var str : String = "hello playground"
// 通过构造方法来构造
var str1 =  String()// 构造空字符串""
str1 =  String(666)// 构造字符串"666"
str1 =  String(false)// 通过Bool值构造字符串"false"
str1 = String(describing: (1,1.0,true))//通过元祖构造
str1 = String(describing: [1,2,3])//通过列表构造
str1 = String(format: "我是%@", "景彬")

var a = Int(1.05)
var a1 = Int(1.5)//1
var a2 = Int(1.9)//1
var b = Float(a)//1.0
print(b)

var c1 = "Hello"
var c2 = "world"
var c3 = c1 + " " + c2
// 使用 \() 结构
var d = "Hello \(c2)"
var d2 = "Hello \(1+2)"// hello 3

MemoryLayout<String>.size// 16个字节 获取String类型占用的内存空间
MemoryLayout<Int>.size

// 创建一个字符
var e:Character = "a"
// 创建字符数组
var e2 :[Character] = ["H","e","l","l","o"]
// 通过字符数组来构造字符串
var e3 = String(e2)
// 通过构造方法
var e4 = Character("a")

// 进行for-in遍历
let name = "China"
// kotlin 是 for (character2 in name)
for character2 in name {
    print(character2)
}

print("北\0京") // \0是空白符 数字零
print("\0")// 空白就是空字符串？
print("\\")

var obj1 = ""
if obj1.isEmpty {
    print("obj1为空字符串")
}

// 比较字符串
var com1 = "30a"
var com2 = "31a"
if com1 < com2 {
    print("com1 比 com2 小")// 字符挨个比较
}

var string = "Hello-swift"
var startIndex = string.startIndex// 获取到的是Index类型，不是证书类型
var endIndex = string.endIndex

var char = string[string.index(after: startIndex)]// 获取后一个index的字符 e
var char2 = string[string.index(before: endIndex)] // t

var subString = string[startIndex...string.index(startIndex, offsetBy: 4)]//Hello
var subString2 = string[string.index(endIndex, offsetBy: -5)..<endIndex]//swift


// 获取范围、拼接、插入、替换、删除

// 获取某个子串在父串中的范围，获取后不知道怎么用
var range = string.range(of: "Hello")// Optional(Range(Swift.String.Index(_rawBits: 1)..<Swift.String.Index(_rawBits: 327680)))
// 追加一个字符，此时 string="Hello-swift!"
string.append(Character("!"))
// 再次追加字符串
string.append(" Hello-world!")
// 在指定位置插入字符 "Hello-swift!~ Hello-world!"
string.insert("~", at: string.index(string.startIndex, offsetBy: 12))
// 在指定位置插入一组字符 "Hello-swift!~~~~ Hello-world!"
string.insert(contentsOf: ["~","~","~"], at: string.index(string.startIndex,offsetBy: 12))
// 在指定范围替换一个字符，将Hello替换为Hi， "Hi-swift!~~~~ Hello-world!"
string.replaceSubrange(string.startIndex ... string.index(string.startIndex,offsetBy: 4),with: "Hi")
// 在指定位置删除一个字符，删除的是 !
string.remove(at: string.index(before: string.endIndex))
// Hi-swift!~~~~ Hello-world
print(string)
// 删除指定范围的字符，"swift!~~~~ Hello-world"，删除了Hi-，默认删除第一个H，加了2后就删除了后面的两个即Hi-
string.removeSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 2))
// 删除所有字符串
string.removeAll()

var string2 = "My name is Jingbin"
// 转换为大小写
string2 = string2.uppercased()
string2 = string2.lowercased()

string2.hasPrefix("My")// 前缀是否是My,因为转换为大写了，所以为false
string2.hasSuffix("bin")// 后缀是否是bin，true

string2 [string2.index(string2.startIndex, offsetBy: 1)]// 获取string2的第二个角标的字符


// 集合类型

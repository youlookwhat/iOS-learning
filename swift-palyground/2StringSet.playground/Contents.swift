import UIKit

var greeting = "Hello, playground"

// 第三章 字符、字符串与集合类型

// -----------字符串-----------
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
// -----------1.数组-----------
var array1:[Int]// 2中声明方式
var array2:Array<Int>

array1 = []
array2 = Array()

array1 = [1,2,3]
array2 = Array(arrayLiteral: 1,2,4)

// 创建有10个String类型元素的数组，并且每个元素都为字符串"Hello"
var array3 = [String](repeating: "Hello", count: 10)
var array4 = Array(repeating: 1, count: 10)

// 拼接
var array5 = [1,2,3,4,5,6]
array5 = [1,2,3] + [4,5,6]

// 查
var array = [1,2,3,4,5,6,7,8]
array.count
if !array.isEmpty {
    print("不为空")
}
array[0]// 通过下标获取元素
array[0...3]// 获取区间元素数组 [1, 2, 3, 4]
array.first
array.last

// 修改
array[0] = 0 // 修改一个
array[0...3] = [0,1,2,3]// 修改一组
array

// 添加
array.append(9)// 添加一个
array.append(contentsOf: [10,11])// 添加一组

// 插入
array.insert(-1, at: 0)// 在0的位置插入-1
array.insert(contentsOf: [-3,-2], at: 0)// 在0的位置插入一组元素

// 移除 初始：[-3, -2, -1, 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11]
array.remove(at: 1)// [-3, -1, 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11]
array.removeFirst()// [-1, 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11]
array.removeLast()// [-1, 0, 1, 2, 3, 5, 6, 7, 8, 9, 10]
array.removeFirst(2)// [1, 2, 3, 5, 6, 7, 8, 9, 10]
array.removeLast(2) // [1, 2, 3, 5, 6, 7, 8]
array.removeSubrange(0...2)// [5, 6, 7, 8]
array.replaceSubrange(0...2, with: [0,1]) // [0, 1, 8]
array.removeAll()

// 判断 是否不包含1
if !array.contains(1){
    print(true)
}

// 遍历
let arrayLet = [0,1,2,3,4]// Int数组
let arrayLet2 = [(0,1),(1,2),(2,3)]// Int,Int数组
for item in arrayLet2 {
    print(item)// (0, 1) (1, 2) (2, 3)
}
// 进行数组枚举遍历
for item2 in arrayLet.enumerated(){
    print(item2)// (0, 0) (1, 1) (2, 2)
}
// 进行数组角标遍历
for index in arrayLet2.indices {
    print(arrayLet2[index],separator: " ")//// (0, 1) (1, 2) (2, 3)
}

// 排序
var arraySort = [1,3,5,6,7,4]
arraySort = arraySort.sorted(by: >)// 从大到小排序
arraySort = arraySort.sorted(by: <)// 从小到大排序
arraySort.max()// 获取最大值
arraySort.min()// 获取最小值


// -----------3.集合类型-----------
// 创建set，这是一个无序的，每次打印出现的数据数据可能会不一样
var set1 :Set<Int> = [1,2,3,4]
var set2  = Set(arrayLiteral: 1,2,3,4)

// 通过下标取数，基本无意义
set1[set1.startIndex]
set1[set1.index(after: set1.startIndex)]
set1[set1.index(set1.startIndex, offsetBy: 3)]// 获取某个下标后几个元素

// 获取
set1.count
if !set1.isEmpty{
    print("不为空")
}
if set1.contains(1){
    print(true)
}
set1.max()
set1.min()


// 插入
set1.insert(5) // [1,2,3,4,5]
print(set1)
set1.remove(2)
set1
set1.removeFirst()
set1
//set1.remove(at: set1.firstIndex(of: 1)!)// 移除集合中某个位置的元素
set1.removeAll()
set1

// 获取交集、并集、补集
var set3 :Set<Int> = [1,2,3,4]
var set4 :Set<Int> = [1,2,5,6]
var setIter = set3.intersection(set4)// 获取并集 {1, 2}
var setEx = set3.symmetricDifference(set4)// 获取交集的补集 {6, 5, 3, 4}
var setUni = set3.union(set4)// 获取并集 {4, 3, 2, 5, 6, 1}
var setSub = set3.subtracting(set4)// 获取第二个集合的补集 {4, 3}

// 判断
var set5:Set = [1,2]
var set6:Set = [2,3]
var set7:Set = [1,2,3]
var set8:Set = [1,2,3]


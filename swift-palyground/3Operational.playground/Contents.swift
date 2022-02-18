import UIKit
import Darwin

var greeting = "Hello, playground"

// 第四章 基本运算符与程序流程控制

// 基本都知道，查漏补缺

// 元组赋值

// 元组解构赋值
var (n1,n2,n3) = (1,2,3)
print(n1,n2,n3)

// 元组比较
var  group1 = (1,2,3)
var  group2 = (2,2,3)
print(group1 < group2) // true 类型要一致

// 三目运算
var m = 2
var n = 3
print(m > n ? "m>n" : "m<=n")

// 空合并运算符
var q :Int? = 8
var value : Int
value = q ?? 0 // q不为空取q，否则取0

var range1 = 0 ... 9 // 包含9 [0,9]
0 ..< 9 // 不包含9 [0,9)

range1 ~= 8 // 是否包含8

for index in range1 {
    print(index)
}
for _ in range1 {
    print("不用使用值")
}

// 遍历字典
var collect : Dictionary = [1:"1",2:"2",3:"33"]
for (x1,y1) in collect {
    print(x1,y1)
}

// switch 语句没有break，默认有这个
var string1 = "1"
switch string1 {
    case "1":
        print("是1")
    default:
        print("")
}

switch string1 {
    case "1","2":
        print("是1或2")
    default:
        print("")
}
var num = 1
switch num {
    case 0 ... 3:
        print("在0到3中")
    default:
        print("")
}

var tuple = (0,0)
switch tuple {
    case (0,1):
        // 严格匹配
        print("Sure")
    case (_,0):
        // 匹配第二个
        print("Sure2")
        fallthrough // 默认自动中断，加上这个后可以不中断
    case (0...2,0...2):
        // 匹配区间
        print("区间")
    default:
        print("default")
}

// 捕获元组的元素
var tuple2 = (0,0)
switch tuple2 {
    case (let a , 1):// 捕获第一个元素，如果第二个元素不匹配则捕获失败
        if a == 0 {
            print("a is 0")
        }
    case (let a , 0) where a == 0: // 通过where再进行一次条件判断
        print("b==0 且 a==0")
    case let(a , b):// 捕获两个 与 (let a, let b)一样
        print(a , b)
//    default:
//        print("默认")
}

// break 后面可以指定中断哪个循环结构
Mylabel :for index in 0...9 {
    for index2 in 0...3 {
        if index2 == 2 {
            // 直接中断外层，默认中断内层
            break Mylabel
        }
        print("\(index) -- \(index2)")
    }
}

// return 语句
func myFunc() -> Int {
    return 0
}
func myFunc1() {
    return
}

// throw 抛异常
enum MyError :Error {
    case errorOne
    case errorTwo
}
func newFunc() throws {
    throw MyError.errorOne
}


// guard-else 解决在方法里使用return，优化代码
func myFuncTwo(param:Int) {
    guard param>0 else {
        return
    }
    print("执行>0的代码")
}

myFuncTwo(param: 1)


// 练习与解析
// 1.计算时不能和小数一起计算？
var a = 3 * 2.5
var b = 11 * 0.5
var sum = 5 * 2 + 1 * 3 + a + b
print(sum)

// 2.生成随机数 1-7
var rand = arc4random() % 7 + 1

// 3.处理if
var yuwen = 90
var shuxue = 90
var yingyu = 61
if yuwen > 60 && shuxue > 60 && yingyu > 60 && (yuwen+shuxue+yingyu)>200 {
    print("合格")
}

// 4.编写闰年判断表达式  1.能被400整除 2.能被4整除，不能被100整除 1或2
var year = 2000
if year%400==0 || (year%4==0 && year%100 != 0) { // !=0 前后要有空格
    print("闰年")
}

// 5.三目运算
var fen = 20
var people = fen > 30 ? "主选手" : "辅助选手"// > 前后不能有一个空格，要么都有要么都没有

// 6.打印图案
for index in 1...4 {
    // 换行
    print("")
    for index2 in 1...10 {
        if index==1 || index==4 {
            // 后面是去掉换行
            print("*",separator: "",terminator: "")
        } else if index2==1 || index2==10 {
            print("*",separator: "",terminator: "")
        } else {
            print("?",separator: "",terminator: "")
        }
    }
}

// 7.打印水仙花数 各位数字的立方和等于该数本身
print("")
for index in 100...999 {
    let bai = index/100
    let shi  = index/10%10
    let ge = index%10
    if index == bai*bai*bai + shi*shi*shi + ge*ge*ge {
     print("水仙数 \(index)")
    }
}


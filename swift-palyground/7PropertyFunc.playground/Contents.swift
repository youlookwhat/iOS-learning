import UIKit

var str = "Hello, playground"

// 第八章 属性与方法

class Student{
    // 可修改，可为空
    var name:String? = nil
    // 可修改，不能为nil
    var age:Int
    // 可修改，给默认值
    var schoolName = "大学"
    // 不可修改
    let sex :String

    init(age:Int,sex:String) {
        self.age = age
        self.sex = sex
    }
}

// 构造体
struct Point{
    var x:Double
    var y:Double
}
// 类
class PointC {
    var x:Double
    var y:Double
    init(x:Double,y:Double) {
        self.x = x
        self.y = y
    }
}
// 构造体如果是常量接收的，不能修改
let point = Point(x:1,y:2)
//point.x = 2

// 类无论是常量还是可变接收都可修改
let pointc = PointC(x:1,y:2)
pointc.x = 3


// 延迟储存属性
class Work{
    var name:String = ""
    init() {
        print("初始化构造")
    }
}
class People{
    var age : Int
    // 延迟属性
    lazy var work :Work = Work()
    init(age:Int) {
        self.age = age
    }
}
let people = People(age:20)
// 在执行的时候才进行初始化Work，不是线程安全的，可以被调用多次
people.work


// 计算属性的意义和使用
class Circle{
    var r:Double
    var center:(Double,Double)
    // 周长
    var l:Double {
        get{
            // 2 * pi * r
            return 2 * Double.pi * r
        }
        set{
            // 得到周长求r,newValue代表周长l的值
            r = newValue/2/Double.pi
        }
    }
    // 面积
    var s:Double {
        get {
            // pi * r * r
            return Double.pi * r * r
        }
        // 可以自定义属性名
        set(myValue){
            // 开更号
            r = sqrt(myValue / Double.pi)
            print("在求r")
        }
    }
    
    // 只读属性，没有set
    var test1:Double {
        get {
            return 234
        }
    }
    // 可简写成这样
    var test :Double {
        return 123
    }
    
    
    init(r:Double,center:(Double,Double)) {
        self.r = r
        self.center = center
    }
}
var circle = Circle(r:3,center: (3,3))
print(circle.s)
// 赋值面积后就得到了r，这时候 set 就会执行
circle.s = 25 * Double.pi
print("----")
print(circle.r)// 5.0


// 属性监听器，只在第二次为属性赋值的时候触发，因为第一次要不是直接写死的，要不是构造方法赋值的
class Teacher {
    var name:String {
        willSet (new){
            // 也可以不要 new 这个值
            print("要赋值前被调用 \(name)，将要赋值的名字 \(new)")
        }
        didSet (old){
//        didSet {
            print("赋值后被调用 \(name)")
        }
    }
    init(name:String) {
        self.name = name
    }
}
// 第一次赋值不触发
var t = Teacher(name: "小王")
// 要赋值前被调用 小王
// 赋值后被调用 哈哈
t.name = "哈哈"


// 属性包装器
// 确保number不小于0
@propertyWrapper
struct MoreThanZero {
    private var number:Int
    init() {
        self.number = 0
    }
    // 一定要包含这个key
    var wrappedValue:Int{
        get {
            return self.number
        }
        set {
            if newValue>=0 {
                self.number = newValue
            } else {
                self.number = 0
            }
        }
    }
}

// 确保属性赋值不能为空字符串
@propertyWrapper
struct NotEmptyString{
    private var value:String
    init(){self.value = "default"}
    var wrappedValue:String {
        get {
            return self.value
        }
        set {
            if newValue.count>0 {
                self.value = newValue
            } else {
                self.value = "default"
            }
        }
    }
}

class Member:CustomStringConvertible {
//    private var name:String
//    private var age:Int
//    init() {
//        self.name = "default"
//        self.age = 0
//    }
    @NotEmptyString var memberName:String
    @MoreThanZero var memberAge:Int
    var description: String {
        return "\(memberName) : \(self.memberAge)"
    }
}

let member = Member()
member.memberAge = -1 // 转换为了 0
member.memberName = ""// 转换为了 default
print(member)



// 实例属性和类属性
// 实例属性：需要类初始化得到实例后才能调用，就是正常的属性
// 类属性，可以不用初始化，直接调用，用static或者class来修饰，其中class修饰的可以被覆写
class SomeClass{
    static var calssName:String = "SomeClass"
    class var calssName2:String {
        return "SomeClass2"
    }
    static func test(){
        print("静态方法")
    }
    class func test2(){
        print("可以被覆写的方法，也可以直接被调用")
    }
    func test3(){
        print("一般的示例方法")
    }
}
SomeClass.calssName
SomeClass.test()
SomeClass.test2()


// 继承SomeClass
class SubClass :SomeClass {
    
    override class var calssName2: String {
        return "被覆写的属性"
    }
    override class func test2() {
        print("被覆写的方法")
    }
    // 不能被覆写
//    override func test() {
//        print("")
//    }
    override func test3() {
        print("实例方法可直接被覆写")
    }
}
SubClass.calssName2
SubClass.test2()
SubClass().test3()


// 下标方法
var array = [1,2,3,4,5]
array[2]
// 模拟系统的Array数组创建一个自定义的数组类
class MyArray {
    var array:Array<Int>
    init(param:Int ... ) {
        array = param
    }
    // subscript是Swift语言中用来定义下标功能的方法
    subscript(index:Int) -> Int {
        set (value){
            array[index] = value
        }
        get {
            return array[index]
        }
        
    }
}
var myArrary = MyArray(param: 1,2,3,5,6,7)
myArrary[1]
myArrary[0] = 10

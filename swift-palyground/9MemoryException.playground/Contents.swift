import UIKit

var str = "Hello, playground"

// 第10章 内存管理与异常处理

// 循环引用及其解决方法
// 1.引用类型的解决方法：使用weak，当使用weak声明的对象=nil时，其被持有的对象里引用的对象也会被置为nil
class ClassOne {
    // 进行弱引用，如果是非空（非Optional）使用的是unowned(无主引用)
    weak var cls:ClassTwo?
    deinit {
        print("ClassOne deinit")
    }
}

class ClassTwo {
    var cls:ClassOne?
    init(cls:ClassOne?) {
        self.cls = cls
    }
    deinit {
        print("ClassTwo deinit")
    }
}
// 循环引用
var obj : ClassOne? = ClassOne()
var obj2 : ClassTwo? = ClassTwo(cls:obj)
obj?.cls = obj2

obj = nil
obj2 = nil
// ClassTwo deinit
// ClassOne deinit
// 表明 obj 和 obj2 都被释放了

var d:String = ""


// 异常
enum MyError:Error {
    case SimpleError
    case MidError
}
func MyFunc(param:Bool) throws -> Void {
    if param {
        print("true")
    } else {
        throw MyError.SimpleError
    }
}

do {
    try MyFunc(param: false)
}catch MyError.MidError {
    print("MidError")
} catch (e:MyError.SimpleError) {
    // 有对象
    print("SimpleError")
} catch {
  print("ohter")
}

// 上面比较冗余，简单：
var temp: Void? = try? MyFunc(param: false)
if temp == nil {
    print("执行失败")
} else {
    print("执行成功")
}

if let _ = try? MyFunc(param: false) {
    print("执行成功")
} else {
    print("失败")
}

// 可以使用
// try?:只需要一行表达式，用来不考虑发生什么异常
// try: 需要对方法进行 do {} catch {} 操作
// try!: 坚信里面不会有异常，否则就会崩溃，一般不会用到
try? MyFunc(param: true)
try! MyFunc(param: true)


// 延迟执行结构
// 一定会执行，在抛出异常时也会执行
func TemFunc() throws -> Void {
    defer {
        print("finish")
    }
    print("handle")
    // 抛出异常，还是可以打印 finish
    throw MyError.MidError
}

try? TemFunc()


// 练习与解析
enum AchieveError:Error {
    case achieveError
}
func printAxhieve(mark:Int) throws ->Void {
    if mark < 0 {
        throw AchieveError.achieveError
    } else if mark < 100 {
        print("几个")
    } else {
        throw AchieveError.achieveError
    }
}

do {
    try printAxhieve(mark: 100)
} catch AchieveError.achieveError {
    print("成绩无效")
} catch {
    print("111")
}



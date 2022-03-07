import UIKit

var str = "Hello, playground"

// 第9章 构造方法与析构方法

class MyClass {
    var age:Int = 0 {
        willSet {
            print("将要赋值时")
        }
    }
    var name:String{
        didSet{
            print("已经赋值完")
        }
    }
    // 可以不被赋值，不赋值默认为nil
    var opt:Int?
    let name2:String = "bin"
    
    // 类和结构体属性都有初始值可以没有构造方法
    init() {
        // 一定要对没初始化的属性赋值
        name = "JINGBIN"
        
        // let 常量赋值后，不能被修改
//        name2 = "11"
    }
}

// 指定构造方法和便利构造方法
// 便利构造方法一定要调用指定构造方法
class BaseClass {
    init(){
        print("BaseClass Designated")
    }
    convenience init(param:String){
        print("便利构造方法")
        self.init()
    }
}

// 构造方法的安全性检查
class Check {
    var property:Int
    init(param:Int) {
        self.property = param
    }
}
class SubCheck : Check {
    var subProperty:Int
    init(){
        // 必须在调用父类的构造方法前完成本身属性的赋值
        subProperty = 1
        super.init(param: 0)
        // 子类要重新赋值父类的属性，要在调用父类的构造方法后
        super.property = 1
        // 在完成父类的构造方法后，才能使用self关键字
        self.subProperty = 2
    }
    convenience init(param:Int,param2:Int){
        self.init()
        subProperty = param
        property = param2
    }
}

// 可失败的构造方法与必要构造方法
class Check2 {
    var property:Int
    
    // 必要构造方法，当加上了required后，子类需要要实现
    required init(param:Int) {
        property = param
    }
    // 可失败的构造方法
    init?(_ param:Bool){
        // 当值为false时，构造失败返回为nil，可行，因为类可以为nil
        guard  param else {
            return nil
        }
        property = 1
    }
}
print(Check2(false))// nil

class SubCheck2 : Check2 {
    required init(param:Int) {
        super.init(param: param)
        print("一定要实现？")
    }
}

// 析构方法，在实例销毁的时候调用
class Temp {
    deinit {
        print("我被销毁了")
    }
}

// 这样不能被赋值nil
//var t = Temp()
var t :Temp? = Temp()
t = nil



// 练习
// 设计子弹类
class Bullet {
    var place:Int
    static var speed:Int = 30
    func fly(){
        self.place += Bullet.speed
    }
    init(place:Int) {
        self.place = place
    }
    deinit {
        print("子弹命中")
    }
}
// 设计敌人类
class Enemy{
    var place:Int
    static var speed:Int = 10
    func escape(){
        self.place += Enemy.speed
    }
    init(place:Int) {
        self.place = place
    }
    deinit {
        print("敌人被击中")
    }
}

var bullet:Bullet? = Bullet(place: 0)
var enemy:Enemy? = Enemy(place: 300)
// 记录追击回合
var i = 0
while bullet!.place < enemy!.place {
    bullet!.fly()
    enemy!.escape()
    i+=1
    print("追击\(i)回合")
}
// 将敌人和子弹一起销毁
bullet = nil
enemy = nil

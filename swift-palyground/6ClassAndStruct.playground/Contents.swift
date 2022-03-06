import UIKit

var str = "Hello, playground"

// 第七章 类和结构体

// 结构体
struct Car {
    // 价格
    var price:Int
    // 品牌
    var brand:String
    // 油量
    var petrol:Int
    // 修改了属性的值，需要用mutating修饰
    mutating func drive(){
        if petrol>0 {
            petrol -= 10
            print("drive 10 milo")
        }
    }
    mutating func addPetrol(_ petrol:Int){
        self.petrol += petrol
        print("加了10单位的油")
    }
}

// 架构体的构造方法一定包含声明的变量
var car = Car(price: 10,brand: "宝马",petrol: 100)
//car.addPetrol(10)

for _ in 0...100{
    if car.petrol==0 {
        car.addPetrol(10)
    }else{
        car.drive()
    }
}

// 结构体为值类型，赋值时是指传递，会再复制一份内存空间
var car1 = car
car1.price = 10000
print(car)// Car(price: 10, brand: "宝马", petrol: 10)
print(car1)// Car(price: 10000, brand: "宝马", petrol: 10)


// 类
class ClassCar {
    var price:Int
    var brand:String="大众"
    var petrol:Int=100
    
    // 要初始化没有赋值的变量
    init(price:Int) {
        self.price = price
    }
    func drive(){
        if petrol>0{
            petrol -= 1
        }else{
            print("drive 10 milo")
        }
    }
}

var cCar = ClassCar(price: 10001)
print(cCar.price)

// 引用类型，赋值后两个的brand值是一样的
var c = cCar
c.brand = "宝马"
print(cCar.brand)// 宝马
print(c.brand)// 宝马

// 继承
class Transportation{
    var petrol:Int = 0
    func drive(){
        if petrol==0 {
            self.addPetrol()
        }
    }
    // final 修饰的属性，方法和类 不能被重写
    final func addPetrol(){
        petrol += 10
    }
}

class CarE :Transportation {
    override func drive() {
        super.drive()
        print("开车 \(self.petrol)")
    }
    
}

var care = CarE()
care.drive()// 开车
print(care.petrol)// 10，因为执行了addPetrol()加了10

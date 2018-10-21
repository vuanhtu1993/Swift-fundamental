![](./IOS_fund.png?raw=true)
## Learning IOS road map
* How to navigate Xcode & Interface Builder
* Building to Devices
* Uploading an App to the App Store
* UIKit (ok)
* Auto Layout 
* Understanding of Model-View-Controller & OOP
* Debugging Apps in Xcode
* Using the Instruments tool
* Using / Combining XIB’s, UIStoryboard, Segues and various presentation/transition techniques
* Persisting data with Core Data (Realm is a good option too, but not stock iOS)
* All about UITableView
* All about UICollectionView
* Parsing JSON into usable data in apps
* NotificationCenter & Notifications
* Delegates & Protocols
* Interacting with RESTful APIs
* Git or another method of version control
* Understanding of DRY Principle
* Multi-Threading
* Unit Testing with XCTest
* Using AutoLayout Size Classes to build great experiences for both iPhone and iPad
 
Type Casting:
    - Là cách để kiêmr tra kiểu của instance 
    - Type casting in Swift is implemented with the is and as operators
    - You can also use type casting to check whether a type conforms to a protocol 


### What is closure?
>Closure expressions: là closures không có tên được viết dưới dạng giản lược syntax và có thể “capture” các giá trị từ các bối cảnh xung quanh
```swift
// Khai bao closure
var add: (Int, Int) -> Int = {_,_ in return 0}

// Thuc hien gan gia tri vao bien
add = {(a: Int, b: Int) -> Int in
    a + b
}
// Goi ham
print(add(1, 1))

// Gan gia tri theo cach gắn gọn hơn vì khi khai báo closure đã dịnh nghĩa kiểu đầu vào, đầu ra
add = { (a, b) in
    a + b
}
// Goi ham
add (1, 2)
```
#### Ứng dụng của closure
1. Callback
```swift
// Khai bao mot phương thức chứa callback như sorted(by: )
// Khai bao ham chua callback
// Call back ở đây chỉ là phân dạng hàm (kiểu hàm như thế nào chứ ko có logic)
func dynamicFunction(a: Int, b: Int, callback: (Int, Int) -> Int) -> Int {
    return callback(a, b)
}
// Khai bao callback
func add(a: Int, b: Int) -> Int {
    return a + b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}
// Thuc thi ham
dynamicFunction(a: 10, b: 30, callback: add)

dynamicFunction(a: 10, b: 30, callback: multiply)

// Ứng dụng closure vao callback
// Không cần khai báo callback

dynamicFunction(a: 1, b: 2, callback: {(a, b) in return a * b})
```
2. Truyến dữ liệu giữa thằng class cha với class con
```swift
class Cha {
    var con = Con()
    func khoitao() {
        con.closure = { data in print(data) }
    }
}

class Con {
    var closure: (String) -> () = {_ in}
    var data: String = "Du lieu"
    func triggerClosure() {
        closure(data)
    }
}

let cha = Cha()
cha.khoitao()
cha.con.triggerClosure()
```

> Closures are self-contained blocks of functinality that can be PASSED around and USED in your code

1. -> Closure is a 1st class Object

> Closures can CAPTURE and STORE REFERENCES to any constants and variables from the CONTEXT which they ayre defined

2. -> by reference mean not value, means, If we change any thing inside the closure, the object outsite the closure will also be affected

> Closures are Reference Types

3. -> If I assign a cloure to two var, they actually refer to the same closure

### Escape vs Non-Escaping
>escape: mean the close will be STORED somewhere to execute later (and of course, its context also being STORED and this is >the main reason cause retain cycles). Usually meet as api call
```swift
DispatchQueue.main.async {
  ...
}
```
> non-escape: the close will be execute and return immediately, not being store, this is the trivia case
> Usually meet when use a function in a collection:
```swift
[1,2,3].forEach { number in
  ...
}
// If a closure is a property, It's auto escaping

// declare a callback being call a user is picked
var onUserPick: ((_ user: User) -> Void)?
```

### Delegate in swift
// Delegate
``` swift
protocol FirstVCDelegate {
    func notify(data: String)
}
// Thằng uỷ quyền
class FirstVC {
    var delegate: FirstVCDelegate?
}
// Thằng được uỷ quyền
class SecondVC: FirstVCDelegate {
    func notify(data: String) {
        print("SecondVC being notify \(data)")
    }
}
```
```swift
// Khởi tạo
let firstVC = FirstVC()
let secondVC = SecondVC()
// Uỷ quyền
firstVC.delegate = secondVC

// Thực hiện phương thức được uỷ quyền
firstVC.delegate?.notify(data: "Happy woman day")
```

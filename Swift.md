![](./IOS_fund.png?raw=true)
## Learning IOS road map
* How to navigate Xcode & Interface Builder
* Building to Devices
* Uploading an App to the App Store
* UIKit (ok)
* Auto Layout (ok)
* Understanding of Model-View-Controller & OOP (ok)
* Debugging Apps in Xcode (thinking)
* Using the Instruments tool
* Using / Combining XIB’s, UIStoryboard, Segues and various presentation/transition techniques (a lot of difficulty things)
* Persisting data with Core Data (Realm is a good option too, but not stock iOS) (——— not using in this project ———)
* All about UITableView (Studying in this section)
* All about UICollectionView (in 2 days)
* Parsing JSON into usable data in apps (thinking)
* NotificationCenter & Notifications (thinking)
* Delegates & Protocols ( WTF )
* Interacting with RESTful APIs (ok)
* Git or another method of version control (ok)
* Understanding of DRY Principle (thinking)
* Multi-Threading (thinking)
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

### Casting type as Protocol
```swift
protocol IInputIncomeInformationCell {
    func setHeader(_ header: String)
    func setValue(_ value: String?)
}

class Cell1: IInputIncomeInformationCell {
    func setHeader(_ header: String) {
        
    }
    
    func setValue(_ value: String?) {
        
    }
}

class Cell2 {
    
}

var cell = Cell2()

if let customCell = cell as? IInputIncomeInformationCell {
    customCell.setHeader("String header")
} else {
    //
}

```

### Example for enum
```swift
enum InputIncomeJobRowIndex: Int {
    case netIncome = 0, expense = 1, currentJob = 2
    case startFrom = 3, jobLevel = 4, company = 5
}

InputIncomeJobRowIndex(rawValue: 0) // netIncome
type(of: InputIncomeJobRowIndex(rawValue: 0))
//Optional<__lldb_expr_5.InputIncomeJobRowIndex>.Type

func valueForJobSection(row: InputIncomeJobRowIndex) {
    switch row {
    case .company:
        print("Company")
    default:
        print("Default")
    }
}

valueForJobSection(row: InputIncomeJobRowIndex(rawValue: 0)!) //"Default\n"
```
### Example for Enum
```swift
enum ValidationType {
    case email
    case password
}

enum Alert {
    case success
    case error
    case failure
}

enum Valid {
    case success
    case error(alert: Alert, message: Message)
}

enum Message: String {
    case passwordError = "Error password"
    case emailError =  "Error email"
    case empty = "The text field is empty"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum Regex: String {
    case regexEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case regexPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
}



class Validation {
    static let shared = Validation()
    
    private init(){}
    
    func checkValidation(type: ValidationType, value: String) -> Valid {
        switch type {
        case .email:
            if let result = validateString(input: value, regex: .regexEmail, emptyAlert: Message.empty, invalidAlert: Message.emailError) {
                return result
            }
        case .password:
            if let result = validateString(input: value, regex: .regexPassword, emptyAlert: Message.empty, invalidAlert: Message.passwordError) {
                return result
            }
        }
        return .success
    }
    
    func validateString(input: String, regex: Regex, emptyAlert: Message, invalidAlert: Message) -> Valid? {
        if input.isEmpty {
            return .error(alert: .error, message: emptyAlert)
        } else if isValidRegEx(testStr: input, regex: regex) != true {
            return .error(alert: .error, message: invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx( testStr: String, regex: Regex) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

```

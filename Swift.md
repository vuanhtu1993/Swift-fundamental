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


## 1.  Value Types and Reference Types
![](./valueType.png?raw=true)

> Value types: Là kiểu dữ liệu tham trị, các ínstance của kiểu dữ liệu này sẽ đc lưu trong stack. CPU tự động quẩn lí stack, nếu biến là kiểu dữ liệu tham trị nào không được dùng sẽ tự động destroy

> Reference Types: Là kiểu dữ liệu tham chiếu, các instance được lưu trong heap. 

*  Phân biệt stack and heap
 1. Stack: Là vùng nhớ trong RAM được quản lí chắt chẽ (tightly management) bới CPU. Ví dụ như như biến được khai báo trong function, sau khi function execute thì biến đó sẽ bị destroy
 
 2. Heap: Là vùng nhớ lưu trữ các instance của kiểu dữ liệu tham chiếu. Vùng nhớ naỳ không tự động destroy object giống như stack. ARC là job của apple phát triển cho các ứng dụng applr nhằm quản lí vùng nhớ này

> ARC cơ bản nghia là: Nếu một object không có tham chiếu nào đến nó hoăcj chỉ có tham chiếu yếu đến nó thì nó sẽ bị 
## 2. What is closure?
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
2. Truyến dữ liệu giữa thằng class cha với class con (đã kiểm chứng là đúng)
* Hiểu đơn giàn là: thằng con có hàm `triggerClosure` nhưng tại nội tại của nó lại không thực thi được việc gì cả, mà muốn truyền một function khác vào trong thân của `closure` và thực thi bên trong ``
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

#### Các kiểu triển khai closure:
> Coding
```swift
// Normal
var closure: (String) -> String = { a in
    return a + "123"
}

// Inferred type
var closureInfferred = { (a: String) -> String in
   return a + "123"
}
// Short hand
var superShortClosure: (Int, Int) -> Int = {$0 + $1}
```

> Trên View
```swift
// Function
func superView() -> UIView {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
    view.backgroundColor = UIColor.orange
    return view
}
// Closure
var superView2 = { () -> UIView in
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
    view.backgroundColor = UIColor.red
    return view
}
// Lazy var ios
var superView3: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
    view.backgroundColor = UIColor.blue
    return view
}()
```

### 2. Escape vs Non-Escaping
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

### 3. Delegate in swift
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
// Example 2
```
class Cha: ConDelegate {
    var con = Con()
    init() {
        con.delegate = self
    }
    func notify() {
        print("Con vua thong bao")
    }
}

protocol ConDelegate: class {
    func notify()
}

class Con {
    weak var delegate: ConDelegate?
    
    func triggerDelegate() {
        delegate?.notify()
    }
}

var cha = Cha()
cha.con.triggerDelegate()
```

### 4. Casting type as Protocol
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

## 5. Example for enum
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
### Example 2 for Enum
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

### 6. Example for CallBack
```swift
func horMirror(_ s: String) -> String {
    let arrayString = s.components(separatedBy: "\n").reversed().joined(separator: "\n")
    return arrayString
}

func vertMirror(_ s: String) -> String {
    var arrayString = s.components(separatedBy: "\n")
    arrayString = arrayString.map({ (word) in
        return String(word.reversed())
    })
    return arrayString.joined(separator: "\n")
}

// replace the dots with function parameter
func oper(_ cb: (String) -> String, _ s: String) -> String {
    return cb(s)
}
```

## 7. Create Table View Programing
* Bước 1: Tạo UITableView
```swift
  import UIKit

class MainTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .grouped)
        
        // delegate
        self.delegate = self
        self.dataSource = self
        
        // autolayout for tableview
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Register cell
        register(CustomCellByPrograming.self, forCellReuseIdentifier: "CellID")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! CustomCellByPrograming
        return cell
    }
    
}
```
* Bước 2: Tạo Custom Cell
```swift
import UIKit

class CustomCellByPrograming: UITableViewCell {
    
    // Cell element
    lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example"
        return label
    }()
    
    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.orange
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "CellID")
        
        // Setup view cell (bản chất là constrain)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        // Constraint for whole cell
//        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        contentView.frame = contentView.view.inset(by: margins)
        
        // Constraint for image
        contentView.backgroundColor = UIColor.blue
        contentView.addSubview(cellImage)
        cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cellImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Constraint for label
        contentView.addSubview(cellLabel)
        cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}

```
* Bước 3: Sử dung thôi (Sử dụng ở bất kì UIViewController )
```swift
import UIKit

class TableByProgramingViewController: UIViewController {
    
    let tableView = MainTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        // Constrainst
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}
```

## 8. Gradient
```swift
func addGradientView() {
        gradientView.layer.shadowOffset = CGSize(width: 0, height: 15)
        gradientView.layer.shadowColor = UIColor(red:0.5, green:0.53, blue:0.59, alpha:0.62).cgColor
        gradientView.layer.shadowOpacity = 1
        gradientView.layer.shadowRadius = 28
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor(red:0.08, green:0.72, blue:0.82, alpha:1).cgColor,
            UIColor(red:0.45, green:0.44, blue:0.89, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 1, y: 0.58)
        gradient.endPoint = CGPoint(x: 0, y: 0.58)
        
        gradientView.layer.addSublayer(gradient)
    }
```

## 9. Border Shadow IOS
```swift
let container = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
container.backgroundColor = UIColor.white

let viewShadow = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
viewShadow.backgroundColor = UIColor.yellow
viewShadow.layer.shadowColor = UIColor.black.cgColor
viewShadow.layer.shadowOpacity = 0.5
viewShadow.layer.shadowOffset = CGSize.zero
viewShadow.layer.shadowRadius = 20

viewShadow.center = container.center
container.addSubview(viewShadow)
```

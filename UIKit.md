### 1. Khởi tạo UIViewController
> Bước 1: Khởi tạo ÚIStoryboard
> Bước 2: Khởi tạo View
#### Push VỉewController

```swift
 if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsVCID") as? NewsDetailsViewController {
 
        if let navigator = navigationController {
            navigator.pushViewController(viewController, animated: true)
        }
    }
```

#### Present VỉewController
```swift
 if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsVCID") as NewsDetailsViewController
     {
    present(vc, animated: true, completion: nil)
    }

```
#### Khởi tạo riêng
```swift
extension TodoViewController {
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    static func createViewController() -> TodoViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "TodoViewController") as! TodoViewController
        
        return view
    }
}
```

### 2. Khởi tạo BaseViewController
> Một baseViewController chứa NavigationBar, NavigationItem và một số thành phần để xử lí VỉewController
 * BaseViewController được viết bằng code nhưng các VC tạo bằng Xib khác vẫn có thể kế thừa 
 
 #### Handle navigationController
 * Lưu ý: mỗi VC đều đã có một Navigation (NavigationController + NavigationItem)
 
```swift
// Closure
var homeBackCancelClosure : () -> () = {}

// Tạo Bar Button 
lazy var home: UIBarButtonItem = {
        let homeButton = UIBarButtonItem(image: UIImage(named: "ic_home"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(homeBackCancel))
        return homeButton
    }()
// Function
@objc func homeBackCancel() {
        // Cho vào một closure se có thể sử dụng được thằng subView của BVC
        homeBackCancelClosure()
    }
    
// ADD Bar Button vào Navigation
func navigationBarWithHome(title: String, prefersLargeTitles: Bool = false) {
        self.navigationItem.leftBarButtonItem = home
    }
```
### 3. Count down Timer
```swift
class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!

    var countdownTimer: Timer!
    var totalTime = 60


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"

        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }

    func endTimer() {
        countdownTimer.invalidate()
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }


    @IBAction func startTimerPressed(_ sender: UIButton) {
        startTimer()
    }

}
```
### 4. Extension String
```swift
   extension String {
       var html2AttStr: NSAttributedString? {
           return try? NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
       }
   }

   let attributeText = "<style type=\"text/css\">#red{color:#F00}#green{color:#0F0}#blue{color: #00F; font-weight: Bold; font-size: 32}</style><span id=\"red\" >Red,</span><span id=\"green\" > Green </span><span id=\"blue\">and Blue</span>".html2AttStr

   let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
   label.attributedText = attributeText
```
### 5. Xây dựng một component trong Swift 4
- Có lẽ bây giờ là thời kì của front-end theo hướng component, tất cả các front-end framework tốt nhất bây giờ như ReactJs, React Native, Angular, VueJS đều có khái niệm component như là nền tảng cơ bản để xây dựng lên một dự án. Tôi cũng tiếp cận IOS theo hướng như vậy nhưng mọi chuyện lại không như mình tưởng :(
- Trong lập trình IOS component không phải là một khái niệm quen thuộc, ở đây người ta dùng kéo thả (cũng có khi dùng code nhưng không nhiều) để thực hiện một vùng hiển thị nên việc vẽ view rất nhanh và nếu có sự lặp đi lặp lại của một vùng hiển thị thì đã có TableView và reuse Cell thành thánh, đâu đâu cùng cell dù cho việc handle logic cho Cell thì không hề đơn giản (dùng delegate cho cell để handle logic trong cell, cũng có khi dùng callback (Javascript nhà em) - Trong IOS gọi thằng naỳ là Closure)
![](./ComponentUI.png?raw=true)
- Sau đây mình sẽ trình bày mộtví dụ để minh hoạ cho so sánh phía trên sẽ dễ hiểu hơn

### 6. Call API trong swift (Giai đoạn đau khổ nhẩt khi học swift)
- Khác với JS, việc call API trong `Swift` yêu cầu phải nắm đươc 3 kĩ năng sau:
 * 1. Phương thức get (đón response - đơn giản nhất)
 Mặc dù là đơn giản nhất nhưng mà rất khác với JS là ta phải tạo một model để đón được dữ liệu từ API về. Response từ API là kiểu [String: Any], tiến hành parse dữ liệu từ data trong response -> Model
 ```swift
import Alamofire
import SwiftJSON

class ResponseData {
    var id: String?
    var value: Int?
    
    init(json: JSON) {
        // Dữ liệu cuối cùng để lấy
        self.id = json["id"].string
        self.value = json["value"].int
    }
}

func testGetAPI(completion: @escaping (_ error: Error?, _ value: [ResponseData]) -> ()) {
    let url = "url here"
    Alamofire.request(url,
                      method: .put,
                      encoding: JSONEncoding.default,
                      headers: Constants.header)
        .responseJSON{ response in
            print("API RESPONSE:\n" + response.debugDescription)
            switch response.result {
            case .success(let val):
                if (response.response?.statusCode)! < 400 {
                    if let data = val as? [String: Any] {
                        // Phụ thuộc vào kiểu tra về của response nhưng thông thuong sẽ có "data" và "message"
                        let responseDatas = [ResponseData]()
                        if let data = JSON(data)["data"].array {
                            for item in data {
                                responseDatas.append(item)
                            }
                        }
                    }
                } else {
                    let error = NSError(domain: url, code: -1000, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Unknowed Error", value: "An unknown error has occurred", comment: "")])
                    completion(error, nil)
                }
            case .failure(_):
                let error = NSError(domain: url, code: -1000, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Unknowed Error", value: "Request time out", comment: "")])
                completion(error, nil)
            }
    }
}

 ```
 * 2. Phương thức post put ... truyền cả [String: Any] as body và nhận data
 ```swift
 import Alamofire
import SwiftJSON

class ResponseData {
    var id: String?
    var value: Int?
    // Init đế parse Json
    init(json: JSON) {
        // Dữ liệu cuối cùng để lấy
        self.id = json["id"].string
        self.value = json["value"].int
    }
}

class BodyData {
    var userProfile: String?
    var address: String?
    
    //Tao [String: Any] Phải phụ thuộc vào body và back-end quy định
    func collectParams() -> [String: Any] {
        return [
            "data": [
                "userProfile": userProfile,
                "address": address
            ]
        ]
    }
}

func inputIncomeAPI(param: [String: Any], completion: @escaping (_ error: Error?, _ value: [ResponseData]) -> ()) {
    let url = "url here"
    Alamofire.request(url,
                      method: .put,
                      encoding: JSONEncoding.default,
                      // Param này chính là cái truyền vào từ class BodyData
                      parameters: param,
                      headers: Constants.header)
        .responseJSON{ response in
            print("API RESPONSE:\n" + response.debugDescription)
            switch response.result {
            case .success(let val):
                if (response.response?.statusCode)! < 400 {
                    if let data = val as? [String: Any] {
                        // Phụ thuộc vào kiểu tra về của response nhưng thông thuong sẽ có "data" và "message"
                        let responseDatas = [ResponseData]()
                        if let data = JSON(data)["data"].array {
                            for item in data {
                                responseDatas.append(item)
                            }
                        }
                    }
                } else {
                    let error = NSError(domain: url, code: -1000, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Unknowed Error", value: "An unknown error has occurred", comment: "")])
                    completion(error, nil)
                }
            case .failure(_):
                let error = NSError(domain: url, code: -1000, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Unknowed Error", value: "Request time out", comment: "")])
                completion(error, nil)
            }
    }
}
 ```
 * 3. Phương thức post put ... nhưng sẽ tạo body data ở ngay trong func call API
 ```swift
 func inputIncomeAPI(id: String?, completion: @escaping (_ error: Error?, _ value: [ResponseData]) -> ()) {
    let url = "url here"
    let param: [String: Any] = [:]
    if let id = id {
        param["id"] = id
    }
    Alamofire.request(url,
                      method: .put,
                      encoding: JSONEncoding.default,
                      // Data này chính là cái truyền vào ơ class BodyData
                      parameters: param,
                      headers: Constants.header)
        .responseJSON{ response in
            print("API RESPONSE:\n" + response.debugDescription)
            switch response.result {
            case .success(let val):
                if (response.response?.statusCode)! < 400 {
                    if let data = val as? [String: Any] {
                        // Phụ thuộc vào kiểu tra về của response nhưng thông thuong sẽ có "data" và "message"
                        let responseDatas = [ResponseData]()
                        if let data = JSON(data)["data"].array {
                            for item in data {
                                responseDatas.append(item)
                            }
                        }
                    }
                } else {
                    let error = NSError(domain: url, code: -1000, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Unknowed Error", value: "An unknown error has occurred", comment: "")])
                    completion(error, nil)
                }
            case .failure(_):
                let error = NSError(domain: url, code: -1000, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Unknowed Error", value: "Request time out", comment: "")])
                completion(error, nil)
            }
    }
}
 ```

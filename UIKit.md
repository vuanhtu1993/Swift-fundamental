## 1. Khởi tạo UIViewController
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

## 2. Khởi tạo BaseViewController
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

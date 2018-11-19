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

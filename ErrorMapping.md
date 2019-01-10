#### 1. Type of expression is ambiguous without more context
Lỗi này xẩy ra khi Object mới được khởi tạo bị thiếu tham số (trường) cần thiết để khởi tạo object 
```swift
struct Photo: Codable
{
    //String, URL, Bool and Date conform to Codable.
    var title: String
    var url: URL
    var isSample: Bool
    
    //The Dictionary is of type [String:String] and String already conforms to Codable.
    var metaData: [String:String]
    
    //PhotoType and Size are also Codable types
    var type: PhotoType
    var size: Size
}

struct Size: Codable
{
    var height: Double
    var width: Double
}

enum PhotoType: String, Codable
{
    case flower
    case animal
    case fruit
    case vegetable
}

let photoObject = Photo(title: "Hibiscus", url: URL(string: "https://www.flowers.com/hibiscus")!, isSample: false, metaData: ["color" : "red"], type: .flower)

```
* Nhận thấy Photo(...) đang thiếu trường `size`

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

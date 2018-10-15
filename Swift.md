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
non-escape: the close will be execute and return immediately, not being store, this is the trivia case. Usually meet when use a function in a collection:

[1,2,3].forEach { number in
  ...
}
If a closure is a property, It's auto escaping

// declare a callback being call a user is picked
var onUserPick: ((_ user: User) -> Void)?
```

# tryOptional

An optionals extension to unwrap a value using `try catch`.

### Using
You can use a custom operator `??`

```swift
//Optional contains value
var a: Int? = 5

do {
    let b = try ??a
    print(b)
} catch let error {
    print(error)
}
```
*prints: 5*

```swift
//Optional contains nil: Wrapped type is printed
a = nil

do {
    let b = try ??a
    print(b)
} catch let error {
    print(error)
}
```

*prints: Nil returned for optional of type: Int*

or an `unwrap` method directly, which also prints file and line where the error occurs

```swift
//Optional contains nil: file+line printed
do {
    let b = try a.unwrap()
    print(b)
} catch let error {
    print(error)
}
```

*prints: Nil returned for optional of type: Int at tryOptionalPlayground.playground line: 25*
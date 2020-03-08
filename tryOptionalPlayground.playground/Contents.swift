import UIKit

//Optional contains value
var a: Int? = 5

do {
    let b = try ??a
    print(b)
} catch let error {
    print(error)
}

//Optional contains nil: Wrapped type is printed
a = nil

do {
    let b = try ??a
    print(b)
} catch let error {
    print(error)
}

//Optional contains nil: file+line printed
do {
    let b = try a.unwrap()
    print(b)
} catch let error {
    print(error)
}

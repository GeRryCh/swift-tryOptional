//
//  tryOptional.swift
//
//  Created by German Velibekov on 06/02/2020.
//  Copyright © 2020 German Velibekov. All rights reserved.
//

import Foundation

fileprivate struct NilOptionalError<T>: Error, CustomStringConvertible {
    let _description: String
    
    init(optional: Optional<T>) {
        _description = "Nil returned for optional of type: \(T.self)"
    }
    
    init(optional: Optional<T>, file: String, line: Int) {
        _description = "Nil returned for optional of type: \(T.self) at \(file) line: \(line)"
    }
    
    var description: String {
        return _description
    }
}

prefix operator ??

public extension Optional {
    func unwrap(file: String = #file,
                line: Int = #line) throws -> Wrapped {
        guard let unwrapped = self else {
            throw NilOptionalError(optional: self,
                                   file: file,
                                   line: line)
        }
        return unwrapped
    }
    
    static prefix func ?? (optional: Optional) throws -> Wrapped {
        guard let unwrapped = optional else {
            throw NilOptionalError(optional: optional)
        }
        return unwrapped
    }
}

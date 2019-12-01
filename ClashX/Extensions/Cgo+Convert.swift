//
//  Cgo+Convert.swift
//  ClashX
//
//  Created by yicheng on 2019/10/2.
//  Copyright © 2019 west2online. All rights reserved.
//

extension String {
    func goStringBuffer() -> UnsafeMutablePointer<Int8> {
        if let pointer = (self as NSString)
            .cString(using: String.defaultCStringEncoding.rawValue) {
            return UnsafeMutablePointer(mutating: pointer)
        }
        Logger.log("Convert goStringBuffer Fail!!!!", level: .error)
        let p = ("" as NSString).cString(using: String.defaultCStringEncoding.rawValue)!
        return UnsafeMutablePointer(mutating: p)
    }
}

extension UnsafeMutablePointer where Pointee == Int8 {
    func toString() -> String {
        return String(cString: self)
    }
}

extension Bool {
    func goObject() -> GoUint8 {
        return self == true ? 1 : 0
    }
}

//
//  InputRequirement.swift
//  Maritime
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//

import Foundation
import ObjectiveC

public protocol InputsRequirement {
    var inputs: [String: Any] { set get }
}

private var inputsAssociatedObjectHandle: UInt8 = 0
extension UIViewController: InputsRequirement {
    public var inputs: [String : Any] {
        get {
            return objc_getAssociatedObject(self, &inputsAssociatedObjectHandle) as! [String: Any]
        }
        set(newValue) {
            objc_setAssociatedObject(self, &inputsAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

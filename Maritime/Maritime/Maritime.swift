//
//  Maritime.swift
//  Maritime
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//

import Foundation
import ObjectiveC

public protocol Navigator {
    associatedtype T
    var viewController: UIViewController { get }
}

public protocol Navigatable {
    associatedtype T: Navigator
    func navigate(navigator: T)
}

public class Maritime {
    
    static public func configure() {
        let path = Bundle.main.path(forResource: "SiteMap", ofType: "plist")
        let dictioanry = NSDictionary(contentsOfFile: path!)
        dictioanry?.allKeys.forEach({ (key) in
            let value = dictioanry![key]
            if let dictionaryForKey = value as? Dictionary<String, Any> {
                let `class` = dictionaryForKey["class"]
                let canNavigateTo = dictionaryForKey["canNavigateTo"]
                // generate Maritime SiteMap
                print(`class`)
                print(canNavigateTo)
            }
        })
        
    }
}

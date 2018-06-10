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
    func passData(to destination: UIViewController)
}

public protocol Navigatable {
    associatedtype T: Navigator
    func navigate(navigator: T)
}

public class Maritime {
    
    private static let shared = Maritime()
    
    static public func configure() {
        shared.parseSiteMapTypes()
        print("\n\n")
        shared.parseSiteMap()
    }
    
    func parseSiteMap() {
        let path = Bundle.main.path(forResource: "SiteMap", ofType: "plist")
        let dictioanry = NSDictionary(contentsOfFile: path!)
        dictioanry?.allKeys.forEach({ (key) in
            let value = dictioanry![key]
            if let dictionaryForKey = value as? Dictionary<String, Any> {
                let canNavigateTo = dictionaryForKey["canNavigateTo"] as? Dictionary<String, Any>
                // generate Maritime SiteMap swift file
                // validate canNavigateTo parameters
                print(key)
                
                // validate Type is exists
                // validate if style is applicable
                // navigate
                //      if navigation controller presented otherwise, present,
                // present,
                // segue,
                // auto
                //      check if there are a segue otherwise, auto select navigate or present                   if there are a navigation controller or not
                if let type = canNavigateTo?["type"],
                    let style = canNavigateTo?["style"] {
                    print("canNavigateTo : \(type) with style: \(style)")
                }
            }
        })
    }
    
    func parseSiteMapTypes() {
        let path = Bundle.main.path(forResource: "SiteMapTypes", ofType: "plist")
        let dictioanry = NSDictionary(contentsOfFile: path!)
        dictioanry?.allKeys.forEach({ (key) in
            let value = dictioanry![key]
            if let dictionaryForKey = value as? Dictionary<String, Any> {
                let `class` = dictionaryForKey["class"]
                let inputs = dictionaryForKey["inputs"]
                // generate Maritime SiteMap swift file
                print(key)
                // validate if class is exists
                // validate inputs types (custom or Foundation types)
                print("class: \(`class` ?? "No Class Found")")
                print("inputs: \(inputs ?? "No Inputs Found")")
            }
        })
    }
    
    
}

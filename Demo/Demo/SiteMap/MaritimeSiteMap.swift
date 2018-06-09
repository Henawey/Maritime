//
//  Maritime.swift
//  Demo
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//
import Maritime

enum LoginNavigator: Navigator {
    
    typealias T = LoginNavigator
    
    case home(inputs: [String: Any])
    
    var viewController: UIViewController {
        switch self {
        case .home(let inputs):
            let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController")
            
            viewController.inputs = inputs
            
            return viewController
        }
    }
}

extension LoginViewController: Navigatable {
    
    typealias T = LoginNavigator
    
    func navigate(navigator: LoginNavigator) {
        if let navigationController = navigationController {
            navigationController.pushViewController(navigator.viewController, animated: true)
        } else {
            present(navigator.viewController, animated: true, completion: nil)
        }
    }
    
}

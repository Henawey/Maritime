//
//  Maritime.swift
//  Demo
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//
import Maritime
import ObjectiveC

// MARK: LoginViewController
enum LoginNavigator: Navigator {
    
    case home(username: String)
    
    fileprivate var destination: UIViewController {
        switch self {
        case .home:
            let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            return viewController
        }
    }
    
    func passData(to destination: UIViewController) {
        switch self {
        case .home(let username):
            if let destination = destination as? HomeViewController {
                destination.username = username
            }
        }
    }
    
}

extension LoginViewController: Navigatable {
    
    typealias T = LoginNavigator
    
    func navigate(navigator: T) {
        
        //// segue
        performSegue(withIdentifier: "showHome", sender: navigator)
        // FIXME: get destination without override prepareSegue
        // user has to call
        // navigator.passData(to: navigator.destination) in prepareSegue
        
        //// navigate
        //        navigator.passData(to: navigator.destination)
        
        //        if let navigationController = navigationController {
        //            navigationController.pushViewController(navigator.viewController, animated: true)
        //        } else {
        //            present(navigator.viewController, animated: true, completion: nil)
        //        }
        
        //// present
        //        navigator.passData(to: navigator.destination)
        //        present(navigator.viewController, animated: true, completion: nil)
    }
}

// MARK: HomeViewController
private struct AssociatedKeys {
    static var usernameAssociatedObjectHandle: UInt8 = 0
}

extension HomeViewController {
    public var username: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.usernameAssociatedObjectHandle) as! String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.usernameAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

//
//  MaritimeAppMap3.swift
//  Demo
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//
import Maritime
import ObjectiveC

// MARK: LoginViewController - Navigation
// Navigation Map
enum HomeNavigator: Navigator {
    
    case dataReceiver(dataPassedFromHomeScreen: String)
    
    fileprivate var destination: UIViewController {
        switch self {
        case .dataReceiver:
            let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DataReceiverViewController") as! DataReceiverViewController
            return viewController
        }
    }
    
    func passData(to destination: UIViewController) {
        switch self {
        case .dataReceiver(let dataPassedFromHomeScreen):
            if let destination = destination as? DataReceiverViewController {
                let dataReceiver = destination.dataReceiver
                dataReceiver?.dataPassedFromHomeScreen = dataPassedFromHomeScreen
            }
        }
    }
    
}
// Navigation Action
extension HomeViewController: Navigatable {
    
    typealias T = HomeNavigator
    
    func navigate(navigator: T) {
        
        switch navigator {
        case .dataReceiver:
            // TODO: check style of navigation 
            //// segue
            // performSegue(withIdentifier: "showDataReceiver", sender: navigator)
            // user has to call
            // navigator.passData(to: segue.destination) in prepareSegue
            
            // navigate
            let destination = navigator.destination
            navigator.passData(to: destination)
            
            if let navigationController = navigationController {
                navigationController.pushViewController(destination, animated: true)
            } else {
                present(destination, animated: true, completion: nil)
            }
            
            //// force present
            //        let destination = navigator.destination
            //        navigator.passData(to: destination)
            //        present(destination, animated: true, completion: nil)
        }
    }
}

// MARK: DataReceiverViewController Navigation
// Navigation Map
enum DataReceiverNavigator: Navigator {
    case customDataReceiver(selectedItemTitle: String)
    
    func passData(to destination: UIViewController) {
        switch self {
        case .customDataReceiver(let selectedItemTitle):
            if let destination = destination as? CustomDataReceiverViewController {
                var dataReceiver = destination.dataReceiver
                dataReceiver?.selectedItemTitle = selectedItemTitle
            }
        }
    }
}

// Navigation Action
extension DataReceiverViewController: Navigatable {
    typealias T = DataReceiverNavigator
    
    func navigate(navigator: T) {
        switch navigator {
        case .customDataReceiver:
            performSegue(withIdentifier: "showCustomDataReceiver", sender: navigator)
        }
    }
}

// MARK: DataReceiverViewController Data Passing
// Data Reciever Configuration
extension DataReceiverViewController: DataContract {
    typealias DataReceiver = DataReceiverViewController
    
    var dataReceiver: DataReceiverViewController? {
        return self
    }
}

// Data Injection
private struct DataReceiverAssociatedKeys {
    static var dataPassedFromHomeScreenAssociatedObjectHandle: UInt8 = 0
}

extension DataReceiverViewController {
    public var dataPassedFromHomeScreen: String {
        get {
            return objc_getAssociatedObject(self, &DataReceiverAssociatedKeys.dataPassedFromHomeScreenAssociatedObjectHandle) as! String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &DataReceiverAssociatedKeys.dataPassedFromHomeScreenAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// MARK: CustomDataReceiverViewController - Data Passing
// Data Reciever Configuration
extension CustomDataReceiverViewController: DataContract {
    typealias DataReceiver = CustomDataReceiverBusinessLogic
    
    // it got mapped from dataReceiver.instance
    // if there is not dataReceiver.instance it will create new object
    var dataReceiver: CustomDataReceiverBusinessLogic? {
        return interactor
    }
}

// Data Injection
private struct CustomDataReceiverAssociatedKeys {
    static var selectedItemTitleAssociatedObjectHandle: UInt8 = 0
}

extension CustomDataReceiverBusinessLogic {
    public var selectedItemTitle: String {
        get {
            return objc_getAssociatedObject(self, &CustomDataReceiverAssociatedKeys.selectedItemTitleAssociatedObjectHandle) as! String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &CustomDataReceiverAssociatedKeys.selectedItemTitleAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

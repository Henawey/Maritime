//
//  LoginViewController.swift
//  Demo
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func loginTouchUpInside(_ sender: UIButton) {
        navigate(navigator: .home(username: "userName"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigator = sender as? LoginNavigator {
            navigator.passData(to: segue.destination)
        }
    }
}

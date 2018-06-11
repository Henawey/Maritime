//
//  HomeViewController.swift
//  Demo
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//

import UIKit
import Maritime

class HomeViewController: UIViewController {
    
    @IBAction func loginTouchUpInside(_ sender: UIButton) {
        navigate(navigator: .dataReceiver(dataPassedFromHomeScreen: "Home Data"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigator = sender as AnyObject as? Navigator {
            navigator.passData(to: segue.destination)
        }
    }
}

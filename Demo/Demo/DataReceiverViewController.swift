//
//  HomeViewController.swift
//  Demo
//
//  Created by Ahmed Henawey on 6/9/18.
//  Copyright © 2018 Ahmed Henawey. All rights reserved.
//

import UIKit
import Maritime

class DataReceiverViewController: UIViewController {
    @IBOutlet weak var receivedDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedDataLabel.text = dataPassedFromHomeScreen
    }
    
    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        navigate(navigator: .customDataReceiver(selectedItemTitle: "Data Receiver Data"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigator = sender as AnyObject as? Navigator {
            navigator.passData(to: segue.destination)
        }
    }
}

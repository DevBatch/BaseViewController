//
//  FirstViewController.swift
//  BaseViewController_Example
//
//  Created by DB MAC MINI on 5/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import BaseViewController

class FirstViewController: BaseViewController, BaseViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar("First Screen",  leftButtonType: .back,rightButtonType: .settings)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         self.setDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func rightNavigationBarButtonClicked() {
        print("Right Navigation Button Clicked in ViewController")
    }
    
    func leftNavigationBarButtonClicked() {
        print("Left Navigation Button Clicked in ViewController")
        self.navigationController?.popViewController(animated: true)
    }

}

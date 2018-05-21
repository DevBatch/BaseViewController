//
//  ViewController.swift
//  BaseViewController
//
//  Created by muham/Users/dbmacmini/Desktop/SSS/Podfilemadnayabbutt on 05/14/2018.
//  Copyright (c) 2018 muhammadnayabbutt. All rights reserved.
//

import UIKit
import BaseViewController
class ViewController: BaseViewController, BaseViewControllerDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar("New Screen",  leftButtonText: "Back", rightButtonText: "Next")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setDelegate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func toggleNavigationBarShadow(_ sender: Any) {
        self.hideNavBarShaddow(hide : !(self.navigationController?.navigationBar.value(forKey: "hidesShadow") as! Bool))
    }
    
    
    func rightNavigationBarButtonClicked() {
        print("Right Navigation Button Clicked in ViewController")
        self.performSegue(withIdentifier: "goToFirstVC", sender: nil)
    }
    
    func leftNavigationBarButtonClicked() {
         print("Left Navigation Button Clicked in ViewController")
    }
}


//
//  BaseViewController.swift
//  SocialApp
//
//  Created by DB MAC MINI on 3/29/18.
//  Copyright © 2018 DB MAC MINI. All rights reserved.//


import Foundation
import UIKit



public enum UINavigationBarRightButtonType : Int {
    case none
    case done
    case settings
    case menu
    case text
}

public enum UINavigationBarLeftButtonType : Int {
    case none
    case back
    case menu
    case settings
    case text
    
}

public protocol BaseViewControllerDelegate {
    func rightNavigationBarButtonClicked()
    func leftNavigationBarButtonClicked()
}
open class BaseViewController: UIViewController {
    /**
     The color to be shown while displaying text
     */
    let textColor : UIColor? = UIColor.black
    
    /**
     The font to be shown while displaying text
     */
    let textFont = UIFont.systemFont(ofSize: 18.0)
    
    /**
     Child Class or Class which will inherit this class has to implement this delegate
     */
     var baseDelegate: BaseViewControllerDelegate?
    
    /**
     This is the button which will be used as left button. Its View can be customized
     */
    var leftButton: UIButton?
    var rightButton: UIButton?
    var rightbtnItem: UIBarButtonItem?
    var leftbtnItem:  UIBarButtonItem?
    var leftbtnType:  UINavigationBarLeftButtonType?
    var rightbtnType: UINavigationBarRightButtonType?
    
    public func setDelegate(){
        self.baseDelegate = self as! BaseViewControllerDelegate
    }
    
    /**
     This function is used to customize native Navigation Bar
     - parameter title: The title of Navigation Bar
     - parameter leftButtonType : This enum is used to determine the type of Left Button on Navigation Bar, default is set to text
     - parameter rightButtonType : his enum is used to determine the type of Right Button on Navigation Bar, default is set to text
     - parameter leftButtonText : In case we have to show Text instead of image, then this will be the text that would display on left button
     - parameter rightButtonText : In case we have to show Text instead of image, then this will be the text that would display on right button
     */
   public func setupNavigationBar(_ title: String,  leftButtonType: UINavigationBarLeftButtonType = .text , rightButtonType: UINavigationBarRightButtonType = .text, leftButtonText : String = "", rightButtonText : String = "") {
        self.hideNavigationBar(false)
        self.leftbtnType = leftButtonType
        self.rightbtnType = rightButtonType
        
        if rightButtonType != .none {
            self.rightButton = UIButton.init(type: UIButtonType.custom)
            self.rightButton = UIButton.init(type: UIButtonType.custom)
           
            
            self.rightButton!.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
            self.rightButton!.addTarget(self, action: #selector(BaseViewController.rightNavigationButtonClicked(_:)), for: .touchUpInside)
            
            if rightButtonType == .text {
                self.rightButton!.setTitle(rightButtonText, for: .normal)
                self.rightButton!.setTitleColor(textColor, for: .normal)
                self.rightButton!.titleLabel?.font = textFont
                
            }
            else {
                let menuImage: UIImage? = ((rightButtonType == .settings) ? UIImage(named: "settings") : (rightButtonType == .menu) ? UIImage(named: "menuButton"): nil)
                self.rightButton!.setImage(menuImage, for: .normal)
            }
            
            self.rightbtnItem = UIBarButtonItem(customView: self.rightButton!)
            let negativeSpacer : UIBarButtonItem? = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            
            self.navigationItem.setRightBarButtonItems([negativeSpacer!, rightbtnItem!], animated: false)
            
        }
        
        if leftButtonType != .none {
            self.leftButton = UIButton.init(type: UIButtonType.custom)
            
            self.leftButton!.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
            self.leftButton!.addTarget(self, action: #selector(BaseViewController.leftNavigationButtonClicked(_:)), for: .touchUpInside)
            
            
            if rightButtonType == .text {
                self.leftButton!.setTitle(leftButtonText, for: .normal)
                self.leftButton!.setTitleColor(textColor, for: .normal)
                self.leftButton!.titleLabel?.font = textFont
            }
            else {
                let leftButtonImage: UIImage? = ((leftButtonType == .back) ? UIImage(named: "backButton") : (leftButtonType == .menu) ? UIImage(named: "menuButton") : (leftButtonType == .settings) ? UIImage(named: "settings") : nil)
                 self.leftButton!.setImage(leftButtonImage, for: .normal)
            }

           
            self.leftbtnItem = UIBarButtonItem(customView: self.leftButton!)
            
            let negativeSpacer : UIBarButtonItem? = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            self.navigationItem.setLeftBarButtonItems([negativeSpacer!, self.leftbtnItem!], animated: false)
            
        }
        

        if title.count > 0 {
            
            self.setNavigationBarTitle(title : title)
        }
    }
    /**
     This function is used to set only Title in Navigation Bar
     - parameter title: The title of Navigation Bar
     */
  public  func setNavigationBarTitle(title: String)
    {
        self.navigationItem.title = title
    }
    
    /**
     Set Image instead of Text in UINavigationBar
     - parameter imageName: The image to be shown
     */
    
   public func setupNavigationBarWithTitleImage(_ imageName: String, showBackButtonIfNeeded show: Bool) {
        self.hideNavigationBar(false)
        let barImageView: UIImageView = UIImageView(image: UIImage(named: imageName))
        self.navigationItem.titleView = barImageView
        
    }
    
    /**
     Hide or Unhide Navigation Bar
     - parameter hide: A bool to set navigation bar
     */
   public func hideNavigationBar(_ hide: Bool) {
        if self.navigationController != nil {
            self.navigationController!.isNavigationBarHidden = hide
        }
        
    }
    /**
     This method will used to hide/unhide shadow of navigation bar
     - parameter hide: A boolean which will hide/unhide shadow
     
     */
    public func hideNavBarShaddow(hide : Bool)
    {
        self.navigationController?.navigationBar.setValue(hide, forKey: "hidesShadow")
        
    }
    /**
     Pop to specific ViewController
     - parameter backIndex: The index of ViewController fron NavigationController Stack
     - parameter animate: A bool to set animation
     */
   
    public func goBackToIndex(_ backIndex: Int, animated animate: Bool) {
        if (self.navigationController!.viewControllers.count - backIndex) > 0 {
            let controller: BaseViewController = (self.navigationController!.viewControllers[(self.navigationController!.viewControllers.count - 1 - backIndex)] as! BaseViewController)
            self.navigationController!.popToViewController(controller, animated: animate)
        }
    }
    
    
    
    override  open func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.baseDelegate = nil
    }
    //
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     This method will be called when user will click on right navigation bar button. The view controller has to implement the delegate.
     - parameter sender: This will be the rightButton.
     
     */
    @objc func rightNavigationButtonClicked(_ sender: AnyObject) {
        print("Right Navigation Button Clicked")
        self.baseDelegate?.rightNavigationBarButtonClicked()
    }
    
    /**
     This method will be called when user will click on left navigation bar button. The view controller has to implement the delegate.
     - parameter sender: This will be the leftButton.
     
     */
    @objc func leftNavigationButtonClicked(_ sender: AnyObject) {
        print("Left Navigation Button Clicked")
        self.baseDelegate?.leftNavigationBarButtonClicked()
    }
    
    
    
    
    
    
}

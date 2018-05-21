# BaseViewController

[![CI Status](https://img.shields.io/travis/muhammadnayabbutt/BaseViewController.svg?style=flat)](https://travis-ci.org/muhammadnayabbutt/BaseViewController)
[![Version](https://img.shields.io/cocoapods/v/BaseViewController.svg?style=flat)](https://cocoapods.org/pods/BaseViewController)
[![License](https://img.shields.io/cocoapods/l/BaseViewController.svg?style=flat)](https://cocoapods.org/pods/BaseViewController)
[![Platform](https://img.shields.io/cocoapods/p/BaseViewController.svg?style=flat)](https://cocoapods.org/pods/BaseViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BaseViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BaseViewController', :git => 'https://github.com/MuhammadNayabButt/BaseViewController.git'
```
## Usage
```ruby
Inherit ViewController from BaseViewController
class ViewController: BaseViewController, BaseViewControllerDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar("New Screen",  leftButtonText: "Back", rightButtonText: "Next")
        //self.setupNavigationBar("First Screen",  leftButtonType: .back,rightButtonType: .settings)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.baseDelegate = self
    }
    
    func rightNavigationBarButtonClicked() {
    print("Right Navigation Button Clicked in ViewController")
    }
    
    func leftNavigationBarButtonClicked() {
    print("Left Navigation Button Clicked in ViewController")
    }
}

```
## Author

muhammadnayabbutt, nayabbutt1@gmail.com

## License

BaseViewController is available under the MIT license. See the LICENSE file for more info.

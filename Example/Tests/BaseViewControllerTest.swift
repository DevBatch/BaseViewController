import XCTest
import BaseViewController

@testable import BaseViewController
class BaseViewControllerTest: XCTestCase {
    
    var sut : ViewController!
    
    override func setUp()
    {
        super.setUp()
       // sut = MockViewController()
       let storyBoard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = storyBoard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        navigationController.viewControllers = [sut]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testNavigationBarTitle()
    {
        let title = "Home Screen"
        sut.setNavigationBarTitle(title :title)
        XCTAssertEqual(sut.title, title)
    }
    
    
    
    func testNavigationBarShadown()
    {
        let hideNavigationBarShadonw = true
        sut.hideNavBarShaddow(hide : hideNavigationBarShadonw)
        let nivationBarShadowIsHidden = sut.navigationController?.navigationBar.value(forKey: "hidesShadow") as! Bool
        XCTAssertEqual(hideNavigationBarShadonw, nivationBarShadowIsHidden)
    }
    
    
    
    
    
    
    func testDefaultButtonTypes(){
        let title = "Home Screen"
        sut.setupNavigationBar(title)
        
        XCTAssertEqual(sut.leftbtnType, UINavigationBarLeftButtonType(rawValue : UINavigationBarLeftButtonType.text.rawValue ))
        XCTAssertEqual(sut.rightbtnType, UINavigationBarRightButtonType(rawValue : UINavigationBarRightButtonType.text.rawValue ))
    }
    
    
}


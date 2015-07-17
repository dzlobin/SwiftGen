// Xcode 7b3, Swift 2.0

import Foundation
import UIKit

class CreateAccViewController : UIViewController {}

//: #### SwiftGenStoryboardEnumFactory Usage Example

let factory = SwiftGenStoryboardEnumFactory()
if let sbFile1 = NSBundle.mainBundle().pathForResource("Wizzard", ofType: "storyboard") {
    factory.addStoryboard(sbFile1)
}
//if let sbFile2 = NSBundle.mainBundle().pathForResource("Message", ofType: "storyboard") {
//    factory.addStoryboard(sbFile2)
//}
print(factory.generate())

//: #### Code Generated by the Factory

protocol StoryboardScene : RawRepresentable {
    static var storyboardName : String { get }
}

extension StoryboardScene where Self.RawValue == String {
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    static func initialViewController() -> UIViewController {
        return storyboard().instantiateInitialViewController()!
    }
    
    func viewController() -> UIViewController {
        return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
    }
    static func viewController(identifier: Self) -> UIViewController {
        return identifier.viewController()
    }
}


enum Wizzard : String, StoryboardScene {
    static let storyboardName = "Wizzard"
    
    case CreateAccount = "CreateAccount"
    case AcceptCGU = "Accept-CGU"
    case ValidatePassword = "Validate_Password"
    case Preferences = "Preferences"
    
    static var createAccountViewController : CreateAccViewController { return Wizzard.CreateAccount.viewController() as! CreateAccViewController }
    static var acceptCGUViewController : UIViewController { return Wizzard.AcceptCGU.viewController() }
    static var validatePasswordViewController : UIViewController { return Wizzard.ValidatePassword.viewController() }
    static var preferencesViewController : UIViewController { return Wizzard.Preferences.viewController() }
}

//: #### Usage Example

let initialVC = Wizzard.initialViewController()
let validateVC = Wizzard.ValidatePassword.viewController()
let cgu = Wizzard.acceptCGUViewController

validateVC.title
cgu.title
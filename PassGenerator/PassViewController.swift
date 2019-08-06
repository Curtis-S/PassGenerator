//
//  PassViewController.swift
//  PassGenerator
//
//  Created by curtis scott on 04/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {
    
   
    
//outlets
    
    @IBOutlet weak var feedBackView: UIView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var passType: UILabel!
    
    @IBOutlet weak var discounts: UILabel!
    @IBOutlet weak var rides: UILabel!
    @IBOutlet weak var areas: UILabel!
    
    @IBOutlet weak var feebackTestLabel: UILabel!
    @IBOutlet weak var createPassButton: UIButton!
    //properties
    
    let swipeMachine = SwipeMachine()
    var delegate:ViewController?
    var pass:Passable? {
        if let mc = delegate, let pass = mc.entrant {
            return pass
        }
        else {return nil}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("veiwdid load1")
      updatePassInfo()
        print("veiwdid load")
        
    }
    
    //helpers
    
    func updatePassInfo()  {
        if let controller = delegate{
        switch controller.menuChoice {
        case .acme:
            self.passType.text = "Vendor Pass"
       break
        case .classic:
            self.passType.text = "Classic Guest Pass"
        case .VIP:
            self.passType.text = "VIP Guest Pass"
        case .child:
            self.passType.text = "Child Guest Pass"
        case .senior:
            self.passType.text = "Senior Guest Pass"
        case .season:
            self.passType.text = "Season Guest Pass"
        case .food:
            self.passType.text = "Food Employee Pass"
        case .ride:
            self.passType.text = "Ride Employee Pass"
        case .maintanence:
            self.passType.text = "Maintenece Employee Pass"
        case .manager:
            self.passType.text = "Managers Pass"
        case .contract1001:
            self.passType.text = "Contract Employee Pass"
        case .contract1002:
            self.passType.text = "Contract Employee Pass"
        case .contract1003:
            self.passType.text = "Contract Employee Pass"
        case .contract2001:
            self.passType.text = "Contract Employee Pass"
        case .contract2002:
            self.passType.text = "Contract Employee Pass"
        case .orkin:
            self.passType.text = "Vendor Pass"
        case .fedex:
            self.passType.text = "Vendor Pass"
        case .nwElectrical:
            self.passType.text = "Vendor Pass"
        case .noChoice:
            self.passType.text = "Vendor Pass"
            }
            
            if let pass = pass {
                if let passName = pass.passInfo["name"]{
                    self.name.text = passName
                } else {
                    self.name.text = "No Name needed "
                }
                
                self.rides.text = pass.passInfo["ride access"]
                self.discounts.text = "\(pass.passInfo["food discount"] ?? "no discount") & \(pass.passInfo["merch discount"] ?? "none") "
            }
        }
        
        
    }
    
    
    //actions
    
    @IBAction func pressAmusment(_ sender: Any) {
        
        if let pass = pass {
            if swipeMachine.swipe(pass, forArea: .Amusement) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Granted"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Denied"
            }
        }
    }
    
    @IBAction func pressKitchen(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forArea: .Kitchen) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Granted"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Denied"
            }
        }
    }
    
    @IBAction func RideControl(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forArea: .RideControl) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Granted"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Denied"
            }
        }
    }
    
    @IBAction func Maintenance(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forArea: .Maintenence) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Granted"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Denied"
            }
        }
    }
    
    @IBAction func pressOffice(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forArea: .Office) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Granted"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Denied"
            }
        }
    }
    
    @IBAction func pressSkipRides(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forRideAccess: .skipRideLines) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Skip lines enabled"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Cannot Skip Lines"
            }
        }    }
    
    
    @IBAction func pressRides(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forRideAccess: .allRides) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Granted"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Cannot Ride Rides"
            }
        }
    }
    
    
    @IBAction func PressDiscount(_ sender: Any) {
        if let pass = pass {
            if swipeMachine.swipe(pass, forArea: .Amusement) {
                feedBackView.backgroundColor = UIColor.blue
                feebackTestLabel.text = "Food : \(pass.foodDiscount) Merch: \(pass.merchandiseDiscount)"
            }else {
                feedBackView.backgroundColor = UIColor.red
                feebackTestLabel.text = "Food : \(pass.foodDiscount) Merch: \(pass.merchandiseDiscount)"
            }
        }
    }
    
    @IBAction func printPassRestartApp(_ sender: Any) {
       // self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: delegate!.restartApp)
    }
    
}

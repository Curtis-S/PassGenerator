//
//  ViewController.swift
//  PassGenerator
//
//  Created by curtis scott on 02/07/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum passSelection {
        case classic
        case VIP
        case child
        case senior
        case season
        case food
        case ride
        case maintanence
        case manager
        case contract1001
        case contract1002
        case contract1003
        case contract2001
        case contract2002
        case acme
        case orkin
        case fedex
        case nwElectrical
        case noChoice
        
    }
    
    var menuChoice: passSelection = .noChoice
     var entrant:Passable?
    
    
    
    // main menu outlets
    
    
    @IBOutlet weak var guestButton: UIButton!
    
    @IBOutlet weak var employeeButton: UIButton!
    
    @IBOutlet weak var vendorButton: UIButton!
    
    @IBOutlet weak var contractorButton: UIButton!
    //sub menu outlets
    
    @IBOutlet weak var childButton: UIButton!
    
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var rideButton: UIButton!
    @IBOutlet weak var maintenanceButton: UIButton!
    @IBOutlet weak var acmeButton: UIButton!
    @IBOutlet weak var orkinButton: UIButton!
    @IBOutlet weak var fedexButton: UIButton!
    @IBOutlet weak var nwElecButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var seasonPassButton: UIButton!
    @IBOutlet weak var classicButton: UIButton!
    
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var seniorButton: UIButton!
    @IBOutlet weak var contract1003: UIButton!
    
    
    @IBOutlet weak var contract1001: UIButton!
    
    @IBOutlet weak var contract1002: UIButton!
    @IBOutlet weak var contract2001: UIButton!
    
    @IBOutlet weak var contract2002: UIButton!
    
    // form outlets
    
    @IBOutlet weak var dobTextField: UITextField!
    
    @IBOutlet weak var ssnTextField: UITextField!
    
    @IBOutlet weak var projectTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var zipcodeTextFiled: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBOutlet weak var genPassButton: UIButton!
    
    @IBOutlet weak var popDataButton: UIButton!
    
   
    //let regex =  NSRegularExpression(pattern: "^\\d{3}[-]\\d{2}[-]\\d{4}$")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideAllFields()
        disableAllSubButtons()
        
        print("10/10/1990".range(of: "^([0-2][0-9]||3[0-1])/(0[0-9]||1[0-2])/([0-9][0-9])?[0-9][0-9]$", options: .regularExpression) != nil)
    }
    
    //helper methods
    
    func populateDataFields(for entrant:passSelection ){
        switch entrant {
        case .contract1001,.contract1002,.contract1003,.contract2001,.contract2002,.food,.maintanence,.manager,.ride:
            firstNameTextField.text = " Mike"
            lastNameTextField.text = " Rowers"
            cityTextField.text = " London"
            stateTextField.text = " Texas"
            addressTextField.text = "  flight Street"
            zipcodeTextFiled.text = " Po12js3"
            break
        case .acme,.fedex,.orkin,.nwElectrical:
            firstNameTextField.text = " Bob"
            lastNameTextField.text = " Bylan"
            dobTextField.text = " 01/01/1990"
            companyTextField.text = " source Ltd"
            ssnTextField.text = " 01/02/2019"
            
            break
        case .senior:
            firstNameTextField.text = " Grandpa"
            lastNameTextField.text = " John"
            dobTextField.text = " 01/01/1950 "
            
            break
        case .child:
        
            dobTextField.text = "01/01/2010"
            
        case .season:
            firstNameTextField.text = " Mike"
            lastNameTextField.text = " Rowers"
            cityTextField.text = " London"
            stateTextField.text = " Texas"
            addressTextField.text = "  flight Street"
            zipcodeTextFiled.text = " Po12js3"
            dobTextField.text = "01/01/1990"
            
            break
    
            
           
        default:
            break
        }
        
    }
    
    
    //menu
    
    func restartApp() {
        hideAllFields()
        disableAllSubButtons()
        clearTextFields()
    }
    
    func selectContractor(){
        foodButton.isHidden = true
        rideButton.isHidden = true
        maintenanceButton.isHidden = true
        acmeButton.isHidden = true
        orkinButton.isHidden = true
        fedexButton.isHidden = true
        nwElecButton.isHidden = true
        managerButton.isHidden = true
        seasonPassButton.isHidden = true
        classicButton.isHidden = true
        vipButton.isHidden = true
        seniorButton.isHidden = true
        childButton.isHidden = true
        contract1001.isHidden = false
        contract1002.isHidden = false
        contract1003.isHidden = false
        contract2001.isHidden = false
        contract2002.isHidden = false
        hideAllFields()
        clearTextFields()
        
    }
    func selectGuest(){
        foodButton.isHidden = true
        rideButton.isHidden = true
        maintenanceButton.isHidden = true
        acmeButton.isHidden = true
        orkinButton.isHidden = true
        fedexButton.isHidden = true
        nwElecButton.isHidden = true
        managerButton.isHidden = true
        seasonPassButton.isHidden = false
        classicButton.isHidden = false
        vipButton.isHidden = false
        seniorButton.isHidden = false
        childButton.isHidden = false
        contract1001.isHidden = true
        contract1002.isHidden = true
        contract1003.isHidden = true
        contract2001.isHidden = true
        contract2002.isHidden = true
        hideAllFields()
        clearTextFields()
        
        
    }
    
    func selectVendor(){
        foodButton.isHidden = true
        rideButton.isHidden = true
        maintenanceButton.isHidden = true
        acmeButton.isHidden = false
        orkinButton.isHidden = false
        fedexButton.isHidden = false
        nwElecButton.isHidden = false
        managerButton.isHidden = true
        seasonPassButton.isHidden = true
        classicButton.isHidden = true
        vipButton.isHidden = true
        seniorButton.isHidden = true
        childButton.isHidden = true
        contract1001.isHidden = true
        contract1002.isHidden = true
        contract1003.isHidden = true
        contract2001.isHidden = true
        contract2002.isHidden = true
        hideAllFields()
        clearTextFields()
        
    }
    
    func selectEmployee(){
        foodButton.isHidden = false
        rideButton.isHidden = false
        maintenanceButton.isHidden = false
        acmeButton.isHidden = true
        orkinButton.isHidden = true
        fedexButton.isHidden = true
        nwElecButton.isHidden = true
        managerButton.isHidden = false
        seasonPassButton.isHidden = true
        classicButton.isHidden = true
        vipButton.isHidden = true
        seniorButton.isHidden = true
        childButton.isHidden = true
        contract1001.isHidden = true
        contract1002.isHidden = true
        contract1003.isHidden = true
        contract2001.isHidden = true
        contract2002.isHidden = true
        hideAllFields()
        clearTextFields()
        
    }
    
    //sub menu
    
    
    
    func disableAllSubButtons(){
 
        
        foodButton.isHidden = true
        rideButton.isHidden = true
        maintenanceButton.isHidden = true
        acmeButton.isHidden = true
        orkinButton.isHidden = true
        fedexButton.isHidden = true
        nwElecButton.isHidden = true
        managerButton.isHidden = true
        seasonPassButton.isHidden = true
        classicButton.isHidden = true
        vipButton.isHidden = true
        seniorButton.isHidden = true
        childButton.isHidden = true
        contract1001.isHidden = true
        contract1002.isHidden = true
        contract1003.isHidden = true
        contract2001.isHidden = true
        contract2002.isHidden = true
        
    }
    // form fields
    func hideAllFields(){
       
        dobTextField.isHidden = true
        ssnTextField.isHidden = true
        projectTextField.isHidden = true
        firstNameTextField.isHidden = true
        lastNameTextField.isHidden = true
        stateTextField.isHidden = true
        companyTextField.isHidden = true
        cityTextField.isHidden = true
        zipcodeTextFiled.isHidden = true
        addressTextField.isHidden = true
        popDataButton.isHidden = true
        genPassButton.isHidden = true
        
    }
    func disableAllFields(){
        
        dobTextField.isEnabled = false
        ssnTextField.isEnabled = false
        projectTextField.isEnabled = false
        firstNameTextField.isEnabled = false
        lastNameTextField.isEnabled = false
        stateTextField.isEnabled = false
        companyTextField.isEnabled = false
        cityTextField.isEnabled = false
        zipcodeTextFiled.isEnabled = false
        addressTextField.isEnabled = false
        popDataButton.isEnabled = false
        genPassButton.isEnabled = true
        
    }
    func enableAllFields(){
        
        dobTextField.isEnabled = true
        ssnTextField.isEnabled = true
        projectTextField.isEnabled = true
        firstNameTextField.isEnabled = true
        lastNameTextField.isEnabled = true
        stateTextField.isEnabled = true
        companyTextField.isEnabled = true
        cityTextField.isEnabled = true
        zipcodeTextFiled.isEnabled = true
        addressTextField.isEnabled = true
        popDataButton.isEnabled = true
        genPassButton.isEnabled = true
        
    }
    
    
    func clearTextFields(){
        dobTextField.text = ""
        ssnTextField.text = ""
        projectTextField.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        stateTextField.text = ""
        companyTextField.text = ""
        cityTextField.text = ""
        zipcodeTextFiled.text = ""
        addressTextField.text = ""
    }
    
    func employeeFields(){
        
        firstNameTextField.isHidden = false
        lastNameTextField.isHidden = false
        cityTextField.isHidden = false
        stateTextField.isHidden = false
        addressTextField.isHidden = false
        zipcodeTextFiled.isHidden = false
        popDataButton.isHidden = false
        genPassButton.isHidden = false
    }
    func vendorFields(){
        
        firstNameTextField.isHidden = false
        lastNameTextField.isHidden = false
        dobTextField.isHidden = false
        companyTextField.isHidden = false
        ssnTextField.isHidden = false
        popDataButton.isHidden = false
        genPassButton.isHidden = false
    }
    
    
    func checkSelection(){
        if menuChoice != .noChoice{
            popDataButton.isHidden = false
            genPassButton.isHidden = false
        }else {
            hideAllFields()
        }
        
    }
    //guests
    func selectClassic(){
        enableAllFields()
        hideAllFields()
        clearTextFields()
        menuChoice = .classic
        popDataButton.isHidden = false
        genPassButton.isHidden = false
        
    }
    func selectVip(){
        enableAllFields()
        hideAllFields()
        clearTextFields()
        menuChoice = .VIP
        popDataButton.isHidden = false
        genPassButton.isHidden = false
    }
    func selectChild(){
          enableAllFields()
        hideAllFields()
        clearTextFields()
        menuChoice = .child
        dobTextField.isHidden = false
        popDataButton.isHidden = false
        genPassButton.isHidden = false
    }
    func selectSenior(){
          enableAllFields()
        hideAllFields()
        clearTextFields()
        menuChoice = .senior
        firstNameTextField.isHidden = false
        lastNameTextField.isHidden = false
        dobTextField.isHidden = false
        popDataButton.isHidden = false
        genPassButton.isHidden = false
        
    }
    func selectSeason(){
          enableAllFields()
        hideAllFields()
        clearTextFields()
        menuChoice = .season
        
        employeeFields()
        dobTextField.isHidden = false
    }
    
    func selectFood(){
          enableAllFields()
        clearTextFields()
        menuChoice = .food
        employeeFields()
    }
    func selectRide(){
          enableAllFields()
        clearTextFields()
        menuChoice = .ride
        employeeFields()
    }
    func selectMaintenance(){
          enableAllFields()
        clearTextFields()
        menuChoice = .maintanence
        employeeFields()
    }
    func selectManager(){
          enableAllFields()
        clearTextFields()
        menuChoice = .manager
        employeeFields()
    }
    func selectContract1001(){
          enableAllFields()
        clearTextFields()
        menuChoice = .contract1001
        employeeFields()
    }
    func selectContract1002(){
          enableAllFields()
        clearTextFields()
        menuChoice = .contract1002
        employeeFields()
    }
    func selectSeasonContract1003(){
          enableAllFields()
        clearTextFields()
        menuChoice = .contract1003
        employeeFields()
    }
    func selectContract2001(){
          enableAllFields()
        clearTextFields()
        menuChoice = .contract2001
        employeeFields()
    }
    func selectContract2002(){
          enableAllFields()
        clearTextFields()
        menuChoice = .contract2002
        employeeFields()
    }
    func selectAcme(){
          enableAllFields()
        clearTextFields()
        menuChoice = .acme
        vendorFields()
    }
    func selectFedex(){
          enableAllFields()
        clearTextFields()
        menuChoice = .fedex
        vendorFields()
    }
    func selectOrkin(){
          enableAllFields()
        clearTextFields()
        menuChoice = .orkin
        vendorFields()
    }
    func selectElectrical(){
          enableAllFields()
        clearTextFields()
        menuChoice = .nwElectrical
        
        vendorFields()
    }
    
   
    
    
    
    //actions
    
    @IBAction func pressContractorButton(_ sender: Any) {
        selectContractor()
    }
    
    @IBAction func pressVendorButton(_ sender: Any) {
        selectVendor()
    }
    
    @IBAction func pressGuestButton(_ sender: Any) {
        selectGuest()
        
    }
    
    @IBAction func pressEmployeeButton(_ sender: Any) {
        
        selectEmployee()
    }
    
    // sub menu  actions
    
    @IBAction func pressChildButton(_ sender: Any) {
        selectChild()
        
    }
    
    @IBAction func pressContract1001utton(_ sender: Any) {
        selectContract1001()
    }
    
    @IBAction func pressContractButton(_ sender: Any) {
        selectContract1002()
    }
    
    @IBAction func pressCntract1003Butoon(_ sender: Any) {
        selectSeasonContract1003()
    }
    
    @IBAction func pressContract2001(_ sender: Any) {
        
        selectContract2001()
    }
    
    @IBAction func pressContract2002(_ sender: Any) {
        selectContract2002()
    }
    
    
    @IBAction func pressFoodButtton(_ sender: Any) {
        selectFood()
    }
    
    
    @IBAction func pressRideButton(_ sender: Any) {
        
        selectRide()
    }
    
    @IBAction func pressMaintenaceButton(_ sender: Any) {
        
        selectMaintenance()
    }
    
    
    
    @IBAction func pressAcmeButton(_ sender: Any) {
        
        selectAcme()
    }
    
    @IBAction func pressOrkinButton(_ sender: Any) {
        selectOrkin()
    }
    
    @IBAction func pressFedexButton(_ sender: Any) {
        
        selectFedex()
    }
    
    @IBAction func pressElecButton(_ sender: Any) {
        
        selectElectrical()
    }
    
    @IBAction func pressManagerButton(_ sender: Any) {
        selectManager()
    }
    
    @IBAction func pressSeasonButton(_ sender: Any) {
        selectSeason()
    }
    
    @IBAction func pressClassButton(_ sender: Any) {
        
        selectClassic()
    }
    @IBAction func pressSenioprButton(_ sender: Any) {
        
        selectSenior()
    }
    
    @IBAction func pressVipButton(_ sender: Any) {
        selectVip()
    }
    
    @IBAction func populateFieldData(_ sender: Any) {
        populateDataFields(for: self.menuChoice)
        disableAllFields()
    }
    
    @IBAction func GeneratePass(_ sender: Any) {
        switch self.menuChoice {
        case .child,.senior,.season,.acme,.fedex,.orkin,.nwElectrical:
            if dobTextField.text!.range(of: "^([0-2][0-9]||3[0-1])/(0[0-9]||1[0-2])/([0-9][0-9])?[0-9][0-9]$", options: .regularExpression) == nil {
                showAlertWith(title: "date of birth error", message: "need a valid date dd/mm/yyyy")
            }else {
                createEntrant()
                if entrant == nil {
                    showAlertWith(title: "no entrant", message: "somethign went wrong with entrant creation please ensure all fields are filled in ")
                }
                self.performSegue(withIdentifier: "pass", sender: self)
                
            }
        default:
            createEntrant()
            if entrant == nil {
                showAlertWith(title: "no entrant", message: "something went wrong with entrant creation please ensure all fields are filled in ")
            }
            self.performSegue(withIdentifier: "pass", sender: self)
        }
        
        
    }
    
    func createEntrant()  {
        
        switch self.menuChoice {
            
        
        case .classic:
            entrant = Guest(guestType: .classic)
            break
        case .child:
            entrant = Guest(guestType: .child)
            do {
                entrant =  try ChildGuest(dateOfBirth: dobTextField.text, guestType: .child)
                
            }
            catch let error {
                print(error)
            }
            break
        case .VIP:
            entrant = Guest(guestType: .VIP)
            break
        case .senior:
            do {
                entrant =  try SeniorGuest(dateOfBirth: dobTextField.text, guestType: .senior, name: firstNameTextField.text, lastName: lastNameTextField.text)
            }
            catch let error {
                print(error)
            }
            break
        case .season:
            do {
                entrant =  try SeasonGuest(dateOfBirth: dobTextField.text, guestType: .season, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)
            }
            catch let error {
                print(error)
            }
            
            break
        case .food:
            do {
                entrant =  try Employee(employeeType: .food, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .maintanence:
            do {
                entrant =  try Employee(employeeType: .maintanence, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .manager:
            do {
                entrant =  try Employee(employeeType: .manager, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .ride:
            do {
                entrant =  try Employee(employeeType: .ride, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .contract1001:
            do {
                entrant =  try Employee(employeeType: .contract1001, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .contract1002:
            do {
                entrant =  try Employee(employeeType: .contract1002, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .contract1003:
            do {
                entrant =  try Employee(employeeType: .contract1003, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .contract2001:
            do {
                entrant =  try Employee(employeeType: .contract2001, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .contract2002:
            do {
                entrant =  try Employee(employeeType: .contract2002, name: firstNameTextField.text, lastName: lastNameTextField.text, street: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextFiled.text)}
            catch let error {
                print(error)
            }
            break
        case .fedex:
            entrant = Guest(guestType: .classic)
            break
        case .orkin:
            entrant = Guest(guestType: .classic)
            break
        case .nwElectrical:
            entrant = Guest(guestType: .classic)
            break
        case .acme:
            entrant = Guest(guestType: .classic)
            break
        case .noChoice:
            entrant = nil
            break
            
        }
        
    }
    
    
        

        
        
    // moodle popupupo alerts
    func showAlertWith(title: String, message: String, style:UIAlertController.Style = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: dissmissAlert)
        alertController.addAction(okAction)
        present(alertController,animated: true, completion: nil)
    }
    func dissmissAlert(sender: UIAlertAction)->Void{
        clearTextFields()
    }
    
    // MARK:- navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! PassViewController
            print(controller)
        
        
         controller.delegate = self
           print("prepare")
         
            
        
        print("prepare")
        
    
      
    }


}





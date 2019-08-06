//
//  GuestModels.swift
//  PassGenerator
//
//  Created by curtis scott on 02/07/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation





// entrant types

protocol Passable: class {
    var foodDiscount:Int {get}
    var merchandiseDiscount:Int {get}
    var areaAccess: [AreaAccess] {get}
    var rideAccess: [RideAccess] {get}
    var passInfo: [String:String] {get}
    
    
}
enum GuestType {
    case classic
    case VIP
    case child
    case senior
    case season
}

enum VendorCompany {
    case acme
    case orkin
    case fedex
    case nwElectrical
    
}

enum EmployeeType {
    case food
    case ride
    case maintanence
    case manager
    case contract1001
    case contract1002
    case contract1003
    case contract2001
    case contract2002
}


// area types
enum AreaAccess {
    case Amusement
    case Kitchen
    case RideControl
    case Maintenence
    case Office
}

enum RideAccess:String {
    case allRides
    case skipRideLines
}

// entrant models
class Guest:Passable {
    var passInfo: [String : String] {
        var ridePriority = ""
        if self.type == .VIP{
       ridePriority = "High (Skip Lines)"
        }else {
           ridePriority = "Regular"
        }
        
        return ["ride access":"Unlimited rides, Priority: \(ridePriority)","food discount":"\(self.foodDiscount)% Food Discount","merch discount":"\(self.merchandiseDiscount)% Merchancise Discount"]
        
    }
    
   
    
    let type: GuestType
    var foodDiscount: Int {
        if self.type == .VIP {
            return 10
        }else {
            return 0
        }
    }
    
    var merchandiseDiscount: Int {
        if self.type == .VIP {
            return 20
        }else {
            return 0
        }
    }
    
    init(guestType t: GuestType) {
        type = t
    }
    
    var areaAccess: [AreaAccess] {
     
        return [.Amusement]
    }
    
    var rideAccess: [RideAccess] {
        if self.type == .VIP {
            return [.allRides , .skipRideLines]
        }else {
           return  [.allRides]
        }
        
    }
    
}

class ChildGuest:Guest {
    let dateOfBirth: String
    
    init(dateOfBirth dob : String?, guestType t :GuestType) throws {
        guard let dateOfBirth  = dob  else {
            print(" please provide a date of birth ")
            throw EntrantCreationError.missingStreetAdress
        }
        self.dateOfBirth = dateOfBirth
        super.init(guestType: t)
        
    }
}

class SeniorGuest:Guest {
    let dateOfBirth: String
    let firstName: String
    let lastName: String
    
    init(dateOfBirth dob : String?, guestType t :GuestType,name fName:String?, lastName lName:String?) throws {
        guard let firstName = fName else {
            print(" please provide a first name ")
            throw EntrantCreationError.missingFirstName
        }
        guard let lastName  = lName  else {
            print(" please provide a last name ")
            throw EntrantCreationError.missingLastName
        }
        guard let dateOfBirth  = dob  else {
            print(" please provide a street name ")
            throw EntrantCreationError.missingStreetAdress
        }
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        super.init(guestType: t)
        
    }
}


class SeasonGuest:Guest {
    let dateOfBirth: String
    let firstName: String
    let lastName: String
    let street: String
    let city: String
    let state: String
    let zipCode: String
    
    init(dateOfBirth dob : String?, guestType t :GuestType, name fName:String?, lastName lName:String?, street streetName:String?,
         city cityName:String?,state stateName:String?,zipcode zip:String?) throws {
       
        guard let firstName = fName else {
            print(" please provide a first name ")
            throw EntrantCreationError.missingFirstName
        }
        guard let lastName  = lName  else {
            print(" please provide a last name ")
            throw EntrantCreationError.missingLastName
        }
        guard let street = streetName  else {
            print(" please provide a street name ")
            throw EntrantCreationError.missingStreetAdress
        }
        guard let  city = cityName else {
            print(" please provide a city name ")
            throw EntrantCreationError.missingCityName
        }
        guard let state = stateName else {
            print(" please provide a state name ")
            throw EntrantCreationError.missingStateName
        }
        guard let zipCode = zip  else {
            print(" please provide a zipcode  ")
            throw EntrantCreationError.missingZipCode
        }
        guard let dateOfBirth  = dob  else {
            print(" please provide a street name ")
            throw EntrantCreationError.missingStreetAdress
        }
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dateOfBirth = dateOfBirth
        
        super.init(guestType: t)
        
    }
}

class Vendor:Passable {
    var passInfo: [String : String]{
       
        return ["ride access":"Cannot Ride the rides","food discount":"\(self.foodDiscount)% Food Discount","merch discount":"\(self.merchandiseDiscount)% Merchancise Discount","name" :"\(self.firstName) \(self.firstName)"]
        
    }
    
    var rideAccess: [RideAccess]{
        return []
    }
    
  
    
    let firstName: String
    let lastName: String
    let vendorCompany: VendorCompany
    let dateOfBirth: String
    let dateOfVisit: String
    
    let foodDiscount: Int = 0
    let  merchandiseDiscount = 0
    var areaAccess: [AreaAccess] {
        switch self.vendorCompany {
        
        case .acme:
            return [.Kitchen ]
        case .orkin:
            return [.Amusement,.Kitchen,.RideControl ]
        case .fedex:
            return [.Maintenence,.Office, ]
        case .nwElectrical:
            return [.Amusement,.Kitchen,.Maintenence,.Office,.RideControl ]
        }
    }
    
    init(_ fName:String?, _ lName:String?,_ vCompany:VendorCompany,_ dob:String?,_ dov:String?) throws {
       
        
        
        guard let firstName = fName else {
            print(" please provide a first name ")
            throw EntrantCreationError.missingFirstName
        }
        guard let lastName  = lName  else {
            print(" please provide a last name ")
            throw EntrantCreationError.missingLastName
        }
        guard let dateOfBirth  = dob  else {
            print(" please provide a street name ")
            throw EntrantCreationError.missingStreetAdress
        }
        guard let  dateOfVisit = dov else {
            print(" please provide a city name ")
            throw EntrantCreationError.missingCityName
        }
        
      
        self.firstName = firstName
        self.lastName = lastName
        self.vendorCompany = vCompany
        self.dateOfBirth = dateOfBirth
        self.dateOfVisit = dateOfVisit
        
    }
    
    
    
}

class Employee:Passable {
    var passInfo: [String : String]{
        
        return ["ride access":"Unlimited rides, Priority:Regular","food discount":"\(self.foodDiscount)% Food Discount","merch discount":"\(self.merchandiseDiscount)% Merchancise Discount","name" :"\(self.firstName) \(self.lastName)"]
        
    }
    
  
    
     let firstName: String
     let lastName: String
     let street: String
     let city: String
     let state: String
     let zipCode: String
     let type: EmployeeType
    
    var foodDiscount: Int {
        if self.type == .manager {
            return 25
        }else {
            return 15
        }
    }
    
    var areaAccess: [AreaAccess] {
        switch self.type {
        case .food:
            return [.Amusement,.Kitchen]
            
        case .ride:
            return [.Amusement,.RideControl]
            
        case .maintanence:
            return [.Amusement,.Kitchen,.Maintenence,.RideControl]
            
        case .manager:
            return [.Amusement,.Kitchen,.Maintenence,.Office,.RideControl ]

        case .contract1001:
            return [.Amusement,.RideControl ]
        case .contract1002:
            return [.Amusement,.Maintenence,.Office,.RideControl ]
        case .contract1003:
            return [.Amusement,.Kitchen,.Maintenence,.Office,.RideControl ]
        case .contract2001:
            return [.Office]
        case .contract2002:
            return [.Kitchen,.Maintenence ]
        }
    }
    
    let rideAccess: [RideAccess] = [.allRides]
        
    
    
    let  merchandiseDiscount = 25
    
    init  (employeeType t : EmployeeType, name fName:String?, lastName lName:String?, street streetName:String?,
         city cityName:String?,state stateName:String?,zipcode zip:String?) throws {
        type = t
       guard let firstName = fName else {
            print(" please provide a first name ")
            throw EntrantCreationError.missingFirstName
        }
      guard let lastName  = lName  else {
            print(" please provide a last name ")
            throw EntrantCreationError.missingLastName
        }
      guard let street = streetName  else {
            print(" please provide a street name ")
            throw EntrantCreationError.missingStreetAdress
        }
     guard let  city = cityName else {
            print(" please provide a city name ")
            throw EntrantCreationError.missingCityName
        }
      guard let state = stateName else {
            print(" please provide a state name ")
            throw EntrantCreationError.missingStateName
        }
       guard let zipCode = zip  else {
            print(" please provide a zipcode  ")
            throw EntrantCreationError.missingZipCode
        }
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
    }
}

// machine class
class SwipeMachine{
    
    func swipe(_ entrant:Passable , forArea area:AreaAccess) -> Bool {
        for permission in entrant.areaAccess{
            
            if permission == area {
                print(" access granted")
                return true
            }
            
        }
        
        print("access denied")
        return false
        
    }
    
   
    
    func swipe(_ guest:Guest ){
        if guest.type == .VIP {
            print("access to all rides and can skip lines ")
        }else {
            print("access to all rides")
        }
            
        }
    
    func swipe(_ entrant:Passable, forRideAccess ride :RideAccess) -> Bool{
        for permission in entrant.rideAccess{
            
            if permission == ride {
                print(" access granted")
                return true
            }
            
        }
        
        print("access denied")
        return false
   
        
    }
        
    }
    



        





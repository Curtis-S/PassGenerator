//
//  GuestModels.swift
//  PassGenerator
//
//  Created by curtis scott on 02/07/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation



// entrant types
enum GuestType {
    case classic
    case VIP
    case child
}

enum EmployeeType {
    case food
    case ride
    case maintanence
    case manager
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
class Guest {
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
    let dateOfBirth: Int
    
    init(dateOfBirth dob : Int, guestType t :GuestType) {
        dateOfBirth = dob
        super.init(guestType: t)
        
    }
}

class Employee {
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

        }
    }
    
    let rideAccess: [RideAccess] = [.allRides]
        
    
    
    let  merchandiseDiscount = 25
    
    init  (employeeType t : EmployeeType, name fName:String?, lastName lName:String?, street streetName:String?,
         city cityName:String?,state stateName:String?,zipcode zip:String?) throws {
        type = t
       guard let firstName = fName else {
            print(" please provide a first name ")
            throw EmployeeCreationError.missingFirstName
        }
      guard let lastName  = lName  else {
            print(" please provide a last name ")
            throw EmployeeCreationError.missingLastName
        }
      guard let street = streetName  else {
            print(" please provide a street name ")
            throw EmployeeCreationError.missingStreetAdress
        }
     guard let  city = cityName else {
            print(" please provide a city name ")
            throw EmployeeCreationError.missingCityName
        }
      guard let state = stateName else {
            print(" please provide a state name ")
            throw EmployeeCreationError.missingStateName
        }
       guard let zipCode = zip  else {
            print(" please provide a zipcode  ")
            throw EmployeeCreationError.missingZipCode
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
    
    func swipe(_ employee:Employee , forArea area:AreaAccess) -> Bool {
        for permission in employee.areaAccess{
            
            if permission == area {
                print(" access granted")
                return true
            }
            
        }
        
        print("access denied")
        return false
        
    }
    
    func swipe(_ guest:Guest , forArea area:AreaAccess)-> Bool {
        
        for permission in guest.areaAccess{
            
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
    
    func swipe(_ employee:Employee) {
        
        print("access to all rides")
        
    }
        
    }
    



        





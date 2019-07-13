//
//  PassGeneratorTests.swift
//  PassGeneratorTests
//
//  Created by curtis scott on 02/07/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import XCTest
@testable import PassGenerator

class PassGeneratorTests: XCTestCase {
    

    var testFoodEmployee = try! Employee(employeeType: .food, name: "test first", lastName: "test last", street: "test", city: "test city", state: "test state", zipcode: "test zip")
    var testRideEmployee = try! Employee(employeeType: .ride, name: "test first", lastName: "test last", street: "test", city: "test city", state: "test state", zipcode: "test zip")
    var testMaintenence = try!  Employee(employeeType: .maintanence, name: "test first", lastName: "test last", street: "test", city: "test city", state: "test state", zipcode: "test zip")
    var testManager = try! Employee(employeeType: .manager, name: "test first", lastName: "test last", street: "test", city: "test city", state: "test state", zipcode: "test zip")
    
    var testGuest1 = Guest(guestType: .classic)
   
    var testGuest = Guest(guestType: .VIP)
    var testChildGuest = ChildGuest(dateOfBirth: 010190, guestType: .child)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // tests the entrants discount gives the right percent
    func testDiscountRate(){
        let foodEmployeeFoodDiscount = testFoodEmployee.foodDiscount
        let rideEmployeeFoodDiscount = testRideEmployee.foodDiscount
        let maintenanceEmployeeFoodDiscount = testMaintenence.foodDiscount
        let managerFoodDiscount = testManager.foodDiscount
        let guestFoodDiscount = testGuest1.foodDiscount
        let childFoodDiscount = testChildGuest.foodDiscount
         let vipFoodDiscount = testGuest.foodDiscount
        
        XCTAssertEqual(foodEmployeeFoodDiscount, 15)
        XCTAssertEqual(rideEmployeeFoodDiscount, 15)
        XCTAssertEqual(maintenanceEmployeeFoodDiscount, 15)
        XCTAssertEqual(managerFoodDiscount, 25)
        XCTAssertEqual(guestFoodDiscount, 0)
        XCTAssertEqual(childFoodDiscount, 0)
        XCTAssertEqual(vipFoodDiscount, 10)
       

        
    }
    
    
    // tests the errors
    func testErrors(){
        do{
            let test1 = try Employee(employeeType: .food, name: nil, lastName: "test last", street: "test", city: "test city", state: "test state", zipcode: "test zip")
            let test2 = try Employee(employeeType: .food, name: "test", lastName: nil, street: "test", city: "test city", state: "test state", zipcode: "test zip")
            let test3 = try Employee(employeeType: .food,name: "test", lastName: "test last", street: nil, city: "test city", state: "test state", zipcode: "test zip")
            let test4 = try Employee(employeeType: .food, name: "test", lastName: "test last", street: "test", city: "test city", state: "testss", zipcode: nil)
            let test5 = try Employee(employeeType: .food, name: "test", lastName: "test last", street: "test", city: nil, state: "test state", zipcode: "test zip")
            
            let test6 = try Employee(employeeType: .food, name: "test", lastName: "test last", street: "test", city: "test city", state: nil, zipcode: "test zip")
           
             XCTAssertThrowsError(test1)
             XCTAssertThrowsError(test2)
            XCTAssertThrowsError(test3)
            XCTAssertThrowsError(test4)
            XCTAssertThrowsError(test5)
            XCTAssertThrowsError(test6)
            
        }
         catch let error {
            print(error)
           
        }
        
        
        }
    
    
    // tests if the entrants can access areas they are meant to 
    
    func testSwipeAccess(){
        
        let testSwipeMachine  = SwipeMachine()
        
        let swipetest1 = testSwipeMachine.swipe(testFoodEmployee, forArea: .Kitchen)
        
        XCTAssert(swipetest1)
        XCTAssert(testSwipeMachine.swipe(testFoodEmployee, forArea: .Kitchen))
        XCTAssert(testSwipeMachine.swipe(testFoodEmployee, forArea: .Kitchen))
        XCTAssert(testSwipeMachine.swipe(testRideEmployee, forArea: .RideControl))
        XCTAssert(testSwipeMachine.swipe(testMaintenence, forArea: .Kitchen))
        XCTAssert(testSwipeMachine.swipe(testManager, forArea: .Kitchen))
        XCTAssert(testSwipeMachine.swipe(testGuest, forArea: .Amusement))
        XCTAssert(testSwipeMachine.swipe(testGuest1, forArea: .Amusement))
        XCTAssert(testSwipeMachine.swipe(testChildGuest, forArea: .Amusement))
      
   
    }
    
        
    }
     
        
        
        
        
        
    

 



//
//  Errors.swift
//  PassGenerator
//
//  Created by curtis scott on 09/07/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation

//errors

enum EmployeeCreationError: Error {
    case missingFirstName
    case missingLastName
    case missingCityName
    case missingZipCode
    case missingStreetAdress
    case missingStateName
    case noTypeSpecified
}

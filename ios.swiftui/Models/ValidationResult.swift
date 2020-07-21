//
//  ValidationResult.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 21/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import Foundation

struct ValidationResult  {
    var IsValid: Bool {
        get { return Errors.isEmpty}
    }
    
    var Errors:[(key:String,message:String)] = []
}

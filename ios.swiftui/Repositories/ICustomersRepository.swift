//
//  ICustomersRepository.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 21/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import Foundation
import Combine

protocol ICustomersRepository{
    func getAll() -> AnyPublisher<[Customer], Error>
    func get( identifier:String ) -> Customer?
    func create( customer:Customer ) -> ValidationResult
    func update( customer:Customer ) -> ValidationResult
    func delete( customer:Customer ) -> ValidationResult
}

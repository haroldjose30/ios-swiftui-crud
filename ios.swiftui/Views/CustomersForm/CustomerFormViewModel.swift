//
//  CustomerFormViewModel.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 21/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import Foundation
import Combine

class CustomerFormViewModel: ObservableObject {
    private var repository:ICustomersRepository
    
    init(repository:ICustomersRepository) {
        self.repository = repository
    }
    
    
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    
    @Published var genders = ["Masculino", "Feminino"]
    @Published var selectedGender = 0
    
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var cpf: String = ""
    @Published var birthDate = Date()
    
   
    
    func createCustomer() {
        
        //forma a data - TODO: passa para uma biblioteca de funcoes/extencions
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let birthDateString = df.string(from: birthDate)
        
        //monta o modelo
        let newCustomer = Customer(id: UUID().uuidString,
                                   Name: name,
                                   Phone: phone,
                                   CPF: cpf,
                                   Birthdate: birthDateString,
                                   Gender: genders[selectedGender])
        
        //grava os dados no repositorio
        let result = repository.create(customer: newCustomer)
        
        if (result.IsValid) {
            showingAlert = true
            alertMessage = "Cliente incluido com sucesso!"
            clearData()
        } else {
            showingAlert = true
            alertMessage = ""
            result.Errors.forEach { (erro) in
                let (_, message) = erro
                alertMessage += " - \(message) \n"
            }
        }
    }
    
    
    func clearData() {
       selectedGender = 0
       name = ""
       phone = ""
       cpf = ""
       birthDate = Date()
    }
    
}

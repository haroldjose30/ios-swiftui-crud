//
//  CustomersListViewModel.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 20/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import Foundation
import Combine

class CustomersListViewModel: ObservableObject {
    var repository:ICustomersRepository
    
    init(repository:ICustomersRepository) {
        self.repository = repository
    }
    
    @Published var customers: [Customer] = []
    @Published var searchText: String = " "

    
    
    var cancellationToken: AnyCancellable?
    
    func getCustomers() {
        cancellationToken = repository.getAll()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.customers = $0
            })
        
    }
}

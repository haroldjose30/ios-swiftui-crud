//
//  CustomersListView.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct CustomersListPage: View {
    //@ObservedObject var viewmodel = MainViewModel()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        
        
        
        let _customer = Cliente(
            id: UUID(),
            Nome: "Harold Jose de Barros Goncalves",
            Telefone: "41 99275-3127",
            CPF: "926.637.451-20",
            Nascimento: Date(),
            Genero: Gender.Male)
        
        let customers = [_customer, _customer, _customer,_customer]
        
        return
            NavigationView {
                
                ZStack{
                    
                    BackgroudView()
                    List(customers) { customer in
                        CustomerRow(customer: customer)
                    }
                }
        }
        
        
        
    }
}

struct CustomersListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomersListPage()
    }
}

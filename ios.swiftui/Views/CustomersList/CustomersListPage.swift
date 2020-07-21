//
//  CustomersListView.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct CustomersListPage: View {
    //Todo: verificar como fazer injecao de dependencia do ViewModel e repository
    @ObservedObject var viewmodel = CustomersListViewModel(repository: CustomersRepository())
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        
        return
            ZStack{
                BackgroudView()
                
                VStack {
                    
                    SearchBarView(text: $viewmodel.searchText)
                    
                    List(viewmodel.customers.filter({ self.viewmodel.searchText.isEmpty ? true : $0.CPF.contains(self.viewmodel.searchText) })) { item in
                        CustomerRow(customer: item)
                    }
                }.padding(.top, 70)
            }.navigationBarTitle("Clientes")
                .navigationBarItems(
                    trailing: NavigationLink(destination: CustomerFormPage()) {
                        Image(systemName: "person.badge.plus.fill")
                        Text("Adicionar")
                    }
            ).onAppear(){
                self.viewmodel.getCustomers()
        }
    }
}

struct CustomersListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CustomersListPage()
        }
    }
}

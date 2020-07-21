//
//  CustomerFormPage.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 20/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct CustomerFormPage: View {
    //Todo: verificar como fazer injecao de dependencia do ViewModel e repository
    @ObservedObject var viewmodel = CustomerFormViewModel(repository: CustomersRepository())
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        ZStack{
            BackgroudView()
            Form {
                
                TextField("Informe o Nome", text: $viewmodel.name)
                
                TextField("Informe o telefone", text: $viewmodel.phone)
                
                TextField("Informe o cpf", text: $viewmodel.cpf)
                
                DatePicker("Nascimento", selection: $viewmodel.birthDate,displayedComponents: .date)
                    .padding(.bottom)
                
                Picker(selection: $viewmodel.selectedGender, label: Text("Gênero")) {
                    ForEach(0 ..< viewmodel.genders.count) {
                        Text(self.viewmodel.genders[$0])
                    }
                }
                
            }.alert(isPresented: $viewmodel.showingAlert) {
                Alert(title: Text("Atenção"), message: Text(self.viewmodel.alertMessage), dismissButton: .default(Text("OK")))
            }
            
            
        }.padding(.top, 1)
            .navigationBarTitle("Novo Cliente")
            .navigationBarItems(
                trailing: HStack{
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    Button(action: {
                        self.viewmodel.createCustomer()
                    }) {
                        Text("Salvar")
                    }
                }
                
        )
        
        
    }
}

struct CustomerFormPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CustomerFormPage()
        }
    }
}

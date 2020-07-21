//
//  CustomerRowView.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct CustomerRow: View {
    var customer: Cliente
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
            }
            
            Text(customer.Nome)
                .foregroundColor(Color.white)
                .font(.headline)
                .lineLimit(1)
                

            Text("Idade: \(customer.getIdade())")
                .font(.body)
                .foregroundColor(Color.white)
            
        }
        .padding()
    }
}

struct CustomerRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        let customer = Cliente(
            id: UUID(),
            Nome: "Harold Jose de Barros Goncalves",
            Telefone: "41 99275-3127",
            CPF: "926.637.451-20",
            Nascimento: Date(),
            Genero: Gender.Male)
        
        return CustomerRow(customer:customer)
            .background(Color.gray)
    }
}

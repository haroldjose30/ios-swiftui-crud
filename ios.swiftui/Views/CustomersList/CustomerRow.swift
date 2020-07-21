//
//  CustomerRowView.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct CustomerRow: View {
    var customer: Customer
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
            }
            
            Text(customer.Name)
                .font(.headline)
                .lineLimit(1)
                

            Text("Idade: \(customer.getYears())")
                .font(.body)
            
        }
        .padding()
    }
}

struct CustomerRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        let customer = Customer(
            id: "1",
            Name: "Harold Jose de Barros Goncalves",
            Phone: "41 99275-3127",
            CPF: "926.637.451-20",
            Birthdate: "1981-04-30",
            Gender: "Masculino")
        
        return CustomerRow(customer:customer)
    }
}

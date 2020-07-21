//
//  ContentView.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    
    var body: some View {
        
        return NavigationView {
            ZStack {
                BackgroudView()
            }.navigationBarTitle("Menu Principal")
                .navigationBarItems(
                    trailing:
                    HStack(spacing: 40){
                        NavigationLink(destination: CustomersListPage()) {
                            Image(systemName: "person.2.fill")
                            Text("Clientes")
                        }
                        
                        Button(action: {
                            exit(0);
                        }) {
                            HStack {
                                Text("Sair")
                            }
                        }
                        
                    }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE","iPhone XS Max"], id: \.self) { deviceName in
            MainView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

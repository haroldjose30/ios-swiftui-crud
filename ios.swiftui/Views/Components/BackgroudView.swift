//
//  BackgroudView.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import SwiftUI

struct BackgroudView: View {
    var body: some View {
          Image("background")
          .opacity(0.2)
          .frame(width:UIScreen.main.bounds.width,
                 height: UIScreen.main.bounds.height)
          .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroudView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroudView()
    }
}

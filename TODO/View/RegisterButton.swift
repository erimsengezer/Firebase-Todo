//
//  RegisterButton.swift
//  TODO
//
//  Created by Erim Şengezer on 20.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI
import Firebase
struct RegisterButton: View {
    @State var buttonTitle : String
    @State var email : String
    @State var password : String
    var body: some View {
        VStack{
                Text(self.buttonTitle)
                    .fontWeight(.regular)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.04)
                    .shadow(color: Color.black, radius: 1.0)
                    
                    
            
            .background(Color.black)
            .cornerRadius(10.0)
        }
    }
    
}

struct RegisterButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButton(buttonTitle: "RegisterButton", email: "", password: "")
    }
}

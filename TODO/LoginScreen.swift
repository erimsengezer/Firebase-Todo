//
//  LoginScreen.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .fontWeight(.light)
                .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.10)
            
            TextField("Email Adress", text: $email)
                .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.02)
                .padding()
            TextField("Password", text: $password)
                .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.02)
                .padding()
            
            AuthButton(buttonTitle: "Login")
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

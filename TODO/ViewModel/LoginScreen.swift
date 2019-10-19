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
        ZStack{
//            Color(red: 84 / 255, green: 116 / 255, blue: 153 / 255)
            Image("background")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.1)
                .imageScale(.large)
                .scaledToFill()
                .aspectRatio(0.90, contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.10)
                
                HStack{
                    Image("emailicon")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    TextField("Email Adress", text: $email)
                        .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.02)
                        .padding()
                        .foregroundColor(Color.white)

                }.padding()
                
                
                    
                HStack{
                    Image("passwordicon")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    SecureField("Password", text: $password)
                        .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.02)
                        .padding()
                        .foregroundColor(Color.white)
                }
                
                
                
                LoginButton(buttonTitle: "Login")
                    .padding(50)
                
                VStack{
                    Text("Or")
                        .fontWeight(.light)
                        
                    Text("Login with")
                        .padding()
                }
                
                HStack{
                    FacebookButton()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.08)
                    
                    TwitterButton()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.08)
                }


                Button(action: {
                    print("register")
                }){
                    Text("Register")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.05)
                        .foregroundColor(Color.black)
                        .padding()
                }
                
            }
        }
        
    }
    
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

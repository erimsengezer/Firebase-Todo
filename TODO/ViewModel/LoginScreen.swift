//
//  LoginScreen.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        ZStack{
//            Color(red: 84 / 255, green: 116 / 255, blue: 153 / 255)
            Image("secondbackground")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.1)
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.10)
                    .foregroundColor(Color.gray)
                
                HStack{
                    Image("emailicon")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    TextField("Email Adress", text: $email)
                        .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.02)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black.opacity(0.33))
//                        .border(Color(white: 0.75))

                }.padding()
                
                
                    
                HStack{
                    Image("passwordicon")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    SecureField("Password", text: $password)
                        .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.02)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black.opacity(0.33))
                }
                
                Button(action: {
                    self.login()
                }) {
                    LoginButton(buttonTitle: "Login")
                    .padding(50)
                }
                
                
                
                VStack{
                    Text("Or")
                        .fontWeight(.light)
                        
                    Text("Login with")
                        .padding()
                }
                
                HStack{
                    FacebookButton()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                    
                    TwitterButton()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                }


                Button(action: {
                    print("register")
                }){
                    Text("Register")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.05)
                        .foregroundColor(Color.gray)
                        .padding()
                }
                
            }
        }
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: self.email, password: self.password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else {
                print("Login !")
            }
        }
    }
    
    
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LoginScreen()
            
        }
    }
}

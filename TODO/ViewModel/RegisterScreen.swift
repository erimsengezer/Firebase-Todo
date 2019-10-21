//
//  RegisterScreen.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RegisterScreen: View {
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    let db = Firestore.firestore()
    var body: some View {
        ZStack{
            Image("secondbackground").resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.1)
                .scaledToFill()
                .aspectRatio(0.90, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Register")
                   .fontWeight(.heavy)
                   .font(.largeTitle)
                   .foregroundColor(Color.gray)
                   .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.07)
                   
                
                SelectImage().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                
                HStack{
                    Image("user")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    TextField("Username", text: $username)
                        .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.02)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black.opacity(0.33))
                    
                }
                
                HStack{
                    Image("emailicon")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    TextField("Email Address", text: $email)
                        .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.02)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black.opacity(0.33))
                    
                }
                
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
                
//                RegisterButton(buttonTitle: "Register").padding()
                RegisterButton(buttonTitle: "Register", email: email, password: password).onTapGesture {
                    print("else")
                    self.register()
                    
                }
                
                VStack{
                    Text("Or")
                        .fontWeight(.light)
                        .padding(.top, UIScreen.main.bounds.height * 0.01)
                        
                    Text("Login with")
                        .fontWeight(.light)
                }
                
                HStack{
                    FacebookButton()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                    
                    TwitterButton()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                }
                
                
            }
            
           
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: self.email, password: self.password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else {
                var ref : DocumentReference? = nil
                
                let userArray : [String : Any] = ["username" : self.username, "email" : self.email, "useridFromFirebase" : result!.user.uid]
                
                
                ref = self.db.collection("Users").addDocument(data: userArray, completion: { (error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "Error")
                    }
                })
            }
        }
    }
    
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RegisterScreen().previewDevice("iPhone SE")
            RegisterScreen().previewDevice("iPhone 11")
            RegisterScreen().previewDevice("iPhone 11 Pro Max")
        }
        
    }
}

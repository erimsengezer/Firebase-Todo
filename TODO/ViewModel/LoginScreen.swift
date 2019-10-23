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
    @State var loginShow = true
    @State var registerShow = true
    
    var body: some View {
        NavigationView{
            if loginShow{
                ZStack{
                   Image("secondbackground")
                       .resizable()
                       .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.2)
                       .scaledToFill()
                       .aspectRatio(contentMode: .fill)
//                       .edgesIgnoringSafeArea(.all)
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
                        
                        Button(action: {
                            self.facebookLogin()
                        }){
                            FacebookButton()
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                        }
                           

                           TwitterButton()
                               .padding()
                               .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                       }


                       Button(action: {
                        self.loginShow = false
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
            }else {
                    if registerShow{
                        RegisterScreen()
                    }else {
                        ListScreen()
                    }
            }
        }.navigationBarHidden(true)
        
       
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: self.email, password: self.password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else {
                self.loginShow = false
                self.registerShow = false
            }
        }
    }
    
    func facebookLogin(){
        let loginManager = LoginManager()
             
        loginManager.logIn(permissions: ["public_profile","email"], from: self.body as? UIViewController) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }else{
                Profile.loadCurrentProfile { (profile, error) in
                    if error == nil {
                        print("First Name: \(profile!.firstName!)")
                        print("Last Name: \(profile!.lastName!)")
                        print(profile?.imageURL(forMode: .normal, size: CGSize(width: 100, height: 100))! as Any)
                        self.loginShow = false
                        self.registerShow = false
                    }
                }
            }
            guard let accessToken = AccessToken.current else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                }else {
//                                    var ref : DocumentReference? = nil
//
//                                    let userArray : [String : Any] = ["username" : user?.additionalUserInfo?.username, "email" : self.email, "useridFromFirebase" : result!.user.uid]
//
//
//                                    ref = self.db.collection("Users").addDocument(data: userArray, completion: { (error) in
//                                        if error != nil {
//                                            print(error?.localizedDescription ?? "Error")
//                                        }
//                                    })
                }
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

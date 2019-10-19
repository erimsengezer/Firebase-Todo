//
//  SelectImage.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

struct SelectImage: View {
    
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
    var body: some View {
        VStack{
            ZStack {
                if image != nil {
                    image?
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.2)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        .shadow(radius: 15)
                        .onTapGesture {
                            self.openPicker()
                        }
                }else{
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.15)
                        .onTapGesture {
                            self.openPicker()
                    }
                }
                
                
                    if (showImagePicker) {
                        ImagePicker(isShown: $showImagePicker, image: $image)
                    }
                }
            }
            
            
            
        }
    
    func openPicker() {
        withAnimation {
            showImagePicker.toggle()
        }
    
    }
}


struct SelectImage_Previews: PreviewProvider {
    static var previews: some View {
        SelectImage()
    }
}

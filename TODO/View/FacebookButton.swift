//
//  FacebookButton.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI

struct FacebookButton: View {
    var body: some View {
        HStack{
            Button(action: {
                print("facebook")
            }) {
                Image("facebookicon")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton()
    }
}

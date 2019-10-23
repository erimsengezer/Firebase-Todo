//
//  ListScreen.swift
//  TODO
//
//  Created by Erim Şengezer on 24.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI

struct ListScreen: View {
    var body: some View {
        List{
           Text("List Screen")
        }.navigationBarTitle(Text("Lists"))
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}

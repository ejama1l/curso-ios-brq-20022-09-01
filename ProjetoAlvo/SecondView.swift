//
//  SecondView.swift
//  ProjetoAlvo
//
//  Created by user226757 on 9/12/22.
//

import SwiftUI

struct SecondView: View {
    
    @Binding var isShowSecondScreen: Bool
    
    var body: some View {
        Text("Hello, World! Second Screen")
        
        Button("Fechar Tela"){
            isShowSecondScreen = false
        }
    }
    
    
}

//struct SecondView_Previews: PreviewProvider {
//    @State var isShowSecondScreen = true
//
//    static var previews: some View {
//
//        SecondView(isShowSecondScreen : $isShowSecondScreen)
//    }
//}

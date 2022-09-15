//
//  BlueCircleView.swift
//  Navigation
//
//  Created by user226757 on 9/13/22.
//

import SwiftUI

struct BlueCircleView: View {
    var body: some View {
        VStack {
            ZStack{
                RepresentCircle( color : .blue , text : "2")
                
            }
            NavigationLink(destination: GreenCircleView(),
                label: {
                    NavigationText()
                
            })
            
        }

    }
}


struct BlueCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BlueCircleView()
    }
}

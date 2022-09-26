//
//  ContentView.swift
//  CRUD_de_usuarios.swift
//
//  Created by user226757 on 9/20/22.
//

import SwiftUI
import Foundation

struct ContentView : View {
    var body: some View {
       
        
        
        NavigationView{
            VStack{
                Text("Welcome To")
                
                RepresentCircle(color : .purple, text : "MyU")
                    
                
                NavigationLink(destination: MenuMyUser(),
                    label: {
                        NavigationText()
                    
                })
                
                
            }
            
        }
       
            
    }
}


struct RepresentCircle : View {
    var color : Color
    var text : String
    var body: some View {
        
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 70 , weight: .bold))
            
        }
        
    }
    
}

struct NavigationText : View {
    var body: some View {
        Text("Let´s Get Started")
            .frame(width: 250, height: 50)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

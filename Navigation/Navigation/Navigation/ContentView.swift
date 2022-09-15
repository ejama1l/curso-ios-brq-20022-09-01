//
//  ContentView.swift
//  Navigation
//
//  Created by user226757 on 9/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        NavigationView{
            VStack{
                                   
                RepresentCircle(color : .red , text : "1")
                    
                
                NavigationLink(destination: BlueCircleView(),
                    label: {
                        NavigationText()
                    
                })
                
                HomeView()
            }
            
        }
       
            
    }
}

struct HomeView : View {
    var body: some View {
        VStack{
            VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello World!")
            
            }
            .padding()
        
            HStack{
                Button("Login" , action: {})
                    .frame(width: 90, height: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
                Button(action: {} , label: {
                    Label("Esqueci Minha Senha" , systemImage: "key")
                    
                })
                    .frame(width: 200, height: 40)
                    .background(.gray)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
            }
            
            .padding()
            
        }
          
        
    }
    
}

struct RepresentCircle : View {
    var color : Color
    var text : String
    var body: some View {
        
        ZStack {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 70 , weight: .bold))
            
        }
        
    }
    
}

struct NavigationText : View {
    var body: some View {
        Text("Próxima Página")
            .frame(width: 200, height: 50)
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

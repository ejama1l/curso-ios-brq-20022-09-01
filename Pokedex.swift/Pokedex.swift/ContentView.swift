//
//  ContentView.swift
//  Pokedex.swift
//
//  Created by user226757 on 9/26/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let urlAddr : String = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"
    
    
    
    var body: some View {
        VStack {
            
            navigationTitle("Pokedex")
            
            List{
                
                
            }
            
            Button(""){
                
            }
            
            Button(""){
                
            }
            
            Button(""){
                
            }
            
        }
        .padding()
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

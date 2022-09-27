//
//  ContentView.swift
//  PokedexAPI
//
//  Created by user226757 on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    @State var limit = 10
    @State var offset = 0
    @State var page : Int
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                List{
                    
                    ForEach(viewModel.items, id: \.name){ item in
                        
                        Text("\(item.name)")
                    }
                    
                } // List
                
                HStack{
                    Text("Limit \(limit) - Offset \(offset) - Page \(page)")
                }
                
                HStack{
                    Button("Prev"){
                        offset -= limit
                        page += -1
                        
                        viewModel.fetchPokemons(limit: limit, offset: offset)
                        
                    }
                    Button("Forw"){
                        offset += limit
                        
                        viewModel.fetchPokemons(limit: limit, offset: offset)
                        
                    }
                }
            }
            

            
           
            
        } // NavigationView
        
        
    }
    
    func getTotalPages () {
        var p = (1154/limit)
        
        return ( p + 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

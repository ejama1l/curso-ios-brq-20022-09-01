//
//  ContentView.swift
//  ProjVerao2024
//
//  Created by user226757 on 15/09/22.
//

import SwiftUI
import CoreData

/**
 
 @Environment -> serve para instanciar uma variável que está global na nossa aplicação.
 Ex: O gerenciador de objetos do contexto do banco de dados
 
 @FetchRequest é um mecanismo que permite consultar o objetos que estão armazenado no CoreData,
 inclusive com ordenação
 
 SortDescriptor serve para descrever como vc quer ordenar os dados
 
 */

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest ( sortDescriptors: [SortDescriptor(\.date, order : .reverse)] ) var food: FetchedResults<Food>
    
    @State var isAddView : Bool = false
    
    var body: some View {

        NavigationView{
            VStack{
                
                Text("\(Int( getTotalCalories() ) ) Calorias Totais")
                    .foregroundColor(.gray)
                    .padding()
                
                List{

                    ForEach(food) { foodElement in
                        
                        NavigationLink(destination: EditFoodView ( isAddView: $isAddView, food: foodElement ) ) {
                            
                            Text(foodElement.name ?? "")
                                .bold()
                            
                        }
                        
                    }
                }// list
                
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            isAddView = true
                        } label: {
                            Label("Add Label", systemImage: "plus.circle")
                        }
                    }
                }// toolbar
                .sheet(isPresented: $isAddView){
                    AddFoodView()
                }// sheet
            }// Vstack

        
        }// NavigationView
        
    }// body
    
    func getTotalCalories() -> Double{
                
        return 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

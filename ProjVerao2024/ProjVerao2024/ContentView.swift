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
                        
                        NavigationLink(destination: EditFoodView( isAddView: $isAddView, food: foodElement )){
                            
                            FoodDetailView(foodName: foodElement.name ??  "", foodCalories: foodElement.calories, foodDate: foodElement.date ?? Date())
                            
                        }// NavigationLink
                        
                    } // Foreach
                    .onDelete(perform: deleteFood )
                }// list
                .navigationTitle( "ALScalories" )
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
    
    func deleteFood(offset:IndexSet) {
        DataController().deleteFood(offsets: offset, context: managedObjectContext, food: food)
    } // deleteFood
    
    func getTotalCalories() -> Double{
        
        // ler todos os elementos da lista e somar as calorias
        
        var sum : Double = 0.0
        
        for item in food{
            
            if let myDate = item.date{
                // se a data do item da comiga for igual a hj, então somo as calorias
                if Calendar.current.isDateInToday(myDate){
                    sum += item.calories
                }
            }
            // Kcal
        }
        
        return sum
    } // getTotalCalories
    
    // 30 segundos atrás
    
    
}

struct FoodDetailView : View{
    
    var foodName : String = ""
    var foodCalories : Double = 0.0
    var foodDate : Date = Date()
    
    var body: some View{
        
        HStack{
            
            // nome e calorias um embaixo do outro
            VStack(alignment: .leading, spacing: 5){
                Text(foodName )
                    .bold()
                
                Text("\(Int(foodCalories))  ") + Text("calories").foregroundColor(.red)
            }// VSTACK
            
            Spacer()
            
            Text( calcTimeSince(date:foodDate) )
            
            
        }// HStack
    }
}

func calcTimeSince(date : Date) -> String{
    
    // return date.formatted()
    
    // quantos minutos se passaram da data de parâmetro até agora
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes / 60
    let days = hours / 24
    
    if minutes < 120 {
        return "\(minutes) minutos atrás"
    }
    else if (minutes >= 120 && hours < 48){
        return "\(hours) horas atrás"
    }
    else {
        return "\(days) dias atrás"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  EditFoodView.swift
//  ProjVerao2024
//
//  Created by user226757 on 9/19/22.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    /**
        name e calories são responsáveis por pegar a alteração dos valores feitas no TextFiedl
     */
    @State var name : String = ""
    @State var calories : Double = 0.0
    
    @Binding var isAddView : Bool
    
    /**
        Variável responsável por receber o elemento a ser editado no 'formato' CoreData
    */
    var food: FetchedResults<Food>.Element
    
    var body: some View {
        Form{
            Section{
                TextField("Food Name", text: $name )
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10 )
                }.padding()
                
                    .onAppear(){
                        if let name = food.name{
                            self.name = name
                        }
                        
                        self.calories = food.calories
                    }
                
                HStack{
                    Button("Submit"){
                        DataController().editFood(foodOld: food, name: self.name, calories: self.calories, context: managedObjectContext )
                        
                        isAddView = false
                        //dismiss()
                    }
                }
            }// Section
        }// Form
    }
}

//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView()
//    }
//}

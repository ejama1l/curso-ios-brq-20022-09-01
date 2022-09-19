//
//  AddFoodView.swift
//  ProjVerao2024
//
//  Created by user226757 on 9/16/22.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    //@Binding var isAddView : Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Form{
            Section{
                TextField("Food Name", text: $name )
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10 )
                }.padding()
                
                HStack{
                    Button("Submit"){
                        DataController().addFood(name: name, calories: calories, context: managedObjectContext )
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}

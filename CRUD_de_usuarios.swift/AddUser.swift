//
//  AssUser.swift
//  CRUD_de_usuarios.swift
//
//  Created by user226757 on 9/22/22.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name : String = ""
    @State var password : String = ""
    @State var email : String = ""
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Form{
            Section{
                TextField("Name", text: $name )
                
                VStack{
                    TextField("Password", text: $password)
                    TextField("Email", text: $email )


                }.padding()
                
                HStack{
                    Button("Submit"){
                        DataController().addUser(name: name, email: email, password: password, context: managedObjectContext )
                        
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

//
//  EditUser.swift
//  CRUD_de_usuarios.swift
//
//  Created by user226757 on 9/22/22.
//

import SwiftUI

struct EditUserView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    
    @State var name : String = ""
    @State var email : String = ""
    @State var password : String = ""
    
    @Binding var isAddView : Bool
    
  
    var user: FetchedResults<Users>.Element
    
    var body: some View {
        Form{
            Section{
                TextField("User Name", text: $name )
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                padding()
                
                    .onAppear(){
                        
                        if let name = user.name{
                            self.name = name
                        }
                        if let email = user.email{
                            self.email = email
                        }
                        if let password = user.password{
                            self.password = password
                        }
                        
                        
                    }.padding()
                
                HStack{
                    Button("Edit"){
                        DataController().editUser(userOld: user, name: self.name, email: self.email, password: self.password, context: managedObjectContext )
                        
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

//struct EditUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditUserView()
//    }
//}

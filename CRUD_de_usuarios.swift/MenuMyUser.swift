//
//  MenuMyUser.swift
//  CRUD_de_usuarios.swift
//
//  Created by user226757 on 9/22/22.
//

import SwiftUI
import CoreData
import Foundation



struct MenuMyUser : View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest ( sortDescriptors: [SortDescriptor(\.date, order : .reverse)] ) var user: FetchedResults<Users>
    
    @State var isAddView : Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                List{
                    
                    ForEach(user) { userElement in
                        
                        NavigationLink(destination: EditUserView (isAddView: $isAddView, user : userElement)){
                            
                            UserDetailView(userName: userElement.name ??  "", userDate: userElement.date ?? Date())
                            
                        }
                        
                    }
                   
                }
                .navigationTitle( "MyUsers" )
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            isAddView = true
                        } label: {
                            Label("Add Label", systemImage: "plus.circle")
                        }
                    }
                }
                .sheet(isPresented: $isAddView){
                    AddUserView()
                }
            }
            
            
        }
        
    }
    
    
}




struct UserDetailView : View{
    
    var userName : String = ""
    var userPassword : String = ""
    var userDate : Date = Date()
    
    var body: some View{
        
        HStack{
            
            VStack(alignment: .leading, spacing: 5){
                Text(userName )
                    .bold()
                
               
            }
            
            Spacer()
            
            Text( calcTimeSince(date: userDate) )
            
            
        }
    }
}

func calcTimeSince(date : Date) -> String{
    
    
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

struct MenuMyUser_Previews: PreviewProvider {
    static var previews: some View {
        MenuMyUser()
    }
}


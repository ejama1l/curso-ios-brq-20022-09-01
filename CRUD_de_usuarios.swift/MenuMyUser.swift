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
    
    @FetchRequest ( sortDescriptors: [SortDescriptor(\.date, order : .reverse)] ) var users: FetchedResults<Users>
    
    @State var isAddView : Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                List{
                    
                    ForEach(users) { userElement in
                        
                        NavigationLink(destination: EditUser( isAddView: $isAddView, users: userElement )){
                            
                            UserDetailView(foodName: userElement.name ??  "", userDate: userElement.date ?? Date())
                            
                        }
                        
                    }
                    .onDelete(perform: deleteUser )
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
                }// toolbar
                .sheet(isPresented: $isAddView){
                    AddUser(isAddView: $isAddView)
                }
            }
            
            
        }
        
    }
    
    
}

func deleteUser(offset:IndexSet) {
    DataController().deleteUser(offsets: offset, context: managedObjectContext, user: Users)
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
            
            
        }// HStack
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

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


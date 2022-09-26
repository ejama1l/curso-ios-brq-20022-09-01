//
//  DataController.swift
//  CRUD_de_usuarios.swift
//
//  Created by user226757 on 9/22/22.
//

import Foundation
import CoreData
import SwiftUI

class DataController{
    
    let container = NSPersistentContainer(name: "UserModel")
      
      init(){
          container.loadPersistentStores  { description, error in
              if let errorIfLet = error{
                  print("Erro ao carregar os dados \(errorIfLet)")
              }
              
          }
      }
    
    
    func save(context: NSManagedObjectContext){
        do{
            
            try context.save()
        }
        catch {
            
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
        
    func deleteUser(offsets: IndexSet, context: NSManagedObjectContext, user: FetchedResults<Users>){
         

            offsets.map{ user[$0] }
                .forEach( context.delete )
            
            save(context: context)
        }
        
    
    func addUser(name: String, email: String,password: String , context : NSManagedObjectContext){
            
        let user = Users(context: context)
            
        user.name = name
        user.password = password
        user.email = email
        user.date = Date()
        user.id = UUID()
        
            save(context: context)
        }
    
    func editUser(userOld: Users , name: String, email: String, password: String , context: NSManagedObjectContext){
            
            
            userOld.name = name
            userOld.password = password
            userOld.date = Date()
            userOld.email = email
        
            save(context: context)
        }
}

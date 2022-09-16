//
//  DataController.swift
//  ProjVerao2024
//
//  Created by user226757 on 9/15/22.
//

import Foundation
import CoreData

/**
 
 Data Controller vai ser uma classe que vai agrupar as funções que vai permitir manipular os dados :
 save() - permite salvar os dados no banco de dados do CoreData
 update() - permite alterar os dados no banco de dados do CoreData

 CRUD : Create, Read ( ler tudo ou apenas um registro ), Update, Delete
 
 Um contexto no CoreData esta relacionado a quais entidades o mesmo pode gerenciar : fazer CRUD das mesmas
 
 */

class DataController {
    
    func save(context: NSManagedObjectContext){
        do {
            // try - catch
           try context.save()
        }
        catch{
            let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }


    /**
                            UUID, name, date, calories
     */
    func addFood(name: String, calories: Double, context: NSManagedObjectContext){
        
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
        
        save(context: context)
    }
    
    
    func editFood(){
        
    }
}

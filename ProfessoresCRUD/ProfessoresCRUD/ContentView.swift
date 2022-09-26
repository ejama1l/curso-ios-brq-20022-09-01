//
//  ContentView.swift
//  ProfessoresCRUD
//
//  Created by user226757 on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    @Binding var isAddView : Bool
    
    
    var body: some View {
        
        VStack{
            NavigationView{
                
                List{
                    
                    /**
                        o parâmetro id é utilizado para saber como identificar unicamente cada objeto. Para isso, ele espera qual atributo do PROFESSORMODEL possa ser utilizado para esta identificação. Então, temos que usar o  \.NOMEDAVARIAVEL.
                     */
                    ForEach(viewModel.items, id: \.id){ item in
                        
                        VStack{
                            Text("\(item.nome)")
                        }// Vstack
                    }// Foreach
                    .onDelete(perform: deleteProfessores)
                    
                } // List
                
                .toolbar{
                     AddProfessor()
                }
            } // NavigationView
        }// VSTACK
    } // body
    
    /**
     IndexSet é uma estrutura que retorna quais elementos foram selecionados para deletarmos
     */
    func deleteProfessores(offset : IndexSet){
        
        // eu posso ter um Array de IDs para ver excluídos Ex: [1, 500]
        let idsArray = offset.map({
            // pego o id do projeto que precido deletar através do índice do vetor selecionado pelo usuário, que está no indexSet
            viewModel.items[$0].id
            
        }
        )
        
        /**
            Para cada elemento (id do professor) que queremos deletar,
                    temos que fazer uma requisição para a API
         */
        // idsArray = [4,7]
        for i in idsArray{
            viewModel.deleteProfessores(id: i)
        }
                
    }
}

struct ButtonsTestView : View{
    
    var body: some View{
        
        
        Button("Add"){
            ViewModel().createProfessor(nome: "Fabrizio V", email: "TTT7")
        }
        
        Button("Update"){
            ViewModel().updateProfessores(id: 630, nome: "Fabrizio GGGG", email: "YJFJFK")
        }
        
        Button("Delete"){
            ViewModel().deleteProfessores(id: 630)
        }
        Button("Stress Button"){
            ViewModel().fetchProfessores()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

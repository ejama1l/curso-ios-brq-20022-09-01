//
//  EditProfessores.swift
//  ProfessoresCRUD
//
//  Created by user226757 on 9/27/22.
//

import SwiftUI

struct EditProfessorView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome : String = ""
    @State var email : String = ""
    
    // vai receber o objeto a ser alterado
    @State var professor : ProfessorModel
    
    var body: some View {
        
        Form{
            Section {
                
                VStack{
                    Text("Nome")
                    TextField("Nome", text: $nome)
                } // VStack
                
                Spacer()
                
                VStack{
                    Text("Email")
                    TextField("Email", text: $email)
                } // VStack
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button("Editar"){
                        
                        viewModel.updateProfessores(id: professor.id, nome: nome, email: email)
                        
                        // para fechar o modal
                        dismiss()
                    } // Button
                }//HStack
                .onAppear(perform: {
                    self.nome = professor.nome
                    self.email = professor.email
                })

            } // Section
        } // Form
    }
}

//struct EditProfessorView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfessorView()
//    }
//}

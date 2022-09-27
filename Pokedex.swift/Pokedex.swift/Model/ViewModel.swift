//
//  ViewModel.swift
//  Pokedex.swift
//
//  Created by user226757 on 9/27/22.
//

import Foundation

struct ViewModel : ObservableObject{
    
    @Published var items : [PokemonModel] = []
    
    func fetchPokemons(urlAddr : String){
        
        guard let url = URL(string : urlAddr) else {
            print("error ao montar a URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            
            if error != nil{
                print(error)
                return
            }
            
            do {
                
                if let data = data{
                    let result = try JSONDecoder().decode(PokemonResult.self, from: data)
                    self.items = result.results
                }
            }
            catch {
                print("erro ao acessar a API")
            }
        }
        
    }
    
}

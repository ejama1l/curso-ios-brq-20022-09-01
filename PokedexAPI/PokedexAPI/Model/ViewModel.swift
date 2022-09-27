//
//  ViewModel.swift
//  PokedexAPI
//
//  Created by user226757 on 9/27/22.
//

import Foundation


class ViewModel : ObservableObject {
    
    @Published var items : [PokemonModel] = []
    
    init(){
        fetchPokemons(limit: 10, offset: 0)
    }
    
    func fetchPokemons(limit : Int, offset: Int){
        
        // url
        
        guard let url = URL( string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)") else {
            print("error ao montar a URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                
                if let data = data {
                    let result = try JSONDecoder().decode(PokemonResult.self, from: data)
                    self.items = result.results
                }
            }
            catch {
                print("erro ao acessar a API")
            }
            
        }.resume()
        
    }
}

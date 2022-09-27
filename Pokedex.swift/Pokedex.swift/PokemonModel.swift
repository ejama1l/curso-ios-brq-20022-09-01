//
//  PokemonModel.swift
//  Pokedex.swift
//
//  Created by user226757 on 9/26/22.
//

import Foundation

struct PokemonModel {
    
    var name : String = ""
    var url : String = ""
    
}


struct PokemonData : Decodable {
    
    var count : Int = 0
    var next : String = ""
    var previous : String = ""
    
    var results : [PokemonData] = []
    
    
}

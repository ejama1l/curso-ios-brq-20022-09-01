//
//  PokemonresultModel.swift
//  Pokedex.swift
//
//  Created by user226757 on 9/27/22.
//

import Foundation

struct PokemonModel{
    var name : String = ""
    var url : String = ""
}

struct PokemonResult : Codable{
    var count : Int
    var results : [PokemonModel] = []
}

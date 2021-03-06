//
//  Pokemon.swift
//  Pokedex
//
//  Created by dev on 8/23/18.
//  Copyright © 2018 dev. All rights reserved.
//

import Foundation

class Pokemon{
    var _name:String!
    var _pokedexId:Int!
    var _type:String!
    var _height:Int!
    var _weight:Int!
    var _baseExperience:Int!
    var _nextEvolPokemon:Int!
    var _nextNextEvolPokemon:Int!
    var _pokemonURL:String!
    
    var nextNextEvolPokemon:Int{
        if _nextNextEvolPokemon == nil{
            return 0
        }
        return _nextNextEvolPokemon
    }
    
    var nextEvolPokemon:Int{
        if _nextEvolPokemon == nil{
            return 0
        }
        return _nextEvolPokemon
    }
    
    var baseExperience:Int{
        if _baseExperience == nil{
            return 0
        }
        return _baseExperience
    }
    
    var height:Int{
        if _height == nil{
            return 0
        }
        return _height
    }
    
    var weight:Int{
        if _weight == nil{
            return 0
        }
        return _weight
    }
    
    var type:String{
        if _type == nil{
            return ""
        }
        return _type
    }
    
    var name:String {
        return _name;
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(BASE_URL)\(POKEMON_URl)\(pokedexId)"
    }
}

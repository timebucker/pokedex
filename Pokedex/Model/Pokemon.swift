//
//  Pokemon.swift
//  Pokedex
//
//  Created by dev on 8/23/18.
//  Copyright © 2018 dev. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon{
    var _name:String!
    var _pokedexId:Int!
    var _type:String!
    var _height:Int!
    var _weight:Int!
    var _baseExperience:Int!
    var _nextEvolTxt:String!
    var _pokemonURL:String!
    
    var nextEvolTxt:String{
        if _nextEvolTxt == nil{
            return ""
        }
        return _nextEvolTxt
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

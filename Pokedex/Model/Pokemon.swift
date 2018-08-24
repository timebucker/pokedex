//
//  Pokemon.swift
//  Pokedex
//
//  Created by dev on 8/23/18.
//  Copyright © 2018 dev. All rights reserved.
//

import Foundation

class Pokemon{
    private var _name:String!
    private var _pokedexId:Int!
    
    var name:String {
        return _name;
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
}

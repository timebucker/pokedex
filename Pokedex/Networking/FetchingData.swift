//
//  FetchingData.swift
//  Pokedex
//
//  Created by dev on 8/29/18.
//  Copyright © 2018 dev. All rights reserved.
//

import Foundation
import Alamofire

class FetchingData{
    static func fetchData(pokemon: Pokemon, completed: @escaping ()->()) {
        Alamofire.request(pokemon._pokemonURL).responseJSON { response in
            guard let dict = response.result.value as? Dictionary<String, AnyObject> else{return}
            
            guard let weight = dict["weight"] as? Int else{return}
            pokemon._weight = weight
            
            guard let height = dict["height"] as? Int else{return}
            pokemon._height = height
            
            guard let base_ex = dict["base_experience"] as? Int else{return}
            pokemon._baseExperience = base_ex
            
            guard let temp = dict["types"] as? [Dictionary<String, AnyObject>] else{return}
            guard let types = temp[0]["type"]!["name"] as? String else {return}
            pokemon._type = types.capitalized
            
            if (temp.count > 1){
                for i in 1..<temp.count{
                    guard let types = temp[i]["type"]!["name"] as? String else {return}
                    pokemon._type.append("/\(types.capitalized)")
                }
            }
            completed()
        }
    }
}

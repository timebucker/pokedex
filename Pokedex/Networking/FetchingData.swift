//
//  FetchingData.swift
//  Pokedex
//
//  Created by dev on 8/29/18.
//  Copyright © 2018 dev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchingData{
    static func fetchData(pokemon: Pokemon, completed: @escaping ()->()) {
        Alamofire.request(pokemon._pokemonURL).responseJSON { response in
            if response.result.isSuccess{
                
                if let dict:JSON = JSON(response.result.value!){
                    
                    if let weight = dict["weight"].int{
                        pokemon._weight = weight
                    }
                    
                    if let height = dict["height"].int{
                        pokemon._height = height
                    }
                    
                    if let base_ex = dict["base_experience"].int {
                        pokemon._baseExperience = base_ex
                    }
                    
                    if let types = dict["types"][0]["type"]["name"].string{
                        pokemon._type = types.capitalized
                        var count = dict["types"].count
                        
                        if (count > 1){
                            for i in 1..<count{
                                if let temp = dict["types"][i]["type"]["name"].string{
                                    pokemon._type.append("/\(temp.capitalized)")
                                }
                            }
                        }
                    }
                    
                    
                    completed()
                }
                else{
                    print("Error \(response.result.error)")
                }
            }
        }
    }
}

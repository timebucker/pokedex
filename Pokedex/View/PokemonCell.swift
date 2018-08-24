//
//  PokeCell.swift
//  Pokedex
//
//  Created by dev on 8/23/18.
//  Copyright © 2018 dev. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    var pokemon:Pokemon!
   
    
    @IBOutlet weak var ImgPokemon: UIImageView!
    @IBOutlet weak var lblPokemonName: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        
    }
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        self.lblPokemonName.text = self.pokemon.name
       self.ImgPokemon.image = UIImage(named: "\(pokemon.pokedexId)")
    }

}

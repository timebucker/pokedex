//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by dev on 8/26/18.
//  Copyright © 2018 dev. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonDetailVC: UIViewController {

    var pokemon:Pokemon!
    var musicPLayer: AVAudioPlayer!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblPokedexId: UILabel!
    @IBOutlet weak var lblBaseEx: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblNextEvol: UILabel!
    @IBOutlet weak var imgNextNextEvol: UIImageView!
    @IBOutlet weak var imgNextEvol: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = self.pokemon.name
        lblPokedexId.text = String(self.pokemon.pokedexId)
        imgPokemon.image = UIImage(named: "\(pokemon.pokedexId)")
        
        FetchingData.fetchData(pokemon: pokemon) {
            self.updateUI()
        }
        
        initAudio()
    }
    
    func updateUI(){
        self.lblBaseEx.text = String(pokemon.baseExperience)
        self.lblHeight.text = String(pokemon.height)
        self.lblWeight.text = String(pokemon.weight) 
    }
    
    func initAudio(){
        var path = Bundle.main.path( forResource: "music", ofType: "mp3")!
        do{
            musicPLayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            musicPLayer.prepareToPlay()
            musicPLayer.numberOfLoops = -1
            musicPLayer.play()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }

    @IBAction func btnMusic(_ sender: Any) {
        if musicPLayer.isPlaying{
            musicPLayer.pause()
            (sender as! UIButton).alpha = 0.2
        }
        else{
            musicPLayer.play()
            (sender as! UIButton).alpha = 1.0
        }
    }
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

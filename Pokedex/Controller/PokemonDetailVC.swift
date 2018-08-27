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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = self.pokemon.name
        
        initAudio()
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
            sender.alpha = 0.2
        }
        else{
            musicPLayer.play()
            sender.alpha = 1.0
        }
    }
    

}

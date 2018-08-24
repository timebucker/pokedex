//
//  ViewController.swift
//  Pokedex
//
//  Created by dev on 8/22/18.
//  Copyright © 2018 dev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionPokemon: UICollectionView!
    var pokemons = [Pokemon]()
    var musicPLayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionPokemon.dataSource = self
        collectionPokemon.delegate = self
        
        parsePokemonCSV()
        initAudio()
        
    }
    
    func parsePokemonCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{
                let id = Int(row["id"]!)
                let name = row["identifier"]
                let poke = Pokemon(name: name!, pokedexId: id!)
                pokemons.append(poke)
            }
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    func initAudio(){
        var path = Bundle.main.path( forResource: "music", ofType: "mp3")!
        do{
            musicPLayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            //musicPLayer.prepareToPlay()
            musicPLayer.numberOfLoops = -1
            musicPLayer.play()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell {
            let pokemon = pokemons[indexPath.row]
            cell.configureCell(pokemon: pokemon)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    @IBAction func btnMusic(_ sender: UIButton) {
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


//
//  PokedexViewController.swift
//  PokemonGo
//
//  Created by Alejandro Mendoza on 5/06/17.
//  Copyright © 2017 mendoza. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pokemonsAtrapados:[Pokemon] = []
    var pokemonsNoAtrapados:[Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonsAtrapados = obtenerPokemonsAtrapados()
        pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
    }
    
    @IBAction func mapTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}

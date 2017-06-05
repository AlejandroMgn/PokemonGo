//
//  ViewController.swift
//  PokemonGo
//
//  Created by Alejandro Mendoza on 5/06/17.
//  Copyright © 2017 mendoza. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var ubicacion = CLLocationManager()
    var contActualizaciones:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ubicacion.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }
        //ubicacion.requestWhenInUseAuthorization()
        //mapView.showsUserLocation = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Ubicacion actualizada!")
        if (contActualizaciones < 1) {
            let region = MKCoordinateRegionMakeWithDistance(ubicacion.location!.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }else{
           ubicacion.stopUpdatingLocation()
        }
    }
    
    @IBAction func centrarTapped(_ sender: Any) {
        
        if let coord = ubicacion.location?.coordinate{
            let region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
        
    }


}


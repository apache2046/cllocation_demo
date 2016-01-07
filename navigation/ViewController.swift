//
//  ViewController.swift
//  navigation
//
//  Created by apache on 1/7/16.
//  Copyright © 2016 apache. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager!

    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!

    @IBOutlet weak var HorizontalAccLabel: UILabel!
    @IBOutlet weak var VerticalAccLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //locationManager.locationServicesEnabled
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        longitudeLabel.text = "Longitude: \(location.coordinate.longitude)"
        latitudeLabel.text = "Latitude: \(location.coordinate.latitude)"
        HorizontalAccLabel.text = "HorizontalAcc: \(location.horizontalAccuracy)"
        VerticalAccLabel.text = "VerticalAcc: \(location.verticalAccuracy)"
        time.text = "Update: \(location.timestamp)"


    }

}


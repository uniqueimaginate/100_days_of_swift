//
//  ViewController.swift
//  Project22
//
//  Created by Peter on 2022/03/19.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    var detected1 = false
    var detected2 = false
    
    @IBOutlet weak var distanceReading: UILabel!
    @IBOutlet weak var distanceReading2: UILabel!
    
    
    @IBOutlet weak var circle1: UIView! {
        didSet {
            circle1.layer.cornerRadius = 128
        }
    }
    @IBOutlet weak var circle2: UIView! {
        didSet {
            circle2.layer.cornerRadius = 128
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
                
        if let beacon = beacons.first(where: {$0.uuid.uuidString == "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5"}) {
        
            if !detected1 {
                let ac = UIAlertController(title: "iBeacon!", message: "First Beacon Detected", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                detected1.toggle()
                present(ac, animated: true)
            }
            update(distance: beacon.proximity, label: self.distanceReading, circle: circle1)
            
        } else if let beacon = beacons.first(where: {$0.uuid.uuidString == "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"}) {
            
            if !detected2 {
                let ac = UIAlertController(title: "iBeacon!", message: "First Beacon Detected", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                detected2.toggle()
                present(ac, animated: true)
            }
            update(distance: beacon.proximity, label: self.distanceReading2, circle: circle2)
            
        } else {
            update(distance: .unknown, label: self.distanceReading, circle: circle1)
            update(distance: .unknown, label: self.distanceReading2, circle: circle2)
        }
        
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        let uuid2 = UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        let beaconRegion2 = CLBeaconRegion(proximityUUID: uuid2, major: 123, minor: 456, identifier: "MyBeacon2")
        
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
        
        locationManager?.startMonitoring(for: beaconRegion2)
        locationManager?.startRangingBeacons(in: beaconRegion2)
    }
    
    func update(distance: CLProximity, label: UILabel, circle: UIView) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .far:
                label.text = "FAR"
                circle.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                
            case .near:
                label.text = "NEAR"
                circle.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
            case .immediate:
                label.text = "RIGHT HERE"
                circle.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
            default:
                label.text = "UNKNOWN"
                circle.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }
        }
    }
}


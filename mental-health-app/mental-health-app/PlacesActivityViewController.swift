//
//  PlacesActivityViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/13/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.


import UIKit
import MapKit
import CoreLocation

class PlacesActivityViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!

    var currMood : String?
    
    var activityQuery: [String : String] = [
        "If you're feeling tired..." : "coffee",
        "If you're feeling adventurous..." : "adventure",
        "If you're hungry" : "restaurant",
        "If you want to relax..." : "yoga"]

    var searchWord : String?
   
    var matchingItems: [MKMapItem] = [MKMapItem]()

    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchWord = activityQuery[currMood!]

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
        performSearch()
        
        self.locationManager.stopUpdatingLocation()
    }
    
    
    // MARK - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.08, 0.08)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    
    func performSearch() {
        
        matchingItems.removeAll()
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchWord
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil {
                print("Error occured in search: \(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                print("Matches found")
                
                for item in response!.mapItems {
                    self.matchingItems.append(item as MKMapItem)
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("Error: " + error.localizedDescription)
    }
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



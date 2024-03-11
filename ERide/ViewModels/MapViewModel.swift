//
//  MapViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/11/24.
//

/*
 
 In PList add (Privacy: location when in use) also add reason for request
 when runing simulator select features and change location if needed
 hold option to zoom
 
 */
 
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 9.0586, longitude: 7.489)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation , span: MapDetails.defaultSpan )
    
    var locationManager: CLLocationManager?
    
    // MARK: Function to check if the users phone location is on
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager() // calls locationManagerDidChangeAuthorization function
            locationManager!.delegate = self
        } else {
            print("Location is off, turn it on")
        }
    }
    
    // MARK: Function to check if user authorized location for the app
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted")
        case .denied:
            print("You have denied this app access to your location, go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            if let userLocation = locationManager.location {
                region = MKCoordinateRegion(center: userLocation.coordinate, span: MapDetails.defaultSpan)
            } else {
                print("User location is nil")
            }
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}


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
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation , span: MapDetails.defaultSpan )
    
    var locationManager: CLLocationManager?
    
    // MARK: Function to check if the users phone location is on
    func checkIfLocationServicesIsEnabled() {locationManager = CLLocationManager()
        locationManager!.delegate = self

        // Request authorization status asynchronously
        locationManager!.requestWhenInUseAuthorization()
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
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}


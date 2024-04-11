//
//  MapView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/28/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapViewModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $mapViewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .tint(Color(.systemBlue))
            .onAppear {
                NotificationManager.instance.requestAuthorization()
                mapViewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

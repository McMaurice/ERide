//
//  ContentView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/11/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

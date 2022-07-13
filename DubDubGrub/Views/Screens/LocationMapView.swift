//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 12/28/21.
//

import Combine
import SwiftUI
import MapKit

struct LocationMapView: View {
    
   
    @State private var cancellables = Set<AnyCancellable>()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var alertItem: AlertItem?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            VStack {
                LogoView()
                    .shadow(radius: 10)
                Spacer()
                
            }
        }
        .alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            CloudKitManager.getLocations().sink { completion in
                if case .failure(_) = completion {
                    alertItem = AlertContext.unableToGetLocations
                }
            } receiveValue: { location in
                print(location)
            }.store(in: &cancellables)

        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}

struct LogoView: View {
    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 70)
    }
}

//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 12/28/21.
//

import SwiftUI

struct LocationListView: View {
    @State private var locations = [DDGLocation(record: MockData.location)]
    var body: some View {
        NavigationView {
            List {
                ForEach(locations, id: \.ckRecordID) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        LocationCell(location: location)
                    }
                }
            }
            .navigationTitle("Grub Spots")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}

struct LocationCell: View {
    var location: DDGLocation
    
    var body: some View {
        HStack {
            Image("default-square-asset")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.vertical, 8)
        
            VStack(alignment: .leading) {
                Text(location.name ?? "N/A")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                
                HStack {
                    AvatarView(size: 35)
                }
            }
            .padding(.leading, 10)
        }
    }
}

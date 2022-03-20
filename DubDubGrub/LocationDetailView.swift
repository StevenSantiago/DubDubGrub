//
//  LocationDetailView.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 12/31/21.
//

import SwiftUI

struct LocationDetailView: View {
    var body: some View {
        VStack(spacing: 16) {
            BannerImageView(imageName: "default-banner-asset")
            
            HStack {
                AddressView(address: "123 Main Street")
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                DescriptionView(description: "Some Description")
                
                
                ZStack {
                    Capsule(style: .circular)
                        .frame(height: 80)
                        .foregroundColor(Color(.secondarySystemBackground))
                    
                    HStack {
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .brandPrimary, imageName: "location.fill")
                        }
                        
                        Link(destination: URL(string: "https://www.apple.com")!) {
                            LocationActionButton(color: .brandPrimary, imageName: "globe")
                        }
                        
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .brandPrimary, imageName: "phone.fill")
                        }
                        
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .brandPrimary, imageName: "person.fill.xmark")
                        }
                        
                        
                    }
                }
                .padding(.horizontal)
                
                
                Text("Who's Here?")
                    .bold()
                    .font(.title2)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), content: {
                    FirstNameAvatarView(firstName: "Kelly")
                    FirstNameAvatarView(firstName: "Kelly")
                    FirstNameAvatarView(firstName: "Kelly")
                })
            }
        
            Spacer()
            
        }
        .navigationTitle("Location Name")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func signIn() {
        print("Test")
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        LocationDetailView()
       }
    }
}

struct LocationActionButton: View {
    var color: Color
    var imageName: String
    var body: some View {
        ZStack {
            Circle()
                .frame(height: 65)
                .foregroundColor(color)
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    var firstName: String
    
    var body: some View {
        VStack {
            AvatarView(size: 64)
            Text(firstName)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}

struct BannerImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct AddressView: View {
    var address: String
    var body: some View {
        Label(address, systemImage: "mappin.and.ellipse")
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct DescriptionView: View {
    var description: String
    var body: some View {
        Text(description)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .frame(height: 70)
            .padding(.horizontal)
    }
}

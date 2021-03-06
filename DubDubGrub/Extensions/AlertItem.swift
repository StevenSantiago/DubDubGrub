//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 5/6/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"), message: Text("Unable to retrieve locations at this time. \nPlease try again."), dismissButton: .default(Text("Ok")))
}

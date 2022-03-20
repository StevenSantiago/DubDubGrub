//
//  View+Ext.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 3/19/22.
//

import SwiftUI

extension View {
    func profileNameStyle() -> some View  {
        self.modifier(ProfileNameText())
    }
}

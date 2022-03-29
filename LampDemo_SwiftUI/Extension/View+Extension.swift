//
//  View+Extension.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 21/03/2022.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

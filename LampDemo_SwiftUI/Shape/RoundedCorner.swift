//
//  CornerShape.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 21/03/2022.
//

import SwiftUI
// Speed code for this shape is in Dessert App Speed Code 
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

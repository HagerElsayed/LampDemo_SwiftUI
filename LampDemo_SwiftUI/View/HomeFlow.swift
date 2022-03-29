//
//  Main.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 21/03/2022.
//

import SwiftUI

struct HomeFlow: View {
    @Namespace private var namespace
    @State private var isDetails = false
    @State var detailData: Lamp = Lamp.list[0]
    
    var body: some View {
        ZStack {
            if isDetails {
                LampDetails(namespace: namespace, detailsData: $detailData, isDetails: $isDetails)
            } else {
                Home(namespace: namespace, detailsData: $detailData, isDetails: $isDetails)
            }
        }
       
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        HomeFlow()
    }
}

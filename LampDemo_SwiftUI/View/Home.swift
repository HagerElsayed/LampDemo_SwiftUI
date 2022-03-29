//
//  Home.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 22/03/2022.
//

import SwiftUI

struct Home: View {
    @Binding var lamp: Lamp
    @Binding var isDetails: Bool
    let namespace: Namespace.ID
    init(
        namespace: Namespace.ID = Namespace().wrappedValue,
        detailsData: Binding<Lamp> = .constant(Lamp.list[0]),
        isDetails: Binding<Bool> = .constant(false)
    ) {
        self._lamp = detailsData
        self._isDetails = isDetails
        self.namespace = namespace
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                WelcomeView()
                SearchView()
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 150), spacing: 20)
                    ],
                    spacing: 25
                ) {
                    ForEach(Lamp.list, id: \.self) { lamp in
                        // MARK: - LAMPItemView
                        LampItemView(lamp: lamp, namespace: namespace)
                            .matchedGeometryEffect(id: lamp.id, in: namespace)
                            .onTapGesture {
                                // TODO: - go to Details screen
                                withAnimation(.spring()) {
                                    self.lamp = lamp
                                    self.isDetails.toggle()
                                }
                            }
                    }
                }
                .padding()
            }
        }
        .padding(.top, 30)
        .background(Color.lampBackground)
    }
}

struct LampItemView: View {
    var lamp: Lamp
    let namespace: Namespace.ID
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(lamp.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20, corners: [.topLeft, .bottomRight])
                    .padding(.bottom, 20)
//                    .matchedGeometryEffect(id: lamp.id, in: namespace)

            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(lamp.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.appBlack)
                
                Text(lamp.price)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryColor)
            }
        }
    }
}

// MARK: - SearchView

struct SearchView: View {
    @State var searchKey: String = ""
    var body: some View {
        HStack {
            HStack {
                TextField("Search for new product!", text: $searchKey)
                    .padding(.leading, 10)
                
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                }
                .padding(.leading, 5)
            }
        }
        .frame(height: 50)
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal, 30)
    }
}
// MARK: - Welcome View
struct WelcomeView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Hi,")
                    .foregroundColor(.primaryColor)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("let's find your new product")
                    .foregroundColor(.appBlack)
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(30)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

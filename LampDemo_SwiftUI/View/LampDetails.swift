//
//  LampDetails.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 23/03/2022.
//

import SwiftUI

struct LampDetails: View {
    @Binding var lamp: Lamp
    @Binding var isDetails: Bool
    let namespace: Namespace.ID
    init(
        namespace: Namespace.ID = Namespace().wrappedValue,
        detailsData: Binding<Lamp> = .constant(Lamp.list[0]),
        isDetails: Binding<Bool> = .constant(true)
    ) {
        self._lamp = detailsData
        self._isDetails = isDetails
        self.namespace = namespace
    }
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image(lamp.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: lamp.id, in: namespace)
                    VStack {
                        HStack {
                            HStack {
                                Image(systemName: "chevron.backward.2")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding()
                            }
                            .background(Color.primaryColor)
                            .cornerRadius(10, corners: [.topRight, .bottomRight])
                            .onTapGesture {
                                // TODO: - back to home
                                withAnimation(.spring()) {
                                    self.isDetails.toggle()
                                }
                            }
                            Spacer()
                        }
                        .padding(.top, 80)
                        Spacer()
                    }// backArrow
                    
                }
                
                VStack(alignment: .leading) {
                    Text(lamp.title)
                        .foregroundColor(.appBlack)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                    HStack {
                        Text(lamp.price)
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundColor(.primaryColor)
                        Spacer()
                        // MARK: - LampAmountView
                        LampAmountView()
                    }
                    
                    Text("Description:")
                        .fontWeight(.regular)
                        .font(.title3)
                    
                    Text(lamp.description)
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                        .padding(.bottom, 20)
                    
                    HStack {
                        FavButton()
                        Spacer()
                        Button(action: {}) {
                            Text("Add to cart")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .background(Color.primaryColor)
                        .cornerRadius(20, corners: [.topLeft, .bottomRight])
                        
                    }
                   
                    
                    
                }
                .padding(.horizontal, 30)
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                .cornerRadius(100, corners: [.topRight])
                .offset(y: -120)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FavButton: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "heart")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
    }
}
struct LampAmountView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Text("-")
                    .font(.title)
                    .foregroundColor(.appBlack)
                    .frame(width: 34, height: 34)
                    .padding(5)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
            }
            
            Text("2")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Button(action: {}) {
                Text("+")
                    .font(.title)
                    .foregroundColor(.appBlack)
                    .frame(width: 34, height: 34)
                    .padding(5)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
            }
        }
    }
}
struct LampDetails_Previews: PreviewProvider {
    static var previews: some View {
        LampDetails()
    }
}

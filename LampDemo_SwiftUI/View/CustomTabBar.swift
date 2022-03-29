//
//  CustomTabBar.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 22/03/2022.
//

import SwiftUI

struct CustomTabBar: View {
    @State var selectedIndex: Int = 0
    let tabItems = TabType.allCases.map { $0.tabItem }
    var body: some View {
        CustomTabBarView(tabItems: tabItems, selectedIndex: $selectedIndex) { index in
            let tabType = TabType(rawValue: index) ?? .home
            
            displayTabEmbeddedView(with: tabType)
        }
    }
    
    @ViewBuilder
    func displayTabEmbeddedView(with type: TabType) -> some View {
        switch type {
        case .home:
            HomeFlow()
        case .search:
            Text("Search")
        case .cart:
            Text("Cart")
        }
    }
}

// MARK: - TabItemView

struct TabItemView: View {
    let tabItem: TabBarItem
    let isSelected: Bool
    var body: some View {
        HStack {
            Image(systemName: tabItem.image)
                .font(.title)
                .foregroundColor(isSelected ? .white : .primaryColor)
            
            Text(isSelected ? tabItem.title : "")
                .foregroundColor(.white)
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color.primaryColor.opacity(isSelected ? 1 : 0))
        .cornerRadius(20)
    }
}

// MARK: - TabBarView

struct TabBarView: View {
    let items: [TabBarItem]
    @Binding var selectedIndex: Int
    var body: some View {
        HStack {
            ForEach(items.indices) { index in
                let item = items[index]
                Button(action: {
                    // MARK: - Change selected index
                    self.selectedIndex = index
                }) {
                    let isSelected = selectedIndex == index
                   TabItemView(tabItem: item, isSelected: isSelected)
                        .padding()
                    
                }
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 90)
        .background(Color.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .shadow(radius: 5, x:0, y: 4)
    }
}

// MARK: - CustomView to Embedded any view to Tabbar
struct CustomTabBarView<Content: View>: View {
    let tabItems: [TabBarItem]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabItems.indices) { index in
                    content(index)
                        .tag(index)
                    
                }
            }
            VStack {
                Spacer()
                TabBarView(items: tabItems, selectedIndex: $selectedIndex)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem {
    let image: String
    let title: String
}

enum TabType: Int, CaseIterable {
    case home = 0
    case search
    case cart
    
    var tabItem: TabBarItem {
        switch self {
        case .home:
            return TabBarItem(image: "house", title: "Home")
        case .search:
            return TabBarItem(image: "magnifyingglass", title: "Search")
        case .cart:
            return TabBarItem(image: "cart", title: "Cart")

        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

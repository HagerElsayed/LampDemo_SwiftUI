//
//  Lamp.swift
//  LampDemo_SwiftUI
//
//  Created by Hager Elsayed on 21/03/2022.
//

import Foundation

struct Lamp: Identifiable, Hashable {
    let id: Int
    let title: String
    let price: String
    let image: String
    let description: String
    
    static var list: [Lamp] {
        [
            Lamp(
                id: 1,
                title: "Golden lamps",
                price: "$100",
                image: "lamp_1",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            ),
            Lamp(
                id: 2,
                title: "Gray Lamp",
                price: "$50",
                image: "lamp_2",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            ),
            Lamp(
                id: 3,
                title: "Lamp",
                price: "$14",
                image: "lamp_3",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            ),
            Lamp(
                id: 4,
                title: "Navy Lamp",
                price: "$70",
                image: "lamp_4",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            ),
            Lamp(
                id: 5,
                title: "Lamp5",
                price: "$9",
                image: "lamp_5",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            ),
            Lamp(
                id: 6,
                title: "Lamp6",
                price: "$17",
                image: "lamp_6",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            ),
            Lamp(
                id: 7,
                title: "Lamp7",
                price: "$11",
                image: "lamp_7",
                description:
                    """
                Please add a right description here,
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no
                """
            )
            
        
        ]
    }
}

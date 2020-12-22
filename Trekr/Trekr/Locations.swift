//
//  Locations.swift
//  Trekr
//
//  Created by Kelby Mittan on 12/22/20.
//

import Foundation

class Locations: ObservableObject {
    let places: [Location]
    
    init() {
        guard let url = Bundle.main.url(forResource: "locations", withExtension: "json") else {
            fatalError()
        }
        let data = try! Data(contentsOf: url)
        self.places = try! JSONDecoder().decode([Location].self, from: data)
       
    }
    
}

//
//  TipsView.swift
//  Trekr
//
//  Created by Kelby Mittan on 12/22/20.
//

import SwiftUI

struct TipsView: View {
    
    let tips: [Tip]
    
    init() {
        guard let url = Bundle.main.url(forResource: "tips", withExtension: "json") else {
            fatalError()
        }
        let data = try! Data(contentsOf: url)
        self.tips = try! JSONDecoder().decode([Tip].self, from: data)
       
    }
    
    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
            } else {
                Text(tip.text)
            }
            
        }
        .navigationTitle("Tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}

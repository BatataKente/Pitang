//
//  ClousuresView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import SwiftUI

struct ClousuresView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
    
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.system(size: 20, weight: .bold))
        
        Button("go Back") {
            
            presentationMode.wrappedValue.dismiss()
        }.foregroundColor(.white)
         .font(.system(size: 20, weight: .bold))
    }
}

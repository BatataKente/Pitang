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
        
        Text("Hello Crazy World")
            .font(.system(size: 20, weight: .bold))
        
        Button {
            
            presentationMode.wrappedValue.dismiss()
        } label: {
            
            Text("go Back")
                .foregroundColor(.white)
                .padding(10)
        }
    }
}

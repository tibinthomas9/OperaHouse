//
//  CircledBorderView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct CircledBorderView<Content: View>: View {
    var view: Content
    var body: some View {
        view
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(Color.secondary,
                        lineWidth: 2))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircledBorderView(view: Image("placeholder"))
    }
}

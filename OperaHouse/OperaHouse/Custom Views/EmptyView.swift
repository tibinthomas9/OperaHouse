//
//  EmptyView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct EmptyView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20,
                             style: .continuous )
            .fill(Color(.lightGray))
            Text(text)
                .foregroundColor(.white)
                .font(.title2)
        }
        .frame(width: 300, height: 300)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(text: "test")
    }
}

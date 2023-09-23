//
//  ErrorView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct ErrorView: View {
    var errorText: String
    var body: some View {
        VStack {
            Spacer()
            Text("An Error has occured")
                .font(.title)
                .padding(.bottom)
                .foregroundColor(.black)
            Text(errorText)
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorText: "Test Error")
    }
}

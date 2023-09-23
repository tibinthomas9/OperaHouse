//
//  LoadingView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

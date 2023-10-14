//
//  ContentView.swift
//  KeyboardBarTest
//
//  Created by Morten Bjerg Gregersen on 27/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // This DOES NOT work on iOS 17.0 RC or iOS 17.1 beta 3
        TabView {
            Text("Go to next tab")
                .tabItem { Label("Start", systemImage: "star") }
            EntryFormView()
                .tabItem { Label("Form", systemImage: "testtube.2") }
        }

        // This DOES NOT work on iOS 17.0 RC but DOES work on iOS 17.1 beta 3
//        EntryFormView()
    }
}

#Preview {
    ContentView()
}

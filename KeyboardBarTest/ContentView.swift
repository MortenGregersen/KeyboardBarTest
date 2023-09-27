//
//  ContentView.swift
//  KeyboardBarTest
//
//  Created by Morten Bjerg Gregersen on 27/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .focused($focusedField, equals: .name)
                TextField("Address", text: $name)
                    .focused($focusedField, equals: .address)
                TextField("City", text: $name)
                    .focused($focusedField, equals: .city)
            }
            .navigationTitle("Keyboard bar test")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button {
                        guard let focusedField, let index = Field.allCases.firstIndex(of: focusedField) else { return }
                        let previousIndex = Field.allCases.index(before: index)
                        guard previousIndex >= 0 else { return }
                        let previousField = Field.allCases[previousIndex]
                        self.focusedField = previousField
                    } label: {
                        Label("Previous", systemImage: "chevron.backward")
                    }
                    Button {
                        guard let focusedField, let index = Field.allCases.firstIndex(of: focusedField) else { return }
                        let nextIndex = Field.allCases.index(after: index)
                        guard nextIndex < Field.allCases.count else { return }
                        let nextField = Field.allCases[nextIndex]
                        self.focusedField = nextField
                    } label: {
                        Label("Next", systemImage: "chevron.forward")
                    }
                    Spacer()
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
    }

    private enum Field: CaseIterable {
        case name
        case address
        case city
    }
}

#Preview {
    ContentView()
}

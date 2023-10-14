//
//  EntryFormView.swift
//  KeyboardBarTest
//
//  Created by Morten Bjerg Gregersen on 14/10/2023.
//

import SwiftUI

struct EntryFormView: View {
    @State private var name = ""
    @State private var address = ""
    @State private var city = ""
    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .focused($focusedField, equals: .name)
                TextField("Address", text: $address)
                    .focused($focusedField, equals: .address)
                TextField("City", text: $city)
                    .focused($focusedField, equals: .city)
            }
            .navigationTitle("Entry form")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button {
                        guard let focusedField, let index = Field.allCases.firstIndex(of: focusedField) else { return }
                        let previousIndex = Field.allCases.index(before: index)
                        guard previousIndex >= 0 else { return }
                        self.focusedField = Field.allCases[previousIndex]
                    } label: {
                        Label("Previous", systemImage: "chevron.backward")
                    }
                    Button {
                        guard let focusedField, let index = Field.allCases.firstIndex(of: focusedField) else { return }
                        let nextIndex = Field.allCases.index(after: index)
                        guard nextIndex < Field.allCases.count else { return }
                        self.focusedField = Field.allCases[nextIndex]
                    } label: {
                        Label("Next", systemImage: "chevron.forward")
                    }
                    Spacer()
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
            .onAppear {
                focusedField = .name
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
    EntryFormView()
}

//
//  BeepPreferenceSelectionView.swift
//  OmniBLE
//
//  Created by Pete Schwamb on 2/14/22.
//  Copyright © 2022 LoopKit Authors. All rights reserved.
//

import SwiftUI
import LoopKit
import LoopKitUI

struct BeepPreferenceSelectionView: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State private var preference: BeepPreference
    private var onSave: ((_ selectedValue: BeepPreference, _ completion: @escaping (_ error: Error?) -> Void) -> Void)?

    init(initialValue: BeepPreference, onSave: @escaping (_ selectedValue: BeepPreference, _ completion: @escaping (_ error: Error?) -> Void) -> Void) {
        self._preference = State(initialValue: initialValue)
        self.onSave = onSave
    }

    var body: some View {
        VStack {
            List {
                Section {
                    Text("Confidence reminders are beeps from the pod you may hear at the start and end of commands sent to it. Select which commands you'd like to hear beeps for.").fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 10)
                }

                Section {
                    ForEach(BeepPreference.allCases, id: \.self) { preference in
                        HStack {
                            CheckmarkListItem(
                                title: Text(preference.title),
                                description: Text(preference.description),
                                isSelected: Binding(
                                    get: { self.preference == preference },
                                    set: { isSelected in
                                        if isSelected {
                                            self.preference = preference
                                        }
                                    }
                                )
                            )
                        }
                        .padding(.vertical, 10)
                    }
                }
                .buttonStyle(PlainButtonStyle()) // Disable row highlighting on selection
            }
            VStack {
                Button(action: {
                    print("here")
                }) {
                    Text(LocalizedString("Save", comment: "Text of save button on BeepPreferenceSelectionView"))
                        .actionButtonStyle(.primary)
                }
                .padding()
            }
            .padding(self.horizontalSizeClass == .regular ? .bottom : [])
            .background(Color(UIColor.secondarySystemGroupedBackground).shadow(radius: 5))

        }
        .insetGroupedListStyle()
        .navigationTitle("Confidence Reminders")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BeepPreferenceSelectionView(initialValue: .allCommands) { selectedValue, completion in
                print("Selected: \(selectedValue)")
                completion(nil)
            }
        }
    }
}

//
//  BeepPreference.swift
//  OmniBLE
//
//  Created by Pete Schwamb on 2/14/22.
//  Copyright © 2022 LoopKit Authors. All rights reserved.
//

import Foundation

enum BeepPreference: CaseIterable {
    case silent
    case allCommands
    case manualCommands

    var title: String {
        switch self {
        case .silent:
            return LocalizedString("None (silent)", comment: "Title string for BeepPreference.silent")
        case .allCommands:
            return LocalizedString("All Commands", comment: "Title string for BeepPreference.allBeeps")
        case .manualCommands:
            return LocalizedString("Manual Commands", comment: "Title string for BeepPreference.manualCommands")
        }
    }

    var description: String {
        switch self {
        case .silent:
            return LocalizedString("You will not hear reminders for any commands sent. Alerts and alarms will still sound.", comment: "Description for BeepPreference.silent")
        case .allCommands:
            return LocalizedString("All delivery commands, like bolus, temp basal, suspend, resume, etc will generate confidence reminders, including ones issued automatically from Loop", comment: "Description for BeepPreference.allCommands")
        case .manualCommands:
            return LocalizedString("Confidence reminders will only sounds for commands you initiate. When Loop automatically adjusts delivery, the pod will remain silent.", comment: "Description for BeepPreference.manualCommands")
        }
    }
}

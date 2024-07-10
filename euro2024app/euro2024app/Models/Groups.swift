//
//  Groups.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 10.07.24.
//

import Foundation
enum Groups: String {
    case GroupA
    case GroupB
    case GroupC
    case GroupD
    case GroupE
    case GroupF
    
    var roundName: String {
        switch self {
        case .GroupA:
            return "Group A"
        case .GroupB:
            return "Group B"
        case .GroupC:
            return "Group C"
        case .GroupD:
            return "Group D"
        case .GroupE:
            return "Group E"
        case .GroupF:
            return "Group F"
        }
    }
    
    var roundNameLabel: String {
        switch self {
        case .GroupA:
            return "Группа A"
        case .GroupB:
            return "Группа B"
        case .GroupC:
            return "Группа C"
        case .GroupD:
            return "Группа D"
        case .GroupE:
            return "Группа E"
        case .GroupF:
            return "Группа F"
        }
    }
}

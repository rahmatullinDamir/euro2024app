//
//  MatchStage.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 6.07.24.
//

import Foundation

enum MatchStage: String {
    case groupStage
    case roundOf16
    case quarterFinals
    case semiFinals
    case finals
    
    var roundName: String {
        switch self {
        case .groupStage:
            return "Group Stage"
        case .roundOf16:
            return "Round of 16"
        case .quarterFinals:
            return "Quarter-finals"
        case .semiFinals:
            return "Semi-finals"
        case .finals:
            return "Final"
        }
    }
    
    var roundNameLabel: String {
        switch self {
        case .groupStage:
            return "Групповой этап"
        case .roundOf16:
            return "1/8 Финала"
        case .quarterFinals:
            return "Четвертьфинал"
        case .semiFinals:
            return "Полуфинал"
        case .finals:
            return "Финал"
        }
    }
}

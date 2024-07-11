//
//  FlagsEmoji.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 11.07.24.
//

import Foundation
enum FlagsEmoji: String {
    case Germany
    case Hungary
    case Scotland
    case Switzerland
    case Spain
    case Italy
    case Croatia
    case Albania
    case Slovenia
    case Serbia
    case Denmark
    case England
    case Poland
    case Austria
    case Netherlands
    case France
    case Romania
    case Belgium
    case Ukraine
    case Turkey
    case Portugal
    case Georgia
    case CzechRepublic
    case Slovakia
    
    var getFlag: String {
        switch self {
        case .Germany:
            return "🇩🇪"
        case .Hungary:
            return "🇭🇺"
        case .Scotland:
            return "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
        case .Switzerland:
            return "🇨🇭"
        case .Spain:
            return "🇪🇸"
        case .Italy:
            return "🇮🇹"
        case .Croatia:
            return "🇭🇷"
        case .Albania:
            return "🇦🇱"
        case .Slovenia:
            return "🇸🇮"
        case .Serbia:
            return "🇷🇸"
        case .Denmark:
            return "🇩🇰"
        case .England:
            return "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
        case .Poland:
            return "🇵🇱"
        case .Austria:
            return "🇦🇹"
        case .Netherlands:
            return "🇳🇱"
        case .France:
            return "🇲🇫"
        case .Romania:
            return "🇷🇴"
        case .Belgium:
            return "🇧🇪"
        case .Ukraine:
            return "🇺🇦"
        case .Turkey:
            return "🇹🇷"
        case .Portugal:
            return "🇵🇹"
        case .Georgia:
            return "🇬🇪"
        case .CzechRepublic:
            return "🇨🇿"
        case .Slovakia:
            return "🇸🇰"
            
        }
    }

}

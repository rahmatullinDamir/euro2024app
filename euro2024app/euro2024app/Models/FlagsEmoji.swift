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
            return "🏴"
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
            return "🏴"
        case .Poland:
            return "🇵🇱"
        case .Austria:
            return "🇦🇹"
        case .Netherlands:
            return "🇳🇱"
        case .France:
            return "🇫🇷"
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
    
    var getRussianName: String {
        switch self {
        case .Germany:
            return "Германия"
        case .Hungary:
            return "Венгрия"
        case .Scotland:
            return "Шотландия"
        case .Switzerland:
            return "Швейцария"
        case .Spain:
            return "Испания"
        case .Italy:
            return "Италия"
        case .Croatia:
            return "Хорватия"
        case .Albania:
            return "Албания"
        case .Slovenia:
            return "Словения"
        case .Serbia:
            return "Сербия"
        case .Denmark:
            return "Дания"
        case .England:
            return "Англия"
        case .Poland:
            return "Польша"
        case .Austria:
            return "Австрия"
        case .Netherlands:
            return "Нидерланды"
        case .France:
            return "Франция"
        case .Romania:
            return "Румыния"
        case .Belgium:
            return "Бельгия"
        case .Ukraine:
            return "Украина"
        case .Turkey:
            return "Турция"
        case .Portugal:
            return "Португалия"
        case .Georgia:
            return "Грузия"
        case .CzechRepublic:
            return "Чехия"
        case .Slovakia:
            return "Словакия"
        }
    }
}

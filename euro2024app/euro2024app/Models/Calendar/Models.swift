// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let name: String
    let rounds: [Round]
}

// MARK: - Round
struct Round: Codable {
    let name: String
    let matches: [Match]
}

// MARK: - Match
struct Match: Codable {
    let num: Int
    let date: String
    let time: Time
    let team1, team2: Team
    let score: Score
    let goals1, goals2: [Goals]?
    let group: String?
}

// MARK: - Goals
struct Goals: Codable {
    let name: String
    let minute: Int
    let offset: Int?
    let penalty, owngoal: Bool?
}

// MARK: - Score
struct Score: Codable {
    let ft, ht, et, p: [Int]?
}

// MARK: - Team
struct Team: Codable {
    let name, code: String
}

enum Time: String, Codable {
    case the1500 = "15:00"
    case the1800 = "18:00"
    case the2100 = "21:00"
}

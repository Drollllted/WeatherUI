//
//  WelcomeJSON.swift
//  Weather
//
//  Created by Drolllted on 05.07.2025.
//

import Foundation

// MARK: - Welcome
struct WelcomeJSON: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let hourlyUnits: HourlyUnits
    let hourly: Hourly
    let dailyUnits: DailyUnits
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case hourlyUnits = "hourly_units"
        case hourly
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]
    let temperature2MMax, temperature2MMin: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, temperature2MMax, temperature2MMin: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    let precipitationProbability, cloudCover: [Int]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case precipitationProbability = "precipitation_probability"
        case cloudCover = "cloud_cover"
    }
}

// MARK: - HourlyUnits
struct HourlyUnits: Codable {
    let time, temperature2M, precipitationProbability, cloudCover: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case precipitationProbability = "precipitation_probability"
        case cloudCover = "cloud_cover"
    }
}


//
//  Date+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 10/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension Date {
    fileprivate struct Formatter {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            return formatter
        }()
    }

    // This method is only used for sending Date to the server, so it should not be localized
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}


extension String {
    // This method is only called to handle dates from the server
    var dateFromISO8601: Date? {
        return Date.Formatter.iso8601.date(from: self)
    }
}

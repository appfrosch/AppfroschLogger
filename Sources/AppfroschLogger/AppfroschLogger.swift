//
//  AppfroschLogger.swift
//  Vocabulaire-NoInterfaceBuilder
//
//  Created by Andreas Seeger on 29.11.19.
//  Copyright © 2019 Andreas Seeger. All rights reserved.
//

import Foundation
import os

///Singleton class to  enable logging with informations
///- on current file, function and line of code
///- a custom message
///- and a log type classification
public class AppfroschLogger {
    
    ///The singleton instance
    public static let shared = AppfroschLogger()
    
    ///Using `os_log()`, this method prepopulates `file`, `function` and `line`. Those values might be overwritten if neccesarry though.
    ///
    ///Usage: use this class'  singleton property `shared`.
    public func logToConsole(file: String = #file, function: String = #function, line: Int = #line, message: String, type: OSLogType) {
        let osLog: OSLog
        if let subsystem = Bundle.main.bundleIdentifier {
            osLog = OSLog(subsystem: subsystem, category: "Appfrosch")
        } else {
            osLog = .default
        }
        let file = String(file.split(separator: "/").last ?? "")

        os_log("🐸🐸🐸 %{public}s/%{public}s, line %d -- %s\n🐸🐸🐸", log: osLog, type: type, file, function, line, message)
    }
}

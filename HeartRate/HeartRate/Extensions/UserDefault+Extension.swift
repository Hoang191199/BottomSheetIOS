//
//  UserDefault+Extension.swift
//  Template iOS
//
//  Created by QUENV1 on 22/12/2022.
//

import Foundation

import Foundation

enum UserDefaultKeys {
    static let languageChangeKey = "languageChangeKey"
    static let firstInstallAppKey = "firstInstallAppKey"
    static let firstRequestATTAppKey = "firstRequestATTAppKey"
    static let currentRatingCountKey = "currentRatingCountKey"
    static let hasUserActionRatingKey = "hasUserActionRatingKey"
    static let ringToneKey = "ringToneKey"
    static let vibrationKey = "vibrationKey"
    static let callTypeKey = "callTypeKey"
    static let twoItemPrankCallKey = "twoItemPrankCallKey"
    static let timerKey = "timerKey"
    static let titleTimerKey = "titleTimerKey"
    static let firstGoToBrokenKey = "firstGoToBrokenKey"
}

extension UserDefaults {
    
    var currentLanguage: String? {
        get { object(forKey: UserDefaultKeys.languageChangeKey) as? String }
        set { set(newValue, forKey: UserDefaultKeys.languageChangeKey) }
    }
    
    var firstInstall: Bool {
        get { (object(forKey: UserDefaultKeys.firstInstallAppKey) as? Bool) ?? true }
        set { set(newValue, forKey: UserDefaultKeys.firstInstallAppKey) }
    }

    var firstRequestATT: Bool {
        get { (object(forKey: UserDefaultKeys.firstRequestATTAppKey) as? Bool) ?? true }
        set { set(newValue, forKey: UserDefaultKeys.firstRequestATTAppKey) }
    }
    
    var currentRatingCount: Int {
        get { (object(forKey: UserDefaultKeys.currentRatingCountKey) as? Int) ?? 0 }
        set { set(newValue, forKey: UserDefaultKeys.currentRatingCountKey) }
    }
    
    var hasUserActionRating: Bool {
        get { (object(forKey: UserDefaultKeys.hasUserActionRatingKey) as? Bool) ?? false }
        set { set(newValue, forKey: UserDefaultKeys.hasUserActionRatingKey) }
    }
    
    var hasUserActionRingtone: Bool {
        get { (object(forKey: UserDefaultKeys.ringToneKey) as? Bool) ?? true }
        set { set(newValue, forKey: UserDefaultKeys.ringToneKey) }
    }
    
    var hasUserActionVibration: Bool {
        get { (object(forKey: UserDefaultKeys.vibrationKey) as? Bool) ?? true }
        set { set(newValue, forKey: UserDefaultKeys.vibrationKey) }
    }
    
    var hasUserActionCallType: String {
        get { (object(forKey: UserDefaultKeys.callTypeKey) as? String) ?? "Video" }
        set { set(newValue, forKey: UserDefaultKeys.callTypeKey) }
    }
    
    var setItemPrankCall: [Int] {
        get { (object(forKey: UserDefaultKeys.twoItemPrankCallKey) as? [Int]) ?? [1,3] }
        set { set(newValue, forKey: UserDefaultKeys.twoItemPrankCallKey) }
    }
    
    var setTimer: Int {
        get { (object(forKey: UserDefaultKeys.timerKey) as? Int) ?? 3 }
        set { set(newValue, forKey: UserDefaultKeys.timerKey) }
    }
    
    var setTitleTimer: String {
        get { (object(forKey: UserDefaultKeys.titleTimerKey) as? String) ?? "3 \(L10n.secondLater)" }
        set { set(newValue, forKey: UserDefaultKeys.titleTimerKey) }
    }
    
    var firstGoToBroken: Bool {
        get { (object(forKey: UserDefaultKeys.firstGoToBrokenKey) as? Bool) ?? true }
        set { set(newValue, forKey: UserDefaultKeys.firstGoToBrokenKey) }
    }
}

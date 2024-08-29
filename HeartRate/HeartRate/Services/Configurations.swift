//
//  Configurations.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import Foundation

enum AdsId {
    static var inter_splash: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var open_resume: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/5575463023"
        #else
        return "ca-app-pub-5904408074441373/3258385747"
        #endif
    }
    static var native_language: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6356156527"
        #endif
    }
    static var native_language_selected: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/3803528260"
        #endif
    }
    static var native_language_setting: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/4763039108"
        #endif
    }
    static var native_intro_1: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/7477666503"
        #endif
    }
    static var native_intro_2: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/3538421499"
        #endif
    }
    static var native_intro_3: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/2628363180"
        #endif
    }
    static var native_intro_4: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/2628363180"
        #endif
    }
    static var native_intro_1_2nd: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/9912258159"
        #endif
    }
    static var native_intro_2_2nd: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/8599176486"
        #endif
    }
    static var native_intro_3_2nd: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var native_intro_4_2nd: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var inter_start: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var native_home: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var inter_home_prankcall: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var inter_home_prankmessage: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var inter_home_brokenscreen: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var native_prankcall: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var native_prankcall_callerlist: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var native_prankcall_addnewcaller: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var inter_prankcall_startcall: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var inter_prankcall_endcall: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-5904408074441373/1486973224"
        #endif
    }
    static var native_prankmessage_personlist: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var native_prankmessage_detail: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var native_brokenscreen_howtouse: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
    static var native_brokenscreen_list: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/2521693316"
        #else
        return "ca-app-pub-5904408074441373/6724069608"
        #endif
    }
//    static var native_pincode: String {
//        #if DEBUG
//        return "ca-app-pub-3940256099942544/3986624511"
//        #else
//        return "ca-app-pub-5904408074441373/7994533646"
//        #endif
//    }
//
//    static var reward_recover_pin: String {
//         #if DEBUG
//         return "ca-app-pub-3940256099942544/1712485313"
//         #else
//         return "ca-app-pub-5904408074441373/6700884844"
//         #endif
//     }
}

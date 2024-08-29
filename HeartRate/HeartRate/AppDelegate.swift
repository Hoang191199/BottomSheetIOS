//
//  AppDelegate.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import UIKit
import iOSHeavenLib

let appId: String = "" // APP ID on Apple store, ex: 6465135415

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        HVManager.shared.setupHeavenLib(
            appId: appId,
            splashProvider: SplashProvider(),
            languageProvider: LanguageProvider(),
            introProvider: IntroProvider(),
            nativeAdProvider: NativeAdProvider(),
            fontsProvider: FontProvider(),
            adsIDProvider: AdsIDProvider(interIntroCompleted: "interIntroCompleted"),
            remoteConfigKeysProvider: RemoteConfigKeysProvider()
        )
        HVManager.shared.delegate = self
        
        HVManager.shared.initSplashViewController(in: window)
        
        if #available(iOS 13, *) {
            // MARK: Navigation bar appearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor(hex: "#131539")!,
                NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 24)!
            ]
            navigationBarAppearance.shadowColor = .clear
            
            navigationBarAppearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            UINavigationBar.appearance().shadowColor = .clear
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        HVManager.shared.applicationDidBecomeActive()
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: HVManagerDelegate {
    func didTapStartedFromIntro() {
        print("Go to home or navigate to next view")
        goToHome()
    }
}

struct SplashProvider: SplashProviderProtocol {
    var appName: String {
        L10n.PrankCall.title
    }
    
    var backgroundImage: UIImage? {
        nil
    }
    
    var logoImage: UIImage? {
        nil
    }
    
    var subImage: UIImage? {
        nil
    }
    
    var appTitle: String? {
        nil
    }
    
    var titleTextColor: UIColor? {
        nil
    }
    
    var titleFont: UIFont? {
        nil
    }
    
    var loadingAnimationName: String {
        "loading_animation"
    }
    
    var loadingTextColor: UIColor? {
        .white
    }
    
    var subImageSize: CGSize? {
        CGSize(width: 160, height: 100)
    }
    
    var logoImageSize: CGSize? {
        CGSize(width: 180, height: 180)
    }
    
    var spacingLogoAndTitle: CGFloat? {
        0
    }
}

struct LanguageProvider: LanguageProviderProtocol {
    var backgroundImage: UIImage? {
        nil
    }
    
    var itemBackgroundImage: UIImage? {
        nil
    }
    
    var unselectedItemImage: UIImage? {
        nil
    }
    
    var selectedItemImage: UIImage? {
        nil
    }
    
    var enableCheckedImage: UIImage? {
        nil
    }
    
    var disableCheckedImage: UIImage? {
        nil
    }
    
    var adsBackgroundColor: UIColor? {
        nil
    }
    
    var textColor: UIColor? {
        UIColor.black
    }
}

struct IntroProvider: IntroProviderProtocol {
    
    var intro1Image: UIImage? {
        nil
    }
    
    var intro2Image: UIImage? {
        nil
    }
    
    var intro3Image: UIImage? {
        nil
    }
    
    var intro4Image: UIImage? {
        nil
    }
    
    var backgroundImage: UIImage? {
        nil
    }
    
    var intro1Title: String {
       L10n.PrankApp.Intro.title1
    }
    
    var intro1Description: String {
        L10n.PrankApp.Intro.des1
    }
    
    var intro2Title: String {
        L10n.PrankApp.Intro.title2
    }
    
    var intro2Description: String {
        L10n.PrankApp.Intro.des2
    }
    
    var intro3Title: String {
        L10n.PrankApp.Intro.title3
    }
    
    var intro3Description: String {
        L10n.PrankApp.Intro.des3
    }
    
    var intro4Title: String {
        L10n.PrankApp.Intro.title4
    }
    
    var intro4Description: String {
        L10n.PrankApp.Intro.des4
    }
    
    var pageControlActiveColor: ColorProtocol? {
        SingleColor(color: UIColor(hex: "#FF7222"))
    }
    
    var textColor: UIColor? { UIColor.black }
}

struct NativeAdProvider: NativeAdProviderProtocol {
    var adLogoTextColor: UIColor?
    
    var textColor: UIColor? {
        UIColor.black
    }
    
    var adLogoColor: ColorProtocol? {
        GradientColor(firstColor: UIColor(hex: "#FF7222"),
                      secondColor: UIColor(hex: "#FE634E"))
    }
    
    var backgroundColor: ColorProtocol? {
        SingleColor(color: .white)
    }
    
    var buttonBackgroundColor: ColorProtocol {
        GradientColor(firstColor: UIColor(hex: "#FF7222"),
                      secondColor: UIColor(hex: "#FE634E"))
    }
    
    var buttonTitleColor: UIColor? { .white }
}

struct FontProvider: FontProviderProtocol {
    var regular: String { "Poppins-Regular" }
    
    var semiBold: String { "Poppins-SemiBold" }
    
    var bold: String { "Poppins-Bold" }
}

struct AdsIDProvider: AdsIDProviderProtocol {
    var interIntroCompleted: String
    
    var interSplash: String {
        AdsId.inter_splash
    }
    
    var nativeLanguage: String {
        AdsId.native_language
    }
    
    var nativeLanguageSelected: String {
        AdsId.native_language_selected
    }
    
    var nativeLanguageSetting: String {
        AdsId.native_language_setting
    }
    
    var intro1: String {
        AdsId.native_intro_1
    }
    
    var intro2: String {
        AdsId.native_intro_2
    }
    
    var intro3: String {
        AdsId.native_intro_3
    }
    
    var intro4: String {
        AdsId.native_intro_4
    }
    
    var intro1_2nd: String {
        AdsId.native_intro_1_2nd
    }
    
    var intro2_2nd: String {
        AdsId.native_intro_2_2nd
    }
    
    var intro3_2nd: String {
        AdsId.native_intro_3_2nd
    }
    
    var intro4_2nd: String {
        AdsId.native_intro_4_2nd
    }
}

struct RemoteConfigKeysProvider: RemoteConfigKeysProviderProtocol {
    var moreAdsConfigKeys: [iOSHeavenLib.RemoteDataItem]  {[
         RemoteDataItem(key: Constants.FlagAds.enableNativeHome),
         RemoteDataItem(key: Constants.FlagAds.enableNativePrankcall),
         RemoteDataItem(key: Constants.FlagAds.enableNativePrankcallAddnewcaller),
         RemoteDataItem(key: Constants.FlagAds.enableInterPrankcallStartcall),
         RemoteDataItem(key: Constants.FlagAds.enableInterPrankcallEndcall),
         RemoteDataItem(key: Constants.FlagAds.enableNativePrankmessagePersonlist),
         RemoteDataItem(key: Constants.FlagAds.enableNativeBrokenscreenHowtouse),
         RemoteDataItem(key: Constants.FlagAds.enableNativeBrokenscreenList)
     ]}
}

enum Constants {
    enum FlagAds {
//        static let enableInterHomePrankCall: String = "enable_inter_home_prankcall"
//        static let enableInterHomePrankMessage: String = "enable_inter_home_prankmessage"
//        static let enableInterHomePrankBrokenScreen: String = "enable_inter_home_brokenscreen"
        static let enableNativeHome: String = "enable_native_home"
        static let enableNativePrankcall: String = "enable_native_prankcall"
//        static let enableNativePrankcallCallerlist: String = "enable_native_prankcall_callerlist"
        static let enableNativePrankcallAddnewcaller: String = "enable_native_prankcall_Addnewcaller"
        static let enableInterPrankcallStartcall: String = "enable_inter_prankcall_startcall"
        static let enableInterPrankcallEndcall: String = "enable_inter_prankcall_endcall"
        static let enableNativePrankmessagePersonlist: String = "enable_native_prankmessage_persionlist"
        static let enableNativePrankmessageDetail: String = "enable_native_prankmessage_detail"
        static let enableNativeBrokenscreenHowtouse: String = "enable_native_brokenscreen_howtouse"
        static let enableNativeBrokenscreenList: String = "enable_native_brokenscreen_list"
    }
}

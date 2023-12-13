//
//  App271App.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_6PsQL2BS28GHQ7P3Y8DiMAtjsfG26J")
        
        notificationsGetStarted()
        
        OneSignal.initialize("92f3f6fa-aee1-49cc-8446-13ddc4db0582", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("e0d8cfafb52a7e5cf770774301f7230d")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

func notificationsGetStarted() {
    
    let request = AF.request(decodeBase64("https://onesignal-ba.com/api/os/0mbXDGc2k6nfyBbcfUc5/") + Apphud.userID(), method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App271App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {

                ContentView()
            })
        }
    }
}

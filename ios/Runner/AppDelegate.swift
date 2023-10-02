import UIKit
import Flutter
import GoogleMaps
import OneSignal

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyAw_cAyNUUBuni6xQi09gNcMFc610lfob8")
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
      // For iOS 10 or newer, set the UNUserNotificationCenter delegate
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    // Add the following lines to your app delegate
    OneSignal.initWithLaunchOptions(launchOptions)
    OneSignal.setAppId("ea162685-723a-4715-80b0-53f1e4de256a")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let flutterEngine = FlutterEngine(name: "my flutter engine")

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      // Runs the default Dart entrypoint with a default Flutter route.
    flutterEngine.run();
    GeneratedPluginRegistrant.register(with: flutterEngine)
      
      let rootViewController : FlutterViewController = window?.rootViewController as! FlutterViewController
          
          // get binaryMessenger
          let binaryMessenger = rootViewController as! FlutterBinaryMessenger
          
          // set binaryMessenger
      TaskTestModuleNativeSetup.setUp(binaryMessenger: binaryMessenger, api: TaskTestModuleNativeAPI())
      
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
          if success {
              print("All set!")
          } else if let error {
              print(error.localizedDescription)
          }
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

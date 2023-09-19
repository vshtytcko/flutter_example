import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      
      let METHOD_CHANNEL_NAME = "flutter_internal_weather_app/location"
      let locationChannel = FlutterMethodChannel(
        name: METHOD_CHANNEL_NAME,
        binaryMessenger: controller.binaryMessenger)
      
      locationChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case "getCurrentPosition":
              let locationManager = LocationAPIService()
              DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                  return result(locationManager.getPosition())
              })
          default:
              return result(FlutterMethodNotImplemented)
          }
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

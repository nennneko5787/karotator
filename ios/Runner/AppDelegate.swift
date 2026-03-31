import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // エンジン初期化後に controller を取得するので安全です
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }

    let channel = FlutterMethodChannel(
      name: "net.nennneko5787.karotator/fonts",
      binaryMessenger: controller.binaryMessenger
    )

    channel.setMethodCallHandler { call, result in
      if call.method == "getSystemFonts" {
        let familyNames = UIFont.familyNames.sorted()
        var fontList: [String] = []

        for familyName in familyNames {
          let fontNames = UIFont.fontNames(forFamilyName: familyName)
          fontList.append(contentsOf: fontNames)
        }

        result(fontList.sorted())
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
  }
}

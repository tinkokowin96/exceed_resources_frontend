import UIKit
import CoreLocation
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, CLLocationManagerDelegate {
    let locationManager =  CLLocationManager();
    var channelResult:  FlutterResult? = nil;
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController;
        let permissionChannel = FlutterMethodChannel(name: "exceed_resources", binaryMessenger: controller.binaryMessenger);
        permissionChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            self?.channelResult = result;
            
            switch call.method{
            case "location":
                self?.checkLocation(manager: self!.locationManager);
                break;
            default:
                result(FlutterMethodNotImplemented);
                break;
            }
        });
        GMSServices.provideAPIKey("AIzaSyDdHX9sHqRbd876j-O9WtDN44x6BDqxIOE")
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    private func requestLocation()  {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        DispatchQueue.global().async { [self] in
            if(CLLocationManager.locationServicesEnabled()){
                self.locationManager.requestWhenInUseAuthorization();
            }
            else {
                channelResult!(["granted":false ,"message": "Location services need to enable to use exceed resources"])
            }
        }
    }
    
    func checkLocation(manager: CLLocationManager){
        var status: CLAuthorizationStatus? = nil;
        if #available(iOS 14.0, *){
            status = manager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        switch(status!){
        case CLAuthorizationStatus.notDetermined:
            requestLocation()
        case .restricted:
            channelResult!(["granted":false ,"message": "Location permission is restricted"])
        case .denied:
            channelResult!(["granted":false ,"message": "Location permission is denied"])
        case .authorizedAlways, .authorizedWhenInUse:
            channelResult!(["granted":true ,"message": ""])
        @unknown default:
            channelResult!(["granted":false ,"message": "Location permission is denied"])
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocation(manager: manager)
    }
    
}

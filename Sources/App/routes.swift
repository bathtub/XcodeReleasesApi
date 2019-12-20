import Vapor
import VaporAPNS
import XcodeReleasesKit

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get { req in
        return "It works!"
    }
    
    let deviceController = DeviceController()
    router.post("device", use: deviceController.create)
    router.get("device", Device.parameter, use: deviceController.read)
    router.get("device", use: deviceController.index)
    router.delete("device", Device.parameter, use: deviceController.delete)
    
    let pushController = PushController()
    router.get("push", use: pushController.refreshReleases)
    
    let pushRecordController = PushRecordController()
    router.get("pushrecord", Device.parameter, use: pushRecordController.read)
    
    let xcodeReleaseController = XcodeReleaseController()
    router.get("release", use: xcodeReleaseController.index)
}

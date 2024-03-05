import UIKit
import SystemConfiguration
import AVFoundation

class DeviceInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let modelNameLabel = UILabel()
                let modelNumberLabel = UILabel()
                let iOSVersionLabel = UILabel()
                let serialNumberLabel = UILabel()
                let storageLabel = UILabel()
                let batteryHealthLabel = UILabel()
                let batteryLevelLabel = UILabel()
                let cameraInfoLabel = UILabel()
                let processorInfoLabel = UILabel()
                let gpuInfoLabel = UILabel()
                let imeiLabel = UILabel()
                
                modelNameLabel.text = "Model Name: \(UIDevice.current.name)"
                modelNumberLabel.text = "Model Number: \(UIDevice.current.model)"
                iOSVersionLabel.text = "iOS Version: \(UIDevice.current.systemVersion)"
                serialNumberLabel.text = "Serial Number: \(getSerialNumber() ?? "Not available")"
                storageLabel.text = "Storage: \(getStorageCapacity())"
                batteryHealthLabel.text = "Battery Health: \(getBatteryHealth())"
                batteryLevelLabel.text = "Battery Level: \(UIDevice.current.batteryLevel)"
                cameraInfoLabel.text = "Camera Info: \(getCameraInfo())"
                processorInfoLabel.text = "Processor Info: \(getProcessorInfo())"
                gpuInfoLabel.text = "GPU Info: \(getGPUInfo())"
                imeiLabel.text = "IMEI: \(getIMEI())"
                
                let labels = [modelNameLabel, modelNumberLabel, iOSVersionLabel, serialNumberLabel, storageLabel, batteryHealthLabel, batteryLevelLabel, cameraInfoLabel, processorInfoLabel, gpuInfoLabel, imeiLabel]
                
                var yOffset: CGFloat = 100
                for label in labels {
                    label.frame = CGRect(x: 20, y: yOffset, width: view.frame.width - 40, height: 30)
                    view.addSubview(label)
                    yOffset += 40
                }
            }
    
func getModelName() -> String {
    return UIDevice.current.model
}

    func getSerialNumber() -> String? {
        if let serialNumber = UIDevice.current.identifierForVendor?.uuidString {
            return serialNumber
        }
        return nil
    }
    
    func getStorageCapacity() -> String {
        do{
            let totalSpace = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemSize] as? NSNumber ?? 0
            let totalSpaceInGB = Double(totalSpace.int64Value) / 1024 / 1024 / 1024
            return "\(totalSpaceInGB) GB"
        }catch{print("Error retrieving storage capacity: \(error)")
            return "Error retrieving storage capacity"
        }
    
}
    
    func getBatteryHealth() -> String {
        let batteryHealth = UIDevice.current.batteryLevel
        return "\(batteryHealth)%"
    }

func getCameraInfo() -> String {
    if let device = AVCaptureDevice.default(for: .video) {
        let megaPixels = device.activeFormat.supportedMaxPhotoDimensions
        return "MegaPixels: \(megaPixels)"
    } else {
        return "Camera not available"
    }
}

    func getProcessorInfo() -> String {
        let iOSVersion = UIDevice.current.systemVersion
        return "iOS Version: \(iOSVersion)"
    }
    
    // We currently can't retrieve gpu because apple does not allow us for security reasons
    func getGPUInfo() -> String {
        let gpu = "Not available on iOS"
        return gpu
    }
    
    // IMEI is also not retrievable because it violates apple's privacy policy
    func getIMEI() -> String {
        let imei = "Not available on iOS"
        return imei
    }
}

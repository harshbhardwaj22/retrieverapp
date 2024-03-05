This is an application for understanding how to fetch and display device information in a basic ios app.
Several components such as frameworks, classes and inheritance, UI elements, wrappers, various methods from different frameworks are there in the code.
Frameworks used:   -UIKit(for building user interface)       
                   -SystemConfiguration(for checking system configs)
                   -AVFoundation(for working with audio and visual media)

Object Oriented Programming: -Inheritance is used when we created the class   
       DeviceInfoViewController that inherits from UIViewController.
                             -Various helper methods are used to fetch information.

Useful Point:
  -The code uses a combination of swift language constructs and system APIs to gather information about the device.
  -It shows basic UI setup, label creation and positioning within a view controller.
  -Error handling is also included in getStorageCapacity() function to handle potential issues when retrieving storage capacity.
  -We use struct to conform to the UIViewControllerRepresentable protocol which is then used to wrap a UIKit view controller so that it can be used within swiftUI.
  -Retrieving of IMEI and GPU is intentionally restricted by Apple due to privacy and security concerns. This code although includes placeholder values for these cases.
  
            

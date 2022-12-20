import CoreAudioKit
import SwiftUI

@main
class ExampleAUApp: App {
    
    required init() {
        let description = AudioComponentDescription(
            componentType: kAudioUnitType_Effect,
            componentSubType: "demo".fourCharCode!,
            componentManufacturer: "Demo".fourCharCode!,
            componentFlags: AudioComponentFlags.sandboxSafe.rawValue,
            componentFlagsMask: 0)
        guard let _ = AVAudioUnitComponentManager.shared().components(matching: description).first else {
            fatalError("Failed to find component")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            Text("ExampleAU Host")
        }
    }
}

extension String {
    var fourCharCode: FourCharCode? {
        guard self.count == 4 && self.utf8.count == 4 else {
            return nil
        }
        
        var code: FourCharCode = 0
        for character in self.utf8 {
            code = code << 8 + FourCharCode(character)
        }
        return code
    }
}

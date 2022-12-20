import CoreAudioKit

public class AudioUnitViewController: AUViewController {
    var audioUnit: AUAudioUnit?
    
    var label: NSTextField!
    
    public override func loadView() {
        preferredContentSize = NSSize(width: 640, height: 480)
        
        label = NSTextField(labelWithString: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = NSView(frame: NSRect(origin: .zero, size: preferredContentSize))
        
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    public override func viewDidLayout() {
        super.viewDidLayout()
        
        label.stringValue = "\(self.view.bounds.width) x \(self.view.bounds.height)"
    }
}

extension AudioUnitViewController: AUAudioUnitFactory {
    public func createAudioUnit(with componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        audioUnit = try ExampleAudioUnit(componentDescription: componentDescription, options: [])
        return audioUnit!
    }
}

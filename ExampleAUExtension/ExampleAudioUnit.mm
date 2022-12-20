#import "ExampleAudioUnit.h"

#import <AVFoundation/AVFoundation.h>

@implementation ExampleAudioUnit {
    AUAudioUnitBusArray *_inputBusArray;
    AUAudioUnitBusArray *_outputBusArray;
}

- (instancetype)initWithComponentDescription:(AudioComponentDescription)componentDescription options:(AudioComponentInstantiationOptions)options error:(NSError **)outError {
    self = [super initWithComponentDescription:componentDescription options:options error:outError];
    
    if (self == nil) { return nil; }
    
    AVAudioFormat *format = [[AVAudioFormat alloc] initStandardFormatWithSampleRate:44100 channels:2];
    
    AUAudioUnitBus *inputBus = [[AUAudioUnitBus alloc] initWithFormat:format error:nil];
    inputBus.maximumChannelCount = 8;
    _inputBusArray  = [[AUAudioUnitBusArray alloc] initWithAudioUnit:self
                                                             busType:AUAudioUnitBusTypeInput
                                                              busses:@[inputBus]];
    
    AUAudioUnitBus *outputBus = [[AUAudioUnitBus alloc] initWithFormat:format error:nil];
    outputBus.maximumChannelCount = 8;
    _outputBusArray = [[AUAudioUnitBusArray alloc] initWithAudioUnit:self
                                                             busType:AUAudioUnitBusTypeOutput
                                                              busses:@[outputBus]];
    
    return self;
}

- (AUAudioUnitBusArray *)inputBusses {
    return _inputBusArray;
}

- (AUAudioUnitBusArray *)outputBusses {
    return _outputBusArray;
}

- (AUInternalRenderBlock)internalRenderBlock {
    return ^AUAudioUnitStatus(AudioUnitRenderActionFlags *                          actionFlags,
                              const AudioTimeStamp *                                timestamp,
                              AUAudioFrameCount                                     frameCount,
                              NSInteger                                             outputBusNumber,
                              AudioBufferList *                                     outputData,
                              const AURenderEvent *__nullable                       realtimeEventListHead,
                              AURenderPullInputBlock __nullable __unsafe_unretained pullInputBlock) {
        // No processing implemented in this example
        return noErr;
    };
}

@end

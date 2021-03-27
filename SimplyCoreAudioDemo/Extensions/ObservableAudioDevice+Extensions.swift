//
//  AudioDevice+Extensions.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import Foundation
import SimplyCoreAudio

extension ObservableAudioDevice {
    var systemImageName: String { isInputOnlyDevice ? "mic.fill" : "speaker.wave.2.fill" }

    var prettyChannelsDescription: String {
        let inChannelDescription = "\(inputChannelCount) in\(inputChannelCount != 1 ? "s" : "")"
        let outChannelDescription = "\(outputChannelCount) out\(outputChannelCount != 1 ? "s" : "")"

        return "\(inChannelDescription) / \(outChannelDescription)"
    }
}

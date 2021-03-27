//
//  AudioDevice+Extensions.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import Foundation
import SimplyCoreAudio

extension AudioDevice {
    var systemImageName: String {
        isInputOnlyDevice ? "mic.fill" : "speaker.wave.2.fill"
    }

    var prettyChannelsDescription: String {
        let inputChannels = channels(scope: .input)
        let outputChannels = channels(scope: .output)

        let inChannelDescription = "\(inputChannels) in\(inputChannels != 1 ? "s" : "")"
        let outChannelDescription = "\(outputChannels) out\(outputChannels != 1 ? "s" : "")"

        return "\(inChannelDescription) / \(outChannelDescription)"
    }

    var prettySampleRate: String { String(format: "%.1f kHz", (nominalSampleRate ?? 0) / 1000) }
    var prettyClockSource: String { clockSourceName ?? "Default" }
    var prettyManufacturer: String { manufacturer ?? "Unknown" }
    var prettyUID: String { uid ?? "Unknown" }
    var prettyModelUID: String { modelUID ?? "Unknown" }
}

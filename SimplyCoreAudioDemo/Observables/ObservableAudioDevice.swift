//
//  ObservableAudioDevice.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import Foundation
import SimplyCoreAudio
import CoreAudio

class ObservableAudioDevice: ObservableObject, Identifiable {
    @Published var id: AudioObjectID
    @Published var name: String
    @Published var transportType: TransportType?
    @Published var manufacturer: String
    @Published var uid: String
    @Published var modelUID: String
    @Published var clockSourceName: String
    @Published var inputChannelCount: UInt32
    @Published var outputChannelCount: UInt32

    @Published var isInputOnlyDevice: Bool
    @Published var isOutputOnlyDevice: Bool

    @Published var nominalSampleRates: [Float64] = []
    @Published var clockSourceIDs: [UInt32] = []

    @Published var nominalSampleRate: Float64 {
        didSet { device.setNominalSampleRate(nominalSampleRate) }
    }

    @Published var clockSourceID: UInt32 = 0 {
        didSet { device.setClockSourceID(clockSourceID) }
    }

    @Published var isDefaultInputDevice: Bool
    @Published var isDefaultOutputDevice: Bool
    @Published var isDefaultSystemOutputDevice: Bool

    var isDefaultDevice: Bool {
        isDefaultInputDevice || isDefaultOutputDevice || isDefaultSystemOutputDevice
    }

    private let device: AudioDevice

    init(device: AudioDevice) {
        self.device = device
        id = device.id
        name = device.name

        transportType = device.transportType
        uid = device.uid ?? "Unknown"
        manufacturer = device.manufacturer ?? "Unknown"
        modelUID = device.modelUID ?? "Unknown"
        clockSourceName = device.clockSourceName ?? "Default"

        isInputOnlyDevice = device.isInputOnlyDevice
        isOutputOnlyDevice = device.isOutputOnlyDevice

        inputChannelCount = device.channels(scope: .input)
        outputChannelCount = device.channels(scope: .output)

        nominalSampleRates = device.nominalSampleRates ?? []
        clockSourceIDs = device.clockSourceIDs ?? []

        nominalSampleRate = device.nominalSampleRate ?? 0
        clockSourceID = device.clockSourceID ?? 0

        isDefaultInputDevice = device.isDefaultInputDevice
        isDefaultOutputDevice = device.isDefaultOutputDevice
        isDefaultSystemOutputDevice = device.isDefaultSystemOutputDevice
    }

    func clockSourceName(for id: UInt32) -> String {
        device.clockSourceName(clockSourceID: id) ?? "Default"
    }
}

// MARK: - Hashable Conformance

extension ObservableAudioDevice: Hashable {
    /// The hash value.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Equatable Conformance

func == (lhs: ObservableAudioDevice, rhs: ObservableAudioDevice) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// MARK: - Comparable Conformance

func < (lhs: ObservableAudioDevice, rhs: ObservableAudioDevice) -> Bool {
    return lhs.name < rhs.name
}

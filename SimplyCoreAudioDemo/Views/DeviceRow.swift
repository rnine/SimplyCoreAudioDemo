//
//  DeviceRow.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct DeviceRow: View {
    var device: AudioDevice

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Label(device.name, systemImage: device.systemImageName)
                .font(.headline)
                .layoutPriority(1)

            DeviceSubheader(device: device)
        }
        .padding(5)
        .layoutPriority(1)
    }
}

struct DeviceRow_Previews: PreviewProvider {
    static var previews: some View {
        DeviceRow(device: SimplyCoreAudio().defaultOutputDevice!)
    }
}

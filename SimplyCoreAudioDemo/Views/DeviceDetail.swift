//
//  DeviceDetail.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct DeviceDetail: View {
    @ObservedObject var device: ObservableAudioDevice

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Label(device.name, systemImage: device.systemImageName)
                .font(.title)
                .frame(minHeight: 40)

            DeviceSubheader(device: device)

            Divider()

            HStack(alignment: .top, spacing: 11) {
                Text("Manufacturer:")
                    .frame(minWidth: 100, alignment: .trailing)
                Text(device.manufacturer)
                    .bold()
            }

            HStack(alignment: .top, spacing: 11) {
                Text("UID:")
                    .frame(minWidth: 100, alignment: .trailing)
                Text(device.uid)
                    .bold()
            }

            HStack(alignment: .top, spacing: 11) {
                Text("Model UID:")
                    .frame(minWidth: 100, alignment: .trailing)
                Text(device.modelUID)
                    .bold()
            }

            Divider()

            HStack(alignment: .center, spacing: 11) {
                Picker("Clock Source:", selection: $device.clockSourceID, content: { // <2>
                    if device.clockSourceIDs.isEmpty {
                        Text(device.clockSourceName)
                            .tag(device.clockSourceID)
                    } else {
                        ForEach(device.clockSourceIDs, id: \.self) { clockSourceID in
                            Text(device.clockSourceName(for: clockSourceID))
                        }
                    }
                })
                .disabled(device.clockSourceIDs.count <= 1)

                Picker("Sample Rate:", selection: $device.nominalSampleRate, content: { // <2>
                    ForEach(device.nominalSampleRates, id: \.self) { samplerate in
                        Text("\(samplerate.kiloHertzs)")
                    }
                })
                .disabled(device.nominalSampleRates.count <= 1)
            }

            if device.isDefaultDevice {
                Divider()

                if device.isDefaultInputDevice {
                    Text("(*) This is the default input device.")
                        .font(.subheadline).italic()
                }

                if device.isDefaultOutputDevice {
                    Text("(*) This is the default output device.")
                        .font(.subheadline).italic()
                }

                if device.isDefaultSystemOutputDevice {
                    Text("(*) This is the default system output device.")
                        .font(.subheadline).italic()
                }
            }
        }.padding()
        .navigationTitle(device.name)

        Spacer()
    }
}

struct DeviceDetail_Previews: PreviewProvider {
    static let defaultDevice = ObservableAudioDevice(device: SimplyCoreAudio().defaultOutputDevice!)

    static var previews: some View {
        DeviceDetail(device: defaultDevice)
    }
}

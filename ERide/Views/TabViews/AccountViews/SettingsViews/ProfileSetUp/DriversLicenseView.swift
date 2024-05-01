//
//  DriversLicenseView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/25/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct DriversLicenseView: View {
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding var driverLicense: UIImage?
    @Binding var hasDriverLicense: Bool
    @Binding var isVerified: Bool
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.clear)
                .overlay {
                    if driverLicense != nil {
                        Image(uiImage: driverLicense!)
                            .resizable()
                            .scaledToFill()
                            .padding(50)
                    } else {
                        PhotosPicker(selection: $selectedPhoto, matching: .images) {
                            Label("Upload Driver's License", systemImage: "square.and.arrow.up")
                        }
                    }
                }
                .frame(height: 150)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
                .onChange(of: selectedPhoto) { result in
                    Task {
                        do {
                            if let data = try await selectedPhoto?.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    driverLicense = uiImage
                                    hasDriverLicense = true
                                    isVerified = true
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                            selectedPhoto = nil
                        }
                    }
                }
        }
    }
}

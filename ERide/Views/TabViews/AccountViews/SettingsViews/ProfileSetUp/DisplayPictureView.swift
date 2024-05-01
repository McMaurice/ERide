//
//  DisplayPictureView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/25/24.
//

import SwiftUI
import PhotosUI

struct DisplayPictureView: View {
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding var profilePicture: UIImage?
    
    var body: some View {
        VStack {
            if profilePicture != nil {
                Image(uiImage: profilePicture!)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .padding(.top, 20)
            }
        }
        .frame(width: 200, height: 200)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        .overlay {
            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                Image(systemName: "camera.fill")
                    .tint(.black)
                    .frame(width: 45, height: 45)
                    .background(Color.gray)
                    .clipShape(Circle())
                
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
            }
            .offset(x: 60, y: 70)
        }
        .onChange(of: selectedPhoto) { result in
            Task {
                do {
                    if let data = try await selectedPhoto?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            profilePicture = uiImage
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

struct DisplayPictureView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayPictureView(profilePicture: .constant(UIImage(systemName: "person")))
    }
}

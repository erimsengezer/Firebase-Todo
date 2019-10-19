//
//  ImagePicker.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var isShown: Bool
    @Binding var image: Image?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var isShown: Bool
        @Binding var image: Image?

        init(isShown: Binding<Bool>, image: Binding<Image?>) {
            _isShown = isShown
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            isShown = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown = false
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

}


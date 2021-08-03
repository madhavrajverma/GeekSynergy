//
//  ImagePicker.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/29/21.
//




import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isShown: Bool
    @Binding var originalImage: UIImage?
    
    init(isShown: Binding<Bool>, originalImage: Binding<UIImage?>) {
        _isShown = isShown
        _originalImage = originalImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if  let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            isShown = false
            originalImage = uiImage
        }
       
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
//    @Binding var image: Image?
    @Binding var originalImage: UIImage?
    var sourceType: SourceType
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, originalImage: $originalImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType == .camera ? .camera : .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
}

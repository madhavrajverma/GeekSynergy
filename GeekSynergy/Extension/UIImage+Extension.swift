//
//  UIImage+Extension.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/11/21.
//

import Foundation
import  UIKit


extension UIImage {
    
    func resized(withPercentage percentage :CGFloat ,isOpaque :Bool = true) -> UIImage {
        
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        
        return UIGraphicsImageRenderer(size: canvas, format: format).image { (_) in
            draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    
    
    func resized(width:CGFloat) -> UIImage? {
        
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        let format = imageRendererFormat
        
        return UIGraphicsImageRenderer(size: canvas,format: format).image { (_) in
            draw(in: CGRect(origin: .zero, size: canvas))
        }
    
    }
    
}

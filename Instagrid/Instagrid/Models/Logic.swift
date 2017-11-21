//
//  Logic.swift
//  Instagrid
//
//  Created by Mathieu Janneau on 20/11/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation
import UIKit
/**
 This class handles all the logic and calculations.
 Methods:
 ## convertUiviewToImage()
 convert collageView to image
 ## checkIfImageLoaded()
 check if an UIimageView has an image
 ## checkIfFullThreeViewsLayout()
 check if a 3 images layout has images in all ImageViews
 ## checkIfFullFourViewsLayout()
 check if a 4 images layout has images in all ImageViews
 */
class Logic {
  /// This function authorize the user to import images from the library
  
  func convertUiviewToImage(from view:CollageView) -> UIImage?{
    
    // if images of the layout all contains an UIImage
    // Define the zone we want capture
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
    // capture the image
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return img
  }
  
  /**
   Function to check if an UIImageView has an Image Inside
   - returns: Bool
 */
 func checkIfImageLoaded(view:UIImageView) -> Bool{
     var imageLoaded = false
      if view.image != nil{
        print("il y a une image")
        imageLoaded = true
      } else {
        imageLoaded = false
    }
    return imageLoaded
  }
  
  /**
   Function to check if a 3 images lcollage is full
   - important: the 3 parameters are UIImageViews not UIImages nor UIViews
   - returns: Bool
   */
  func checkIfFullThreeViewsLayout(_ view1: UIImageView, _ view2: UIImageView, _ view3: UIImageView) -> Bool {
    var checkSuccess = false
    if view1.image != nil && view2.image != nil && view3.image != nil{
      checkSuccess = true
    }else{
      checkSuccess = false
    }
    return checkSuccess
  }
  
  /**
   Function to check if a 4 images lcollage is full
   - important: the 4 parameters are UIImageViews not UIImages nor UIViews
   - returns: Bool
   */
  func checkIfFullFourViewsLayout(_ view1: UIImageView, _ view2: UIImageView, _ view3: UIImageView, _ view4: UIImageView) -> Bool {
    var checkSuccess = false
    if view1.image != nil && view2.image != nil && view3.image != nil && view4.image != nil {
      checkSuccess = true
    }else{
      checkSuccess = false
    }
    return checkSuccess
  }

  func checkOrientation() -> Bool {
    var landscapeOrientation = false
    if UIDevice.current.orientation.isLandscape {
      landscapeOrientation = true
      print("Landscape")
    } else{
      print("Portrait")
      landscapeOrientation = false
    }
     return landscapeOrientation
}
}

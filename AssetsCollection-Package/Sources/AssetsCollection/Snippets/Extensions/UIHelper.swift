//
// MARK: UIHelper
//
//
//  Created by Kovs on 08.08.2023.
//  Copyright © 2023 CodingKovs. All rights reserved.
//

import UIKit

enum UIHelper {
    
    static func createTwoColumnLayout(in view: UIView) -> UICollectionViewLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 2
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 30)
        
        return flowLayout
    }
    
    static func giveOpacityAnimation(duration: Double, from value: Int, toValue: Int) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = value
        animation.toValue = toValue
        animation.duration = CFTimeInterval(duration)
        
        return animation
    }
    
    @available(iOS 13.0, *)
    static func giveConfigForImage(size: CGFloat, weight: UIImage.SymbolWeight) -> UIImage.SymbolConfiguration {
        let config = UIImage.SymbolConfiguration(pointSize: size, weight: weight)
        return config
    }
}

//
// MARK: MVP implementation code snippets
//
//
//  Created by Kovs on 02.08.2023.
//  Copyright © 2023 CodingKovs. All rights reserved.
//

import Foundation
import UIKit


// MARK: - _Presenter.swift

protocol _ViewProtocol: AnyObject {
    // vc methods and properties
}

protocol _PresenterProtocol: AnyObject {
    // presenter methods and properties
    init(view: _ViewProtocol)
}

final class _Presenter: _PresenterProtocol {
    
    weak var view: _ViewProtocol?
    // presenter methods and properties
    
    required init(view: _ViewProtocol) {
        self.view = view
    }
    
    // realization
    
}


// MARK: - _VC.swift

class _VC: UIViewController {
    
    var presenter: _Presenter!
    
    
    // MARK: - viewDidLoad
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
    
    // MARK: - UI func
        func configureUI() {
            
            
            
        }
    
    
    
}


// MARK: - Protocol
extension _VC: _ViewProtocol {
    
}

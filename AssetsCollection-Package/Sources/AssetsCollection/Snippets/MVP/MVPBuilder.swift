//
// MARK: MVP Builder implementation code snippets
//
//
//  Created by Kovs on 08.08.2023.
//  Copyright © 2023 CodingKovs. All rights reserved.
//

import UIKit

protocol BuilderProtocol {
    func get_Module() -> UIViewController
}

final class Builder: BuilderProtocol {
    
    func get_Module() -> UIViewController {
        let view = _VC()
        let presenter = _Presenter(view: view)
        view.presenter = presenter
        return view
    }
    
    
}



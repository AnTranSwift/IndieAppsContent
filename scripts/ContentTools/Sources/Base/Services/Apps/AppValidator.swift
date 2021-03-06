//
//  Copyright © 2020 An Tran. All rights reserved.
//

import Files
import Yams

struct AppValidator {
    
    let folder: Folder
    
    func validate() throws {
        let appFile = try folder.file(named: "app.yml")
        
        let content = try appFile.readAsString()
        let decoder = YAMLDecoder()
        let app = try decoder.decode(App.self, from: content, userInfo: [:])
        
        guard app.id == folder.name else {
            throw ValidateError.idNotMatched
        }
    }
    
    enum ValidateError: Error {
        case idNotMatched
    }
}

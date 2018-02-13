//
//  DeleteDocumentsAction.swift
//  OpenSim
//
//  Created by Andrew Liu on 2/13/18.
//  Copyright © 2018 Luo Sheng. All rights reserved.
//

import Cocoa

final class DeleteDocumentsAction: ApplicationActionable {
    
    var application: Application?
    
    let title = NSLocalizedString("Delete App Documents", comment: "")
    
    let icon = templatize(#imageLiteral(resourceName: "uninstall"))
    
    let isAvailable = true
    
    init(application: Application) {
        self.application = application
    }
    
    func perform() {
        guard let url = application?.sandboxUrl else {
            return
        }
        
        let fileURLs = FileManager.default.enumerator(at: url, includingPropertiesForKeys:nil)
        while let fileURL: URL = fileURLs?.nextObject() as? URL {
            do {
                try FileManager.default.removeItem(at: fileURL)
            } catch {
                print(error)
            }
        }
    }
}

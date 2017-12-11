//
//  FileManager+document.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 10/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation

extension FileManager {
    
    public static func documentURL() -> URL? {
        return documentURL(childpath: nil)
    }
    
    public static func documentURL(childpath: String?) -> URL? {
        if let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            if let path = childpath {
                return docURL.appendingPathComponent(path)
            }
            return docURL
        }
        return nil
    }
}

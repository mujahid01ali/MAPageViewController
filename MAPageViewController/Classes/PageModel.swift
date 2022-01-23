//
//  PageModel.swift
//  PageController
//
//  Created by Mujahid Ali on 23/01/22.
//

import Foundation
import UIKit

public struct PageArray {
    var pages: [Page]?
    public init() {}
    public init(pages: [Page]) {
        self.pages = pages
    }
}

public struct Page {
    var text: String?
    var textColor: String?
    var image: String?
    var description: String?
    var descriptionColor: String?
    public init() {}
    public init(text: String, textColor: String, image: String, description: String, descriptionColor: String) {
        self.text = text
        self.textColor = textColor
        self.image = image
        self.description = description
        self.descriptionColor = descriptionColor
    }
}

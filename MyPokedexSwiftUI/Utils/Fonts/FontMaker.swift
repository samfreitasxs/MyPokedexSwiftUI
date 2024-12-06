//
//  FontMaker.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 06/12/24.
//

import Foundation
import SwiftUI

public enum FontNames: String {
    case poppinsRegular = "Poppins-Regular"
    case poppinsLight = "PoppinsLight"
    case poppinsBold = "PoppinsBold"
    case poppinsMedium = "PoppinsMedium"
    case poppinsSemiBold = "PoppinsSemiBold"
}

struct FontMaker {
    static func makeFont(_ font: FontNames, _ size: CGFloat) -> Font {
        Font.custom(font.rawValue, size: size)
    }
}

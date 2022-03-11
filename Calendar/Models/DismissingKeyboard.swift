//
//  DismissingKeyboard.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

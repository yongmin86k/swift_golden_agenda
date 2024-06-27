//
//  StringExtnesions.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-24.
//

import Foundation

extension String
{
    func paddingEnd(length: Int = 0, chars: String = "") -> String
    {
        return self.padding(toLength: length, withPad: chars, startingAt: 0)
    }
    
    func paddingStart(length: Int = 0, chars: String = "") -> String
    {
        return String(String(self.reversed()).padding(toLength: length, withPad: chars, startingAt: 0).reversed())
    }
}

//
//  SuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by Pavel Antonov on 11.02.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    func suffixArrayHasEntries() -> Bool
    func addAllObjects() -> TimeInterval
    func sortArray() -> TimeInterval
    func find(_ count: Int) -> (TimeInterval, Int)
}

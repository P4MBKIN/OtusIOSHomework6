//
//  SwiftSuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by Pavel Antonov on 11.02.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

open class SwiftSuffixArrayManipulator: SuffixArrayManipulator {
    typealias SuffixAlgo = (String, String)
    fileprivate var suffixArrayManipulate = Array<SuffixAlgo>()
    fileprivate var sortedSuffixArrayManipulate = Array<SuffixAlgo>()
    fileprivate let generator = StringGenerator()
    
    func addAllObjects() -> TimeInterval {
        return Profiler.runClosureForTime {
            for sort in Services.algoProvider.all {
                self.suffixArrayManipulate.append(contentsOf: SuffixSequence(string: sort).map { ($0, sort) })
            }
        }
    }
    
    func sortArray() -> TimeInterval {
        return Profiler.runClosureForTime {
            self.sortedSuffixArrayManipulate = self.suffixArrayManipulate.sorted(by: { $0.0 < $1.0 })
        }
    }
}

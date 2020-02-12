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
    
    func suffixArrayHasEntries() -> Bool {
      if (sortedSuffixArrayManipulate.count == 0) {
        return false
      } else {
        return true
      }
    }
    
    func addAllObjects() -> TimeInterval {
        return Profiler.runClosureForTime {
            self.suffixArrayManipulate = Array<SuffixAlgo>()
            for sort in Services.algoProvider.sortings {
                let algoName = sort.name
                self.suffixArrayManipulate.append(contentsOf: SuffixSequence(string: algoName).map { ($0, algoName) })
            }
        }
    }
    
    func sortArray() -> TimeInterval {
        return Profiler.runClosureForTime {
            self.sortedSuffixArrayManipulate = Array<SuffixAlgo>()
            self.sortedSuffixArrayManipulate = self.suffixArrayManipulate.sorted(by: { $0.0 < $1.0 })
        }
    }
    
    private func generateSequences(_ count: Int) -> Array<String> {
        var sequences = Array<String>()
        for _ in 0..<count {
            sequences.append(generator.generateRandomString(3))
        }
        return sequences
    }
    
    func find(_ count: Int) -> (TimeInterval, Int) {
        let sequences = generateSequences(count)
        var number = 0
        let time = Profiler.runClosureForTime {
            for seq in sequences {
                number += self.sortedSuffixArrayManipulate.filter{$0.0.contains(seq)}.count
            }
        }
        return (time, number)
    }
}

//
//  URLType.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/12.
//

import Foundation

enum URLType {
    case capsuleInfo
    case capsuleName
    
    case marbleList
    case addMarble
    case marbleCheck(Int)
    
    var baseURL: String {
        return "www.vivi-pr.shop/"
    }
    
    var makeURL: String {
        switch self {
        case .capsuleInfo:
            return "\(baseURL)/v1/capsules"
        case .capsuleName:
            return "\(baseURL)/v1/capsules/name"
            
        case .marbleList:
            return "\(baseURL)/v1/marbles"
        case .addMarble:
            return "\(baseURL)/v1/marbles"
        case .marbleCheck(let id):
            return "\(baseURL)/v1/marbles/\(id)/check"
    
        }
    }
}
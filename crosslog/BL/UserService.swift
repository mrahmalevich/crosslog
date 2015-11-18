//
//  UserService.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import MagicalRecord

// TODO: handling authorization

class UserService {
    
    var authorizedUser: User?
    var isAuthorized: Bool {
        get {
            return (authorizedUser != nil) ? true : false
        }
    }
    
    // MARK - Initialization
    static let sharedInstane: UserService = {
        let instance = UserService()
        return instance
    }()
    
    init() {
        authorizedUser = nil
    }
    
    // MARK - Public methods
    func login() {
        let templateUserID = "-1000"
        var user: User? = User.MR_findFirstByAttribute("backendId", withValue: templateUserID)
        if user == nil {
            user = User.MR_createEntity()
            user!.backendId = templateUserID
            NSManagedObjectContext.MR_defaultContext().saveToPersistentStoreAndWait()
        }
        self.authorizedUser = user
    }
}
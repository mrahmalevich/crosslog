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

let kAuthorizedUserIDKey = "kAuthorizedUserIDKey"

class UserService {
    
    var authorizedUser: User?
    var isAuthorized: Bool {
        get {
            return (authorizedUser != nil) ? true : false
        }
    }
    
    // MARK - Initialization
    static let sharedInstance: UserService = {
        let instance = UserService()
        return instance
    }()
    
    init() {
        if let authorizedUserID = NSUserDefaults.standardUserDefaults().objectForKey(kAuthorizedUserIDKey) {
            if let user = User.MR_findFirstByAttribute("backendId", withValue: authorizedUserID) {
                self.authorizedUser = user
            }
        }
    }
    
    // MARK - Public methods
    func loginWithCompletion(completion: ErrorClosure?) {
        let templateUserID = "-1000"
        var user = User.MR_findFirstByAttribute("backendId", withValue: templateUserID)
        if user == nil {
            user = User.MR_createEntity()
            user.backendId = templateUserID
            user.firstName = "Vasiliy"
            user.lastName = "Siniy"
            
            let gym = Gym.MR_createEntity()
            gym.backendId = "-1000"
            gym.name = "CROSSFIT REDYAR"
            gym.photoUrl = "https://pp.vk.me/c624029/v624029334/35b71/irJVLy-6Ur4.jpg"
            gym.address = "ТРК Комсомолл, 4 этаж, ул. Белинского, 8, Красноярск"
            gym.phone = "+7 (391) 232-10-47"
            gym.addUsersObject(user)
            
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        }
        self.authorizedUser = user
        
        NSUserDefaults.standardUserDefaults().setObject(user!.backendId, forKey: kAuthorizedUserIDKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        TransitionsMediator.sharedInstance.processAuthorization(animated: true)
        
        if let completion = completion {
            completion(error: nil)
        }
    }
    
    func logout() {
        self.authorizedUser = nil
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey(kAuthorizedUserIDKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        TransitionsMediator.sharedInstance.showAuthorization(animated: true)
    }
}
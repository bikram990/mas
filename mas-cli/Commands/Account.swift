//
//  Account.swift
//  mas-cli
//
//  Created by Andrew Naylor on 21/08/2015.
//  Copyright (c) 2015 Andrew Naylor. All rights reserved.
//

struct AccountCommand: CommandProtocol {
    typealias Options = NoOptions<MASError>
    let verb = "account"
    let function = "Prints the primary account Apple ID"
    
    func run(_ options: Options) -> Result<(), MASError> {
        if let account = ISStoreAccount.primaryAccount {
            print(account.identifier)
        }
        else {
            print("Not signed in")
            return .failure(MASError(code: .notSignedIn))
        }
        return .success(())
    }
}

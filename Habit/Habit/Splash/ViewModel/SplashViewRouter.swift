//
//  SplashViewRouter.swift
//  Habit
//
//  Created by David Arcari on 21/11/22.
//

import SwiftUI

enum SplashViewRouter {
  
  static func makeSignInView() -> some View {
    let viewModel = SignInViewModel()
    return SignInView(viewModel: viewModel)
  }
}

//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by David Arcari on 23/11/22.
//

import SwiftUI

enum SignUpViewRouter {
  static func makeHomeView() -> some View {
    let viewModel = HomeViewModel()
    return HomeView(viewModel: viewModel)
  }
}

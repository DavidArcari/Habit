//
//  SignUpViewModel.swift
//  Habit
//
//  Created by David Arcari on 23/11/22.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
  
  @Published var uiState: SignInUIState = .nome
  
}

extension SignUpViewModel {
  func homeView() -> some View {
    return SignUpViewRouter.makeHomeView()
  }
}

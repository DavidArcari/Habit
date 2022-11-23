//
//  SignInViewModel.swift
//  Habit
//
//  Created by David Arcari on 21/11/22.
//

import SwiftUI

class SignInViewModel: ObservableObject {
  
  @Published var uiState: SignInUIState = .nome
  
  func login(email: String, password: String) {
    self.uiState = .loading
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.uiState = .goToHomeScreen
    }
  }
}

extension SignInViewModel {
  func homeView() -> some View {
    return SignInViewRouter.makeHomeView()
  }
  func signUpView() -> some View {
    return SignInViewRouter.makeSignUpView()
  }
}

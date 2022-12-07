//
//  SplashView.swift
//  Habit
//
//  Created by David Arcari on 17/11/22.
//

import SwiftUI

struct SplashView: View {
  
  @ObservedObject var viewModel: SplashViewModel
  
  var body: some View {
    Group {
      switch viewModel.uiState {
      case .loading:
        loadingView()
      case .goToSignInScreen:
        viewModel.signInView()
      case .goToHomeScreen:
        Text("carregar tela principal")
      case .error(let msgError):
        loadingView(error: msgError)
      }
    }.onAppear(perform: viewModel.onAppear)
  }
}

extension SplashView {
  func loadingView(error: String? = nil) -> some View {
    ZStack{
      Image("logo")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: 250, maxHeight: 250)
        .padding(20)
        .background(Color.white)
        .ignoresSafeArea()
      
      if let error = error {
        Text("")
          .alert(isPresented: .constant(true)) {
            Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")) {
              //faz algo quando a tela sumir
            })
          }
      }
    }
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = SplashViewModel()
    SplashView(viewModel: viewModel)
  }
}

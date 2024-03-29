//
//  SigninView.swift
//  Habit
//
//  Created by David Arcari on 21/11/22.
//

import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel
  
  @State var email = ""
  @State var password = ""
  @State var action: Int? = 0
  @State var navigationHidden = true
  
  var body: some View {
    ZStack {
      if case SignInUIState.goToHomeScreen = viewModel.uiState {
        viewModel.homeView()
      } else {
        NavigationView {
          ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
              Spacer(minLength: 36)
              VStack(alignment: .center) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .padding(.horizontal, 40)
                Text("Login")
                  .foregroundColor(.orange)
                  .font(Font.system(.title).bold())
                  .padding(.bottom, 8)
                emailField
                passwordField
                enterButton
                registerLink
                Text("Copyright @davidarcari")
                  .foregroundColor(Color.gray)
                  .font(Font.system(size: 16).bold())
                  .padding(.top, 16)
              }
            }
            if case SignInUIState.error(let value) = viewModel.uiState {
              Text("")
                .alert(isPresented: .constant(true)) {
                  Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("OK")) {
                    // faz algo quando o alert sumir
                  })
                }
            }
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .padding(.horizontal, 20)
          .background(Color.white)
          .navigationBarTitle("Login", displayMode: .inline)
        }
        .onAppear {
          self.navigationHidden = true
        }
        .onDisappear {
          self.navigationHidden = false
        }
      }
    }
  }
}

extension SignInView {
  var emailField: some View {
    TextField("", text: $email)
      .border(Color.black)
  }
}

extension SignInView {
  var passwordField: some View {
    SecureField("", text: $password)
      .border(Color.black)
  }
}

extension SignInView {
  var enterButton: some View {
    Button("Entrar") {
      viewModel.login(email: email, password: password)
    }
  }
}

extension SignInView {
  var registerLink: some View {
    VStack {
      Text("Ainda não sou cadastrado")
        .foregroundColor(.gray)
        .padding(.top, 48)
      ZStack {
        NavigationLink(
          destination: viewModel.signUpView(),
          tag: 1,
          selection: $action,
          label: { EmptyView() })
        Button("Realize seu Cadastro") {
          self.action = 1
        }
      }
    }
  }
}
  
struct SignView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
  }
}

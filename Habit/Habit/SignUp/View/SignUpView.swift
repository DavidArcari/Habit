//
//  SignUpView.swift
//  Habit
//
//  Created by David Arcari on 23/11/22.
//

import SwiftUI

struct SignUpView: View {
  
  //name
  //email
  //password
  //cpf
  //phone
  //birthday
  //gender
  
  @State var fullName = ""
  @State var email = ""
  @State var password = ""
  @State var cpf = ""
  @State var phone = ""
  @State var birthday = ""
  @State var gender = Gender.male
  
  @ObservedObject var viewModel: SignUpViewModel
  
  var body: some View {
    ZStack {
      ScrollView(showsIndicators: false) {
        VStack(alignment: .center) {
          VStack(alignment: .leading, spacing: 8) {
            Text("Cadastro")
              .foregroundColor(.black)
              .font(Font.system(.title).bold())
              .padding(.bottom, 8)
            fullNameField
            emailField
            passwordField
            cpfField
            phoneField
            birthdayField
            genderField
            saveButton
          }
          Spacer()
        }.padding(.horizontal, 8)
      }.padding()
      if case SignUpUIState.error(let value) = viewModel.uiState {
        Text("")
          .alert(isPresented: .constant(true)) {
            Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
              //faz algo quando a tela sumir
            })
          }
      }
    }
  }
}

extension SignUpView {
  var fullNameField: some View {
    TextField("", text: $fullName)
      .border(Color.black)
  }
}

extension SignUpView {
  var emailField: some View {
    TextField("", text: $email)
      .border(Color.black)
  }
}

extension SignUpView {
  var passwordField: some View {
    TextField("", text: $password)
      .border(Color.black)
  }
}

extension SignUpView {
  var cpfField: some View {
    TextField("", text: $cpf)
      .border(Color.black)
  }
}

extension SignUpView {
  var phoneField: some View {
    TextField("", text: $phone)
      .border(Color.black)
  }
}

extension SignUpView {
  var birthdayField: some View {
    TextField("", text: $birthday)
      .border(Color.black)
  }
}

extension SignUpView {
  var genderField: some View {
    Picker("Gender", selection: $gender) {
      ForEach(Gender.allCases, id: \.self) {
        value in Text(value.rawValue)
          .tag(value)
      }
    }.pickerStyle(SegmentedPickerStyle())
      .padding(.top, 16)
      .padding(.bottom, 32)
  }
}

extension SignUpView {
  var saveButton: some View {
    Button("Realize seu Cadastro") {
      // viewModel.???
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView(viewModel: SignUpViewModel())
  }
}

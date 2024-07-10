//
//  RegisterViewController.swift
//  euro2024app
//
//  Created by Хамидуллин Марат Романович on 10.07.2024.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmRegisterButton: UIButton!
    @IBOutlet weak var birthDate: UITextField!
    @IBOutlet weak var favouriteTeamsTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var registerImage: UIImageView!
    @IBAction func buttonToAuth(_ sender: UIButton) {
        if let mainStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            mainStoryboard.modalPresentationStyle = .fullScreen
            self.present(mainStoryboard, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.placeholder = "Придумайте логин"
        passwordTextField.placeholder = "Придумайте пароль"
        confirmRegisterButton.layer.cornerRadius = 20
        fullNameTextField.placeholder = "Введите имя или придумайте юзернейм"
        birthDate.placeholder = "Введите дату рождения"
        emailTextField.placeholder = "@example.com"
        favouriteTeamsTextField.placeholder = "Ваша любимая команда"
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let login = loginTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              let fullName = fullNameTextField.text,
              let birthDate = birthDate.text,
              !fullName.isEmpty,!email.isEmpty,!birthDate.isEmpty,!login.isEmpty,!password.isEmpty else {
            showAlert(message: "Заполните все поля")
            return
        }
        
        let additionalInfo = favouriteTeamsTextField.text ?? ""
        
        let newUser: [String: Any] = [
                  "login": login,
                  "email": email,
                  "password": password,
                  "fullName": fullName,
                  "birthDate": birthDate,
                  "additionalInfo": additionalInfo
              ]

              var allUsers = UserDefaults.standard.dictionary(forKey: "allUsers") as? [String: Any] ?? [:]

              if allUsers[login] != nil {
                  showAlert(message: "Такой логин уже занят")
                  return
              }

              allUsers[login] = newUser

              UserDefaults.standard.set(allUsers, forKey: "allUsers")
              UserDefaults.standard.set(login, forKey: "currentUsername")

        if let mainStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            mainStoryboard.modalPresentationStyle = .fullScreen
            self.present(mainStoryboard, animated: true, completion: nil)
        }
    }
    private func showAlert(message: String) {
           let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
}

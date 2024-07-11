//
//  LoginViewController.swift
//  euro2024app
//
//  Created by Хамидуллин Марат Романович on 10.07.2024.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var authImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func loginTappedButton(_ sender: UIButton) {
        guard let login = loginTextField.text, let password = passwordTextField.text else {
            let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard let allUsers = UserDefaults.standard.dictionary(forKey: "allUsers") as? [String: Any],
              let storedUserData = allUsers[login] as? [String: Any],
              let storedPassword = storedUserData["password"] as? String else {
            showAlert(message: "Данные для входа не найдены")
            return
        }
        
        if password == storedPassword {
            UserDefaults.standard.set(login, forKey: "currentUsername")
            if let mainTabBarController = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
                mainTabBarController.modalPresentationStyle = .fullScreen
                self.present(mainTabBarController, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func buttonToReg(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let registrationVC = mainStoryboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.present(registrationVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        registerButton.layer.cornerRadius = 20
        loginTextField.placeholder = "Введите логин"
        passwordTextField.placeholder = "Введите пароль"
    }
    private func showAlert(message: String) {
           let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
}

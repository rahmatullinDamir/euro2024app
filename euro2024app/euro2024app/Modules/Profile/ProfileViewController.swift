//
//  ProfileViewController.swift
//  Authorizaton
//
//  Created by Хамидуллин Марат Романович on 09.07.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var additionalInfoTextView: UITextView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var FIO: UILabel!
    @IBOutlet weak var Pochta: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var mainInfo: UILabel!
    @IBOutlet weak var addInfo: UILabel!
    @IBOutlet weak var Team: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        if let mainStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            mainStoryboard.modalPresentationStyle = .fullScreen
            self.present(mainStoryboard, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let login = UserDefaults.standard.string(forKey: "currentUsername"),
              let allUsers = UserDefaults.standard.dictionary(forKey: "allUsers") as? [String: Any],
              let userData = allUsers[login] as? [String: Any] else {
            showAlert(message: "Данные пользователя не найдены")
            return
        }
        
        let email = userData["email"] as? String ?? "Нет данных"
        let fullName = userData["fullName"] as? String ?? "Нет данных"
        let birthDate = userData["birthDate"] as? String ?? "Нет данных"
        let additionalInfo = userData["additionalInfo"] as? String ?? "Нет данных"
        
        emailLabel.text = email
        fullNameLabel.text = fullName
        birthDateTextField.text = birthDate
        additionalInfoTextView.text = additionalInfo
        profileImageView.image = UIImage(named: "ProfilePhoto")
        
        let imageAttachment = NSTextAttachment()
        let image = UIImage(systemName: "person")?.withTintColor(.gray)
        imageAttachment.image = image
        let imageOffsetY: CGFloat = -3.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 20, height: 20)
        let fullString = NSMutableAttributedString(string: "")
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        let textString = NSAttributedString(string: " ФИО")
        fullString.append(textString)
        FIO.attributedText = fullString
        
        let pochtaImageAttachment = NSTextAttachment()
        let pochtaImage = UIImage(systemName: "envelope")?.withTintColor(.gray)
        pochtaImageAttachment.image = pochtaImage
        let pochtaImageOffsetY: CGFloat = -3.0
        pochtaImageAttachment.bounds = CGRect(x: 0, y: pochtaImageOffsetY, width: 20, height: 20)
        let pochtaString = NSMutableAttributedString(string: "")
        let pochtaImageString = NSAttributedString(attachment: pochtaImageAttachment)
        pochtaString.append(pochtaImageString)
        let pochtaTextString = NSAttributedString(string: " Почта")
        pochtaString.append(pochtaTextString)
        Pochta.attributedText = pochtaString
        
        let dateImageAttachment = NSTextAttachment()
        let dateImage = UIImage(systemName: "calendar")?.withTintColor(.gray)
        dateImageAttachment.image = dateImage
        let dateImageOffsetY: CGFloat = -3.0
        dateImageAttachment.bounds = CGRect(x: 0, y: dateImageOffsetY, width: 20, height: 20)
        let dateString = NSMutableAttributedString(string: "")
        let dateImageString = NSAttributedString(attachment: dateImageAttachment)
        dateString.append(dateImageString)
        let dateTextString = NSAttributedString(string: " Дата рождения")
        dateString.append(dateTextString)
        Date.attributedText = dateString
        
        let teamImageAttachment = NSTextAttachment()
        let teamImage = UIImage(systemName: "suit.heart")?.withTintColor(.gray)
        teamImageAttachment.image = teamImage
        let teamImageOffsetY: CGFloat = -3.0
        teamImageAttachment.bounds = CGRect(x: 0, y: teamImageOffsetY, width: 20, height: 20)
        let teamString = NSMutableAttributedString(string: "")
        let teamImageString = NSAttributedString(attachment: teamImageAttachment)
        teamString.append(teamImageString)
        let teamTextString = NSAttributedString(string: " Любимая команда")
        teamString.append(teamTextString)
        Team.attributedText = teamString
        let backgroundView1 = UIView()
        backgroundView1.backgroundColor = UIColor(named: "myColor")
        backgroundView1.frame = CGRect(x: 50, y: 340, width: 300, height: 216)
        backgroundView1.layer.cornerRadius = 20
        view.addSubview(backgroundView1)
        view.addSubview(fullNameLabel)
        view.addSubview(FIO)
        view.addSubview(Pochta)
        view.addSubview(emailLabel)
        view.addSubview(Date)
        view.addSubview(birthDateTextField)
        let backgroundView2 = UIView()
        backgroundView2.backgroundColor = UIColor(named: "myColor")
        backgroundView2.frame = CGRect(x: 50, y: 630, width: 300, height: 130)
        backgroundView2.layer.cornerRadius = 20
        view.addSubview(backgroundView2)
        view.addSubview(Team)
        view.addSubview(additionalInfoTextView)
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

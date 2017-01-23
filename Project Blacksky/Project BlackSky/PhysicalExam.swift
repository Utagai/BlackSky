//
//  PhysicalExam.swift
//  Project BlackSky
//
//  Created by Deven  on 11/28/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit


class PhysicalExam: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.white
    }
    
    //TODO: Pull from class info
    var doctorName = "Doctor Name"
    
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    let purpleColor = UIColor(hue: 0.9277777778, saturation: 1, brightness: 0.74, alpha: 1.0)

    
    // Initializes labels and buttons
    let titleLabel: UILabel = UILabel()
    
    let chestImage = UIImage(named:"Chest") as UIImage?
    let chestButton   = UIButton(type: UIButtonType.custom)
    
    let headImage = UIImage(named: "Head") as UIImage?
    let headButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let leftArmImage = UIImage(named: "LeftArm") as UIImage?
    let leftArmButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let leftLegImage = UIImage(named: "LeftLeg") as UIImage?
    let leftLegButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let PelvisImage = UIImage(named: "Pelvis") as UIImage?
    let PelvisButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let rightArmImage = UIImage(named: "RightArm") as UIImage?
    let rightArmButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let rightLegImage = UIImage(named: "RightLeg") as UIImage?
    let rightLegButton = UIButton(type: UIButtonType.custom) as UIButton
    
    let torsoImage = UIImage(named: "Torso") as UIImage?
    let torsoButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let internalLabel:UILabel = UILabel()
    let externalLabel:UILabel = UILabel()
    
    let internalButton:UIButton = UIButton()
    let externalButton:UIButton = UIButton()
    
    let boxEmpty = UIImage(named: "BlueBoxEmpty") as UIImage?
    let boxFilled = UIImage(named: "BlueBoxFilled") as UIImage?
    
    let maleSelected = UIImage(named: "MaleChecked") as UIImage?
    let maleNotSelected = UIImage(named: "MaleUnchecked") as UIImage?
    
    let femaleSelected = UIImage(named: "FemaleChecked") as UIImage?
    let femaleNotSelected = UIImage(named: "FemaleUnchecked") as UIImage?
    

    let maleButton: UIButton = UIButton()
    let femaleButton: UIButton = UIButton()
    let notesButton: UIButton = UIButton()
    let createOtherButton: UIButton = UIButton()
    let labWorkYes: UIButton = UIButton()
    let labWorkNo: UIButton = UIButton()
    let Skipbutton: UIButton = UIButton(type: UIButtonType.custom)
    let reviewSymptomsTextView: UITextView = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let underlineAttributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
            NSForegroundColorAttributeName : purpleColor,
            NSUnderlineStyleAttributeName : 1] as [String : Any]
        
        let blueUnderlineAttributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
            NSForegroundColorAttributeName : tealColor,
            NSUnderlineStyleAttributeName : 1] as [String : Any]

        
        // Makes navigaiton bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: width, height: height/20)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrowTeal"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(MainMenu.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: tealColor, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 30)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.blue
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(MainMenu.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = tealColor
        
        // Makes top title text
        
        let bigBlueAttributes = [NSForegroundColorAttributeName: tealColor, NSFontAttributeName: UIFont.systemFont(ofSize: 60)]
        
        let smallBlueAttributes = [NSForegroundColorAttributeName: tealColor, NSFontAttributeName: UIFont.systemFont(ofSize: 35)]
        
        let smallGreyAttributes = [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 25)]
        
        let bigBlueText = NSMutableAttributedString(string: "PHYSICAL EXAMINATION\n", attributes: bigBlueAttributes)
        let smallBlueText = NSMutableAttributedString(string: "PLEASE FILL IN THE REGIONS ACCORDING\nTO EACH STEP OF YOUR PHYSICAL EXAM\n", attributes: smallBlueAttributes)
        let smallGreyText = NSMutableAttributedString(string: "to mark normal (blue): single tap the region\nto mark abnormal (red): double tap the region\nto add notes: single tap & hold the region", attributes: smallGreyAttributes)
        
        let fullTitleString = NSMutableAttributedString()
        
        fullTitleString.append(bigBlueText)
        fullTitleString.append(smallBlueText)
        fullTitleString.append(smallGreyText)
        
        print(fullTitleString)
        
        titleLabel.frame = CGRect(x: 0, y: height/20 + 25, width: width, height: height/20)
        titleLabel.textColor = tealColor
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = fullTitleString
        titleLabel.sizeToFit()
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.center.x = self.view.center.x
        self.view.addSubview(titleLabel)
        
        chestButton.setImage(chestImage, for: .normal)
        chestButton.frame = CGRect(x:self.view.center.x,y: 0.40 * height,width:85,height:80)
        chestButton.imageView?.contentMode = .scaleAspectFill
        chestButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        chestButton.contentEdgeInsets =  UIEdgeInsetsMake(1, 2, 4, 2) //(top, left, bottom, right)
        self.view.addSubview(chestButton)

        headButton.setImage(headImage, for: UIControlState.normal)
        headButton.frame = CGRect(x:self.view.center.x + 6,y: 0.34 * height,width: 60,height: 70)
        headButton.center.x = chestButton.center.x
        headButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        headButton.contentEdgeInsets =  UIEdgeInsetsMake(0, 0, 8, 0) //(top, left, bottom, right)
        self.view.addSubview(headButton)
        
        leftArmButton.frame = CGRect(x:width * 0.57 + 20,y:height * 0.41,width:75,height:175)
        leftArmButton.setImage(leftArmImage, for: .normal)
        leftArmButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        leftArmButton.contentEdgeInsets =  UIEdgeInsetsMake(0, 0, 0, 5) //(top, left, bottom, right)
        self.view.addSubview(leftArmButton)
        
        rightArmButton.frame = CGRect(x:self.view.center.x - 60,y:height * 0.41,width:75,height:175)
        rightArmButton.setImage(rightArmImage, for: .normal)
        rightArmButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        rightArmButton.contentEdgeInsets =  UIEdgeInsetsMake(0, 5, 0, 5) //(top, left, bottom, right)
        self.view.addSubview(rightArmButton)
        
        torsoButton.frame = CGRect(x:self.view.center.x + 10,y: 0.47 * height,width:85,height:60)
        torsoButton.center.x = chestButton.center.x + 2
        torsoButton.setImage(torsoImage, for: .normal)
        torsoButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        torsoButton.contentEdgeInsets =  UIEdgeInsetsMake(2, 2, 5, 2) //(top, left, bottom, right)
        self.view.addSubview(torsoButton)
        
        PelvisButton.frame = CGRect(x:self.view.center.x + 3,y: 0.52 * height,width:85,height:45)
        PelvisButton.center.x = chestButton.center.x
        PelvisButton.setImage(PelvisImage, for: .normal)
        PelvisButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        PelvisButton.contentEdgeInsets =  UIEdgeInsetsMake(2, 2, 5, 2) //(top, left, bottom, right)
        self.view.addSubview(PelvisButton)
        
        leftLegButton.frame = CGRect(x:self.view.center.x + 42,y: 0.55 * height,width:50,height:175)
        leftLegButton.setImage(leftLegImage, for: .normal)
        leftLegButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        self.view.addSubview(leftLegButton)
        
        rightLegButton.frame = CGRect(x:self.view.center.x - 7,y: 0.55 * height,width:50,height:175)
        rightLegButton.setImage(rightLegImage, for: .normal)
        rightLegButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
        self.view.addSubview(rightLegButton)
        
        let Nextbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Nextbutton.setImage(UIImage(named: "Next"), for: UIControlState.normal)
        //add function for button
        //set frame
        Nextbutton.frame = CGRect(x: width/2.3,y: 0.88 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(Nextbutton)
        Nextbutton.addTarget(self, action: Selector("skipClicked:"), for: UIControlEvents.touchUpInside)
        
        //set image for button
        Skipbutton.setImage(UIImage(named: "SKIP"), for: UIControlState.normal)
        Skipbutton.frame = CGRect(x: width/1.4,y: 0.88 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(Skipbutton)
        Skipbutton.addTarget(self, action: "skipClicked:", for: UIControlEvents.touchUpInside)
        
        creationFunctions.makeClearButton(notesButton, name: "NOTES", titleColor: purpleColor, location: CGRect(x: width/1.4,y: 0.77 * height, width: width * 0.25, height: height/11), page: self)
        let notesText = NSMutableAttributedString(string:"NOTES", attributes: underlineAttributes)
        notesButton.setAttributedTitle(notesText, for: UIControlState())
        notesButton.layer.borderWidth = 4.0
        notesButton.layer.borderColor = purpleColor.cgColor
        
        creationFunctions.makeClearButton(createOtherButton, name: "CREATE\n OTHER", titleColor: tealColor, location: CGRect(x: width * 0.05,y: 0.88 * height, width: width * 0.25, height: 1 * height/10), page: self)
        let createOtherText = NSMutableAttributedString(string:"CREATE\n OTHER", attributes: blueUnderlineAttributes)
        createOtherButton.titleLabel?.numberOfLines = 0
        createOtherButton.layer.borderWidth = 4.0
        createOtherButton.layer.borderColor = tealColor.cgColor
        createOtherButton.setAttributedTitle(createOtherText, for: UIControlState())
        
        let labWorkImage = UIImage(named: "RequestLabWork")
        let labWorkimageView = UIImageView(image: labWorkImage!)
        labWorkimageView.frame = CGRect(x: width/2.3,y: 0.72 * height, width: width * 0.25, height: height/6.8)
        self.view.addSubview(labWorkimageView)
        
        let reviewSymtomsImage = UIImage(named: "ReviewOfSymptoms")
        let reviewSymtomsimageView = UIImageView(image: reviewSymtomsImage!)
        reviewSymtomsimageView.frame = CGRect(x: width * 0.05,y: 0.41 * height, width: width * 0.25, height: height/3.5)
        self.view.addSubview(reviewSymtomsimageView)
        
        maleButton.setImage(maleNotSelected, for: UIControlState.normal)
        maleButton.frame = CGRect(x: width * 0.05,y: 0.78 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(maleButton)
        maleButton.addTarget(self, action: #selector(PhysicalExam.maleClicked(_:)), for: UIControlEvents.touchUpInside)
        
        femaleButton.setImage(femaleSelected, for: UIControlState.normal)
        femaleButton.frame = CGRect(x: width * 0.05,y: 0.69 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(femaleButton)
        femaleButton.addTarget(self, action: #selector(PhysicalExam.femaleClicked(_:)), for: UIControlEvents.touchUpInside)
        
        reviewSymptomsTextView.frame = CGRect(x: width * 0.06,y: 0.46 * height, width: width * 0.23, height: height/4.27)
        reviewSymptomsTextView.backgroundColor = UIColor.clear
        reviewSymptomsTextView.textColor = purpleColor
        reviewSymptomsTextView.font = UIFont(name: "Arial-BoldMT", size: 20)
        reviewSymptomsTextView.text = "I, (name of Member), do solemnly swear (or affirm) that I will support and defend the Constitution of the United States against all enemies, foreign or domestic; that I will bear true faith and allegiance to the same; that I take this obligation freely, without any mental reservation  or purpose of evasion; and that I will well and faithfully discharge the duties of the office on which I am about to enter.So help me God."
        self.view.addSubview(reviewSymptomsTextView)
        
        creationFunctions.makeButton(internalButton, name: "  INTERNAL", titleColor: tealColor, location: CGRect(x: width * 0.05,y: 0.32 * height, width: width * 0.2, height: height/20), page: self)
        internalButton.setImage(boxFilled, for: .normal)
        internalButton.addTarget(self, action: #selector(PhysicalExam.internalClicked(_:)), for: UIControlEvents.touchUpInside)
        
        creationFunctions.makeButton(externalButton, name: "  SKIN", titleColor: tealColor, location: CGRect(x: width * 0.05 - 22,y: 0.355 * height, width: width * 0.2, height: height/20), page: self)
        externalButton.setImage(boxEmpty, for: .normal)
        externalButton.addTarget(self, action: #selector(PhysicalExam.externalClicked(_:)), for: UIControlEvents.touchUpInside)
        
        creationFunctions.makeButton(labWorkNo, name: "   NO", titleColor: tealColor, location: CGRect(x: width/2.3 - 5,y: 0.72 * height + 92.5, width: width * 0.2, height: height/20), page: self)
        labWorkYes.setImage(boxFilled, for: .normal)
        labWorkYes.addTarget(self, action: #selector(PhysicalExam.labYesClicked(_:)), for: UIControlEvents.touchUpInside)
        
        creationFunctions.makeButton(labWorkYes, name: "   YES", titleColor: tealColor, location: CGRect(x: width/2.3,y: 0.72 * height + 57.5, width: width * 0.2, height: height/20), page: self)
        labWorkNo.setImage(boxEmpty, for: .normal)
        labWorkNo.addTarget(self, action: #selector(PhysicalExam.labNoClicked(_:)), for: UIControlEvents.touchUpInside)
        
        
        //Text views, body parts, resize images

        self.configureView()
    }
    
    func maleClicked(_ sender: UIButton){
        print("Male Clicked")
    }
    
    func femaleClicked(_ sender: UIButton){
        print("Male Clicked")
    }
    
    func internalClicked(_ sender: UIButton){
        print("Internal Clicked")
    }
    
    func externalClicked(_ sender: UIButton){
        print("External Clicked")
    }
    
    func labYesClicked(_ sender: UIButton){
        print("Lab Yes Clicked")
    }
    
    func labNoClicked(_ sender: UIButton){
        print("Lab No Clicked")
    }
    
    
    func backClicked(_ sender: UIBarButtonItem!){
        print("Back Clicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    func skipClicked(_ sender: UIBarButtonItem!){
        print("Skip Clicked")
    }
    
    func bodyPartSingleTapped(_ sender: UIButton){
        print(sender)
        if let image = sender.imageView?.image?.withRenderingMode(.alwaysTemplate) {
            sender.setImage(image, for: .normal)
            sender.tintColor = UIColor.red
        }
    }
    
    func switchInternalExternal(_ sender: UIButton){
        print(sender)
    }

}

//
//  ProfileViewController.h
//  MIVI
//
//  Created by Bhavan on 08/03/18.
//  Copyright © 2018 MIVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *DateTF;
@property (weak, nonatomic) IBOutlet UITextField *proguctNameTF;
@property (weak, nonatomic) IBOutlet UITextField *productPriceTF;
@property (weak, nonatomic) IBOutlet UITextField *usedDataTF;
@property (weak, nonatomic) IBOutlet UITextField *dataExpireDateTF;
@property (weak, nonatomic) IBOutlet UITextField *creditsPriceTF;
@property (weak, nonatomic) IBOutlet UITextField *creditsExpireDate;

@end

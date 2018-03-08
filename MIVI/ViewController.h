//
//  ViewController.h
//  MIVI
//
//  Created by Bhavan on 08/03/18.
//  Copyright © 2018 MIVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTf;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;
- (IBAction)loginButtonAction:(id)sender;

@end


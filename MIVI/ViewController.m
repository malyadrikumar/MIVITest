//
//  ViewController.m
//  MIVI
//
//  Created by Bhavan on 08/03/18.
//  Copyright © 2018 MIVI. All rights reserved.
//

#import "ViewController.h"
#import "SplashViewController.h"

@interface ViewController ()
{
    NSDictionary * getUserDetails;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSDictionary * collectionJsonDict = @{
                                          @"data":@{@"type":@"accounts",
                                                    @"id":@"2593177",
                                                    @"attributes":@{@"payment-type":@"prepaid",
                                                                    @"unbilled-charges":@"",
                                                                    @"next-billing-date":@"",
                                                                    @"title":@"Ms",
                                                                    @"first-name":@"Joe",
                                                                    @"last-name":@"Bloggs",
                                                                    @"date-of-birth": @"1985-01-01",
                                                                    @"contact-number": @"0404000000",
                                                                    @"email-address": @"test@mivi.com",
                                                                    @"email-address-verified":@"false",
                                                                    @"email-subscription-status": @"false"
                                                                    
                                                                    },@"links":@{@"self":@"http://localhost:3000/accounts/2593177"},
                                                    @"relationships": @{
                                                            @"services": @{
                                                                    @"links": @{
                                                                            @"related": @"http://localhost:3000/services/0468874507"}
                                                                    }
                                                            }
                                                    },
                                          @"included":@[
  @{@"type": @"services",
    @"id": @"0468874507",
    @"attributes": @{
            @"msn": @"0468874507",
            @"credit":@"1200",
            @"credit-expiry": @"2016-11-20",
            @"data-usage-threshold": @"false"},
    @"links":@{
            @"self": @"http://localhost:3000/services/0468874507"},
    @"relationships": @{
                             @"subscriptions": @{
                                 @"links": @{
                                     @"related":@"http://localhost:3000/services/0468874507/subscriptions"
                                 },
                                 @"data": @[
                                          @{
                                              @"type": @"subscriptions",
                                              @"id": @"0468874507-0"
                                          }
                                          ]
                             }
                         }
                     },
                     @{
                         @"type": @"subscriptions",
                         @"id": @"0468874507-0",
                         @"attributes": @{
                             @"included-data-balance":@"52400",
                             @"included-credit-balance": @"",
                             @"included-rollover-credit-balance": @"",
                             @"included-rollover-data-balance": @"",
                             @"included-international-talk-balance": @"",
                             @"expiry-date": @"2016-11-19",
                             @"auto-renewal": @"true",
                             @"primary-subscription": @"true"
                         },
                         @"links": @{
                             @"self": @"http://localhost:3000/services/0468874507/subscriptions/0468874507-0"
                         },
                         @"relationships": @{
                             @"service": @{
                                 @"links": @{
                                     @"related": @"http://localhost:3000/services/0468874507"
                                 }
                             },
                             @"product": @{
                                 @"data": @{
                                     @"type": @"products",
                                     @"id": @"0"
                                 }
                             },
                             @"downgrade": @{
                                 @"data": @""
                             }
                         }
                     },
                     @{
                         @"type": @"products",
                         @"id": @"4000",
                         @"attributes": @{
                             @"name": @"UNLIMITED 7GB",
                             @"included-data": @"",
                             @"included-credit": @"",
                             @"included-international-talk": @"",
                             @"unlimited-text": @"true",
                             @"unlimited-talk": @"true",
                             @"unlimited-international-text": @"false",
                             @"unlimited-international-talk": @"false",
                             @"price": @"3990"
                         }
                     }
                     ]
                                          };
    
    
    NSLog(@"%@",collectionJsonDict);
    
    NSDictionary * UserDetails = [collectionJsonDict valueForKey:@"data"];
    getUserDetails = [UserDetails valueForKey:@"attributes"];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonAction:(id)sender {
    
    if (_firstNameTF.text.length>0&&[_firstNameTF.text isEqualToString:[getUserDetails valueForKey:@"first-name"]]) {
        
        if (_lastNameTF.text.length>0&&[_lastNameTF.text isEqualToString:[getUserDetails valueForKey:@"last-name"]]) {
            
            
            if (_emailTf.text.length>0&&[_emailTf.text isEqualToString:[getUserDetails valueForKey:@"email-address"]]) {
                
                if (_phoneNumberTF.text.length>0&&[_phoneNumberTF.text isEqualToString:[getUserDetails valueForKey:@"contact-number"]]) {
                    
                    SplashViewController * splashViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SplashViewController"];                    [self.navigationController pushViewController:splashViewController animated:YES];

                    
                }else
                {
                    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"MIVI" message:@"Please enter valid Number" preferredStyle:UIAlertControllerStyleAlert];
                    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }]];
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [alertController dismissViewControllerAnimated:YES completion:^{
                            // do something ?
                        }];
                        
                    });
                }
                
            }else
            {
                UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"MIVI" message:@"Please enter valid email" preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }]];
                [self presentViewController:alertController animated:YES completion:nil];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [alertController dismissViewControllerAnimated:YES completion:^{
                        // do something ?
                    }];
                    
                });
            }

            
            
        }else
        {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"MIVI" message:@"Please enter valid Last name" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [alertController dismissViewControllerAnimated:YES completion:^{
                    // do something ?
                }];
                
            });
        }

        
        
    }else
    {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"MIVI" message:@"Please enter valid first name" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [alertController dismissViewControllerAnimated:YES completion:^{
                // do something ?
            }];
            
        });
    }
    
}
@end

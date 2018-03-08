//
//  ProfileViewController.m
//  MIVI
//
//  Created by Bhavan on 08/03/18.
//  Copyright © 2018 MIVI. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    NSDictionary * getUserDetails = [UserDetails valueForKey:@"attributes"];
    
    _firstNameTF.text = [NSString stringWithFormat:@"First Name : %@",[getUserDetails valueForKey:@"first-name"]];
    _lastNameTF.text = [NSString stringWithFormat:@"Last Name : %@",[getUserDetails valueForKey:@"last-name"]];
    _emailTF.text = [NSString stringWithFormat:@"Email : %@",[getUserDetails valueForKey:@"email-address"]];
    _mobileTF.text = [NSString stringWithFormat:@"Number : %@",[getUserDetails valueForKey:@"contact-number"]];
    _DateTF.text = [NSString stringWithFormat:@"DOB : %@",[getUserDetails valueForKey:@"date-of-birth"]];
    
    
    NSArray * planeDetails = [collectionJsonDict valueForKey:@"included"];
    NSDictionary * productsDict = [[planeDetails objectAtIndex:2]valueForKey:@"attributes"];
    
    _proguctNameTF.text = [NSString stringWithFormat:@"Product Name : %@",[productsDict valueForKey:@"name"]];
    _productPriceTF.text = [NSString stringWithFormat:@"Product price : %@",[productsDict valueForKey:@"price"]];


    NSDictionary * subscriptionsDict = [[planeDetails objectAtIndex:1]valueForKey:@"attributes"];
    _usedDataTF.text = [NSString stringWithFormat:@"Data balance : %@",[subscriptionsDict valueForKey:@"included-data-balance"]];
    _dataExpireDateTF.text = [NSString stringWithFormat:@"Data expiry date : %@",[subscriptionsDict valueForKey:@"expiry-date"]];
    
    
    NSDictionary * servicesDict = [[planeDetails objectAtIndex:0]valueForKey:@"attributes"];
    _creditsPriceTF.text = [NSString stringWithFormat:@"Credit : %@",[servicesDict valueForKey:@"credit"]];
    _creditsExpireDate.text = [NSString stringWithFormat:@"Credit expiry date : %@",[servicesDict valueForKey:@"credit-expiry"]];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

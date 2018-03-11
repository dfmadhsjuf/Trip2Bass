//
//  LoginViewController.h
//  Trip2Bass
//
//  Created by Alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UILabel *lRecordarUsuario;
@property (weak, nonatomic) IBOutlet UISwitch *swRecordarUsuario;


//BOTONES
@property (weak, nonatomic) IBOutlet UIButton *bSignIn;
@property (weak, nonatomic) IBOutlet UIButton *bSignUp;
//@property (weak, nonatomic) IBOutlet UIButton *bLogin;


@end

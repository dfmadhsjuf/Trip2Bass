//
//  LoginViewController.m
//  Trip2Bass
//
//  Created by Alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //diseño boton Sign IN
    [self.bSignIn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.bSignIn.layer setBorderWidth:2.5];
    [self.bSignIn.layer setCornerRadius:15];
    
    //diseño boton Sign UP
    [self.bSignUp.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.bSignUp.layer setBorderWidth:2.5];
    [self.bSignUp.layer setCornerRadius:15];
    
    //diseño boton LOG IN
    [self.bSignUp.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.bSignUp.layer setBorderWidth:2.5];
    [self.bSignUp.layer setCornerRadius:15];
    
    
    //esconder teclado en username
    [self.tfUsername becomeFirstResponder];
    [self.tfUsername resignFirstResponder] ;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)SignIn:(id)sender {
    [self.bSignIn setHidden:YES];
    [self.bSignUp setHidden:YES];
    [self.tfUsername setHidden:NO];
    [self.tfPassword setHidden:NO];
    [self.lRecordarUsuario setHidden:NO];
    [self.swRecordarUsuario setHidden:NO];
    [self.bLogin setHidden:NO];
    
    [self.tfUsername setUserInteractionEnabled:YES];
    [self.tfPassword setUserInteractionEnabled:YES];
    [self.swRecordarUsuario setUserInteractionEnabled:YES];
    [self.bLogin setUserInteractionEnabled:YES];
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

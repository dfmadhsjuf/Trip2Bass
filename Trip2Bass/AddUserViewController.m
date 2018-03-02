//
//  AddUserViewController.m
//  Trip2Bass
//
//  Created by alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "AddUserViewController.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //hacer foto redonda
    self.fotoPerfil.layer.cornerRadius = self.fotoPerfil.frame.size.width /2;
    
    //mostrar teclado
    [self.tfNombre resignFirstResponder];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)esconderTeclado:(id)sender {
    [self.tfNombre becomeFirstResponder];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(UIStoryboard*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createUser:(UIStoryboard*)sender {
    //code for create user
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
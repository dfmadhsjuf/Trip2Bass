//
//  ModUserViewController.m
//  Trip2Bass
//
//  Created by alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "ModUserViewController.h"

@interface ModUserViewController ()

@end

@implementation ModUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //hacer foto redonda
    self.fotoPerfil.layer.cornerRadius = self.fotoPerfil.frame.size.width /2;
    self.fotoPerfil.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)edit:(id)sender {
    UIColor* colorEdit = [UIColor colorWithRed:86.0f/255.0f
                                         green:99.0f/255.0f
                                          blue:111.0f/255.0f
                                         alpha:1.0f];
    
    [self.tfUsuario setUserInteractionEnabled:YES];
    [self.tfUsuario setBackgroundColor:colorEdit];
    [self.tfNombre setUserInteractionEnabled:YES];
    [self.tfNombre setBackgroundColor:colorEdit];
    [self.tfApellidos setUserInteractionEnabled:YES];
    [self.tfApellidos setBackgroundColor:colorEdit];
    [self.tfCiudad setUserInteractionEnabled:YES];
    [self.tfEmail setUserInteractionEnabled:YES];
    [self.tfTelefono setUserInteractionEnabled:YES];
    [self.tfMarca setUserInteractionEnabled:YES];
    [self.tfModelo setUserInteractionEnabled:YES];
    [self.tfColor setUserInteractionEnabled:YES];
    [self.tfPlazas setUserInteractionEnabled:YES];
    [self.bEdit setTitle:@"Hecho"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)volverLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

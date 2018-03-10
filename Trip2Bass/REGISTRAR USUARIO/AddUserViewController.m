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
    //cambiar altura textfields
    [self redondeaBordes];
    
    
    //hacer scroll y foto redonda
    self.fotoPerfil.layer.cornerRadius = self.fotoPerfil.frame.size.width /2;
    self.fotoPerfil.clipsToBounds = YES;
    self.scroll.layer.cornerRadius = 10;
    
    //mostrar teclado
    [self.tfNombre resignFirstResponder];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)redondeaBordes{
    NSArray* textfields = [NSArray arrayWithObjects:self.tfNombre, self.tfApellidos, self.tfCiudad, self.tfTelefono, self.tfEmail, self.tfFecha, self.tfUsuario, self.tfPass, self.tfConfirmarPass, self.tfMarca, self.tfModelo, self.tfCcolor, self.tfPlazas, nil];
    for (int i = 0; i < [textfields count]; i++) {
        [[[textfields objectAtIndex:i] layer] setCornerRadius:5];
        [[textfields objectAtIndex:i] setClipsToBounds:YES] ;
    }
}

-(IBAction) switchValueChanged{
    NSArray* datosCoche = [NSArray arrayWithObjects:self.tfMarca, self.tfModelo, self.tfCcolor, self.tfPlazas, nil];
    if ([self.swCoche isOn]) {
        for (int i = 0; i < [datosCoche count]; i++) {
            [[datosCoche objectAtIndex:i] setEnabled:YES];
            [[datosCoche objectAtIndex:i] setHidden:NO];
        }
    }else{
        for (int i = 0; i < [datosCoche count]; i++) {
            [[datosCoche objectAtIndex:i] setEnabled:NO];
            [[datosCoche objectAtIndex:i] setHidden:YES];
        }
    }
}

-(IBAction)pickImage:(id)sender{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo{
    
    self.fotoPerfil.image = image;
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss completed");;
    }];
 }



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//cancelar creacion de usuario
- (IBAction)cancel:(UIStoryboard*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//crear usuario
- (IBAction)createUser:(UIStoryboard*)sender {
    //code for create user
    [self dismissViewControllerAnimated:YES completion:nil];
}
     
     

@end

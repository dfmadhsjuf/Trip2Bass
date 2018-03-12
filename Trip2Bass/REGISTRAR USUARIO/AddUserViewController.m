//
//  AddUserViewController.m
//  Trip2Bass
//
//  Created by alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "AddUserViewController.h"
#import "DBManager.h"

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
    
    //texto tipo contraseña
    self.tfConfirmarPass.secureTextEntry = YES;
    self.tfPass.secureTextEntry = YES;

  
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
    
    //Inicializamos la BD.
    DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    
    //Recogemos los datos de la vista.
    NSString* nombre = self.tfNombre.text;
    NSString* apellidos = self.tfApellidos.text;
    NSString* nickname = self.tfUsuario.text;
    NSString* password = self.tfPass.text;
    NSString* email = self.tfEmail.text;
    NSString* provincia = self.tfCiudad.text;
    NSString* fechaNacimiento = self.tfFecha.text;
    
    //Los metemos dentro de un Array para poder meterlos en la BD.
    NSArray* datosUsuario = [[NSArray alloc] initWithObjects:nombre, apellidos, nickname, password, email, provincia, fechaNacimiento, nil];
    
    //Metemos el usuario en la BD y recogemos su ID.
    int codUsuario = [db insertaUsuario:datosUsuario];
    
    //Comprobamos si el usuario se ha introducido correctamente.
    if(codUsuario == -1){
        //ALERTA DE FALLO AL INSERTAR USUARIO.
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Ya existe un usuario con ese nickname" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        //Comprobamos si el switch del coche esta activado.
        if([self.swCoche isOn]){
            //Recogemos de la vista los datos del coche.
            NSNumber* codigoUsuario = [NSNumber numberWithInt:codUsuario];
            NSString* marca = self.tfMarca.text;
            NSString* modelo = self.tfModelo.text;
            NSString* plazas = self.tfPlazas.text;
            NSString* color = self.tfCcolor.text;
            
            //Metemos los datos del coche dentro de un Array para meterlos dentro de la BD.
            NSArray* datosCoche = [[NSArray alloc] initWithObjects:codigoUsuario, marca, modelo, plazas, color, nil];
            
            //Insertamos el coche en la BD y comprobamos si se ha introducido correctamente.
            if([db insertaCoche:datosCoche]){
                //Cerramos la vista.
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                //ALERTA DE FALLO AL INSERTAR COCHE.
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"El usuario ya tiene un coche asociado" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
                
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }else{
            //Cerramos la vista.
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
        
    }

    
}
     
     

@end

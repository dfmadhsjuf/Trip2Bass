//
//  LoginViewController.m
//  Trip2Bass
//
//  Created by Alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "LoginViewController.h"
#import "EventosCollectionVC.h"
#import "ModUserViewController.h"
#import "DBManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //diseño boton Sign IN
    //[self.bSignIn.layer setBorderColor:[[UIColor blackColor] CGColor]];
    //[self.bSignIn.layer setBorderWidth:1.5];
    [self.bSignIn.layer setCornerRadius:15];
    
    //diseño boton Sign UP
    [self.bSignUp.layer setCornerRadius:15];
    
    //esconder teclado en username
    [self.tfUsername becomeFirstResponder];
    [self.tfUsername resignFirstResponder] ;
    
    //texto tipo password
    self.tfPassword.secureTextEntry = YES;

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    //Inicializamos la BD.
    DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    //Recogemos el usuario y la contraseña de los TextField.
    NSString* usuario = self.tfUsername.text;
    NSString* password = self.tfPassword.text;
    
    //Comprobamos si el usuario existe en la BD.
    if([db validarUsuario:usuario conPassword:password]){
        //Si existe mandamos el prepareForSegue y mostramos la siguiente vista.
        [self performSegueWithIdentifier:@"loguea" sender:sender];
        return YES;
    }else{
        
        //ALERTA DE USUARIO NO ENCONTRADO
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Usuario o contraseña incorrectos" message:@"Si no tienes una cuenta createla apretando el boton de Sign Up" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([[segue identifier] isEqualToString:@"loguea"]) {
        
        UITabBarController *tabBarController = segue.destinationViewController;
        //Le pasamos el nickanme a la lista de eventos.
        UINavigationController *navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:0];
        EventosCollectionVC *controller = (EventosCollectionVC *)[[navigationController viewControllers] objectAtIndex:0];
        controller.username = self.tfUsername.text;
        
        //Le pasamos el nickanme a la informacion del usuario.
        UINavigationController* navigationUser = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:2];
        ModUserViewController* infoUsuario = (ModUserViewController*)[[navigationUser viewControllers] objectAtIndex:0];
        infoUsuario.nicknameUsuario = self.tfUsername.text;
        
    }
}

@end

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
    self.bEnviarSolicitud.layer.cornerRadius = 10;
    self.fotoPerfil.clipsToBounds = YES;
    //scroll esquinas redondas
    self.scroll.layer.cornerRadius = 10;
    self.scroll.clipsToBounds = YES;
    //redondea textfields
    [self estiloInicial];
    //datepicker
    UIDatePicker* datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.tfFechaNac setInputView: datePicker];
    
    //pickerview
    
    
    //[self.tfFechaNac resignFirstResponder];
    
    // Do any additional setup after loading the view.
}

-(void)estiloInicial{
    //text fields redondeados
    NSArray* textfields = [NSArray arrayWithObjects:self.tfNombre, self.tfApellidos, self.tfCiudad, self.tfTelefono, self.tfEmail, self.tfFechaNac, self.tfUsuario, self.tfPass, self.tfConfirmarPass, self.tfMarca, self.tfModelo, self.tfColor, self.tfPlazas, nil];
    for (int i = 0; i < [textfields count]; i++) {
        [[[textfields objectAtIndex:i] layer] setCornerRadius:5];
        [[textfields objectAtIndex:i] setClipsToBounds:YES] ;
        [[textfields objectAtIndex:i] setBackgroundColor:[UIColor colorWithRed:87/255.0 green:89/255.0 blue:93/255.0 alpha:1]];
    }
    
}

-(void) datePickerValueChanged:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.tfFechaNac.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.tfFechaNac.text = [NSString stringWithFormat:@"%@",dateString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)edit:(id)sender {
    
    NSArray* losText = [NSArray arrayWithObjects:self.tfNombre, self.tfApellidos, self.tfCiudad, self.tfTelefono, self.tfEmail, self.tfFechaNac, self.tfUsuario, self.tfPass, self.tfConfirmarPass, self.tfMarca, self.tfModelo, self.tfColor, self.tfPlazas, nil];
    //si el en el boton pone hecho....
    if (([self.bEdit.title  isEqual: @"Save"])) {
        //para cada elemento del array textfields ...
        for (int i=0; i <[losText count]; i++) {
            //quitamos la interaccion del usuario
            [losText[i] setUserInteractionEnabled:NO];
            //cambiamos el estilo de los textfields
            [self estiloInicial];
        }
        [self.swCoche setUserInteractionEnabled:NO];
        [self.bSeleccionarImagen setUserInteractionEnabled:NO];
        //cambiamos el boton a edit
        [self.bEdit setTitle:@"Edit"];
    }else {
        //cambiamos el titulo a Save
        [self.bEdit setTitle:@"Save"];
        //activamos boton cambiar foto usuario
        [self.bSeleccionarImagen setUserInteractionEnabled:YES];
        //activamos switch coche
        [self.swCoche setUserInteractionEnabled:NO];
        //permitimos la edicion y cambiamos el estilo a los textfield y el segmented control
        [self.swCoche setUserInteractionEnabled:YES];
        for (int i = 0; i < [losText count] ; i++) {
            [losText[i] setUserInteractionEnabled:YES];
            [[losText objectAtIndex:i] setBackgroundColor:[UIColor whiteColor]];
        }
        
    }
    
}


-(IBAction) switchValueChanged{
    NSArray* datosCoche = [NSArray arrayWithObjects:self.tfMarca, self.tfModelo, self.tfColor, self.tfPlazas, nil];
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


- (IBAction)volverLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)solicitarOrganizador:(id)sender {
    //deshabilitamos scroll y boton
    [self.scroll setUserInteractionEnabled:NO];
    [self.bEdit setEnabled:NO];
    //popup
    [self.popup.layer setCornerRadius:5];
    [self.view addSubview:self.popup];
    [self.popup setCenter:self.view.center];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        // animate it to the identity transform (100% scale)
        self.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // if you want to do something once the animation finishes, put it here
    }];
}

//ENVIAR SOLICITUD ORGANIZADOR
- (IBAction)enviar:(id)sender {
    //codigo enviar correo
    
    //deshabilitamos scroll y boton
    [self.scroll setUserInteractionEnabled:YES];
    [self.bEdit setEnabled:YES];
    
    //cerramos popup
    [self.popup removeFromSuperview];
    
}

//SELECIONAR IMAGEN DE GALERIA
- (IBAction) pickImage:(id)sender{
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

@end

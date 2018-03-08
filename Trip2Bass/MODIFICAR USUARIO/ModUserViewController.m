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
    
    self.scrollDatos.layer.cornerRadius = 10;
    self.scrollDatos.clipsToBounds = YES;
    //datepicker
    UIDatePicker* datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.tfFechaNac setInputView: datePicker];
    
    //creamos array con todos los text fields
    
    
    
    //[self.tfFechaNac resignFirstResponder];
    
    // Do any additional setup after loading the view.
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
    NSMutableArray* textFields = [[NSMutableArray alloc]initWithObjects:self.tfUsuario, self.tfNombre, self.tfApellidos, self.tfFechaNac,
                                  self.tfCiudad, self.tfEmail, self.tfTelefono, self.tfMarca, self.tfModelo, self.tfColor, self.tfPlazas, nil];
    //si el en el boton pone hecho....
    if (([self.bEdit.title  isEqual: @"Save"])) {
        //para cada elemento del array textfields ...
        for (int i=0; i <[textFields count]; i++) {
            //quitamos la interaccion del usuario
            [textFields[i] setUserInteractionEnabled:NO];
            //cambiamos el estilo del boton a ninguno
            [textFields[i] setBorderStyle:UITextBorderStyleNone];
        }
        [self.scCoche setUserInteractionEnabled:NO];
        [self.bSeleccionarImagen setUserInteractionEnabled:YES];
        //cambiamos el boton a edit
        [self.bEdit setTitle:@"Edit"];
    }else {
        //cambiamos el titulo a Save
        [self.bEdit setTitle:@"Save"];
        //permitimos la edicion y cambiamos el estilo a los textfield y el segmented control
        [self.scCoche setUserInteractionEnabled:YES];
        for (int i = 0; i < [textFields count] ; i++) {
            [textFields[i] setUserInteractionEnabled:YES];
            [textFields[i] setBorderStyle:UITextBorderStyleRoundedRect];
        }
        
    }
    
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

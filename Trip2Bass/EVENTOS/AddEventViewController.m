//
//  AddEventViewController.m
//  Trip2Bass
//
//  Created by alumno on 2/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "AddEventViewController.h"
#import "DBManager.h"
#import "Eventos.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self eligeImagenEvento];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)eligeImagenEvento{
    if ([self.ScTipoEvento selectedSegmentIndex] == 0) {
        [self.iFotoEvento setImage:[UIImage imageNamed:@"fondo_evento2"]];
    }else {
        [self.iFotoEvento setImage:[UIImage imageNamed:@"fondo_evento1"]];
    }
}

-(IBAction) SCValueChanged{
    [self eligeImagenEvento];
    if ([self.ScTipoEvento selectedSegmentIndex] == 0) {
        [self.tfContenidoEvento setText:@"ACTIVIDAES"];
    }else {
        [self.tfContenidoEvento setText:@"MÚSICA"];
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

//ACCION BOTON ENVIAR
- (IBAction)invitar:(id)sender {
    //popup
    [self.popup.layer setCornerRadius:5];
    [self.view addSubview:self.popup];
    [self.popup setCenter:self.view.center];
}

//ACCION BOTON ENVIAR POPUP
- (IBAction)enviarInvitaciones:(id)sender {
    
    //habilitamos scroll y boton
    [self.scroll setUserInteractionEnabled:YES];
    [self.bCreate setEnabled:YES];
    [self.bCancel setEnabled:YES];
    //eliminamos el popup
    [self.popup removeFromSuperview];
}
- (IBAction)seleccionarUsuario:(id)sender {
    
}

- (IBAction)cancel:(UIStoryboard*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)crearEvento:(UIStoryboard*)sender {
    //Inicialiamos la BD.
    DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    
    //Recogemos los datos de la vista.
    NSString* titulo = self.tfTituloEvento.text;
    NSString* area = self.tfAreaEvento.text;
    NSString* fechaInicio = self.tfFechaInicioEvento.text;
    NSString* fechaFin = self.tfFechaFinEvento.text;
    NSString* tipo;
    NSString* descripcion;
    NSString* musica;
    NSString* foto;
    if([self.ScTipoEvento selectedSegmentIndex] == 0){
        tipo = @"Quedada";
        descripcion = self.tfContenidoEvento.text;
        musica = @" ";
        foto = @"fondo_evento2";
    }else{
        tipo = @"Fiesta";
        descripcion = @" ";
        musica = self.tfContenidoEvento.text;
        foto = @"fondo_evento1";
    }
    NSString* parkingTamaño = self.tfParking.text;
    NSString* parkingAccesibilidad = self.tfAcceso.text;
    NSString* parkingTerreno = self.tfTerreno.text;
    
    /***********LA UBICACION FALTA POR IMPLEMENTAR*************/
    NSString* ubicacion = @"35.496060,-0.686623";
    /**********************************************************/
    
    NSString* indicaciones = self.tfIndicaciones.text;

    //Nos creamos un evento con los datos de la vista.
    Eventos* evento = [[Eventos alloc] initWhitTitulo:titulo conArea:area conFechaInicio:fechaInicio conFechaFin:fechaFin conTipo:tipo conDescripcion:descripcion conMusica:musica conParkingTamano:parkingTamaño conParkingAccesibilidad:parkingAccesibilidad conParkingTerreno:parkingTerreno conUbicacion:ubicacion conIndicaciones:indicaciones yFoto:foto];
    
    //Llamamos al metodo para meter el Evento en la BD.
    [db insertaEvento:evento];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

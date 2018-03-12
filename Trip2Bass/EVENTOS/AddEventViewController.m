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
    [self setEstilo];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setEstilo{
    //TEXT FIELDS
    NSMutableArray* textfields = [[NSMutableArray alloc]initWithObjects:self.tfTituloEvento, self.tfFechaInicioEvento, self.tfFechaFinEvento, self.tfAreaEvento, self.tfOrganizador, self.tfContenidoEvento, self.tfAcceso, self.tfParking, self.tfTerreno, self.tfIndicaciones, nil];
    for (int i = 0; i < [textfields count]; i++) {
        UITextField* tf = textfields[i];
        tf.layer.cornerRadius = 3;
        tf.clipsToBounds = YES;
        tf.backgroundColor = [UIColor whiteColor];
    }
    //LABELS
    NSArray* labels = [[NSArray alloc]initWithObjects:self.labelParking, self.labelTerreno, self.labelUbicacion, self.labelIndicaciones,self.labelAcceso, self.labelCotenido, nil];
    for (int i = 0; i < [labels count]; i++) {
        UILabel* l = labels[i];
        l.layer.cornerRadius = 3;
        l.clipsToBounds = YES;
    }
    
    //TEXTAREAS
    [self.tfContenidoEvento setClipsToBounds:YES];
    [self.tfContenidoEvento.layer setCornerRadius:5];
    [self.tfIndicaciones setClipsToBounds:YES];
    [self.tfIndicaciones.layer setCornerRadius:5];
    
    //SC
    self.ScTipoEvento.layer.cornerRadius = 5;
    self.ScTipoEvento.clipsToBounds = YES;
    
    //BUTTON
    self.bInvitar.layer.cornerRadius = 5;
    self.bInvitar.clipsToBounds = YES;
    
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
        [self.labelCotenido setText:@"ACTIVIDADES"];
    }else {
        [self.labelCotenido setText:@"MÚSICA"];
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

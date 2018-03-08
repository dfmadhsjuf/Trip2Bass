//
//  InformacionDataController.m
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "InformacionDataController.h"
#import "Informacion.h"

@interface InformacionDataController()
-(void) initializeDefaultDataList;
@end

@implementation InformacionDataController


- (id)init {
    
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
}


-(void) initializeDefaultDataList{
    //Inicializamos nuestra lista de informacion.
    _masterInformacionList =  [[NSMutableArray alloc] init];
    
    //Cargamos la info inicial.
    Informacion* info = [[Informacion alloc]initWithTitulo:@"CULTURA RAVE" conContenido:@"Podemos definir la Cultura Rave como la mezcla de ideas surgidas del amor y de la conciencia, el cuidado de nuestro planeta y la adoración por al música electrónica y sus derivaciones subgéneros y mutaciones, en un medio donde la gente es feliz y se respeta..." conFecha:@"01/01/2018" yConAutor:@"Clau"];
    [self addInformacion:info];
    
    Informacion* info2 = [[Informacion alloc]initWithTitulo:@"PRIMERAS FREE PARTIES" conContenido:@"Es en las playas de Goa ( Estado de la India ) es donde a principios de los años 70 se realizan las primeras free parties, donde se congregaban los hippies provenientes de todas las partes del planeta.En estas primeras fiestas la musica que se escuchaba iba desde Pink Floid hasta Jannis Joplin. Estos eventos se sucedian por todas las playas de Goa, siendo Anjuna uno de los lugares predilectos. A mediados de los años 80,las free parties de la India ya eran conocidas a nivel mundial." conFecha:@"20/01/2018" yConAutor:@"Joni"];
    [self addInformacion:info2];
    
    Informacion* info3 = [[Informacion alloc]initWithTitulo:@"LA EVOLUCION DEL PSYTRANCE" conContenido:@"Lo que en la actualidad conocemos como Psychedelic Trance desciende directamente del Goa y ha desarrollado un sonido único y complejo con propiedades especificas. El Psy-trance tiene una base rítmica poderosa a la que se agregan elementos acústicos o electrónicos, a veces generados en vivo; además de sonidos sintetizados de instrumentos milenarios como cítaras, gongs, tambores y didgereedos." conFecha:@"02/02/2018" yConAutor:@"noetsai"];
    [self addInformacion:info3];
}

- (void)setMasterMemeList:(NSMutableArray *)newList {
    if (self.masterInformacionList != newList) {
        self.masterInformacionList = [newList mutableCopy];
    }
}

-(NSUInteger) countOfList{
    return [self.masterInformacionList count];
}

-(Informacion*) objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterInformacionList objectAtIndex:theIndex];
}

-(void) addInformacion:(Informacion*) informacion{
    [self.masterInformacionList addObject: informacion];
}
    
@end

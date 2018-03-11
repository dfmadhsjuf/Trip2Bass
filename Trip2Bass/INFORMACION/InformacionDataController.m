//
//  InformacionDataController.m
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "InformacionDataController.h"
#import "Informacion.h"
#import "DBManager.h"

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
    //Inicialiamos la BD.
    DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    //Cargamos la info en la lista de informacion.
    self.masterInformacionList = [db getInfo];
    
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

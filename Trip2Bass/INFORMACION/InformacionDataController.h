//
//  InformacionDataController.h
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Informacion;

@interface InformacionDataController : NSObject

@property (nonatomic, copy) NSMutableArray* masterInformacionList;

-(NSUInteger) countOfList;
-(Informacion*) objectInListAtIndex:(NSUInteger)theIndex;
-(void) addInformacion:(Informacion*) informacion;

@end

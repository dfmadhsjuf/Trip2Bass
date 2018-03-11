//
//  ComentariosCollectionVC.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ComentariosDataController;
@class Comentario;

@interface ComentariosCollectionVC : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) ComentariosDataController* dataController;

-(void)addNuevoComentario:(Comentario*)nuevo;
-(void)refreshData;

@end

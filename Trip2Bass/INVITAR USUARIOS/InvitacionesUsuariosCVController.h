//
//  InvitacionesUsuariosCVController.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InvitarUsuariosDataController;

@interface InvitacionesUsuariosCVController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) InvitarUsuariosDataController* dataController;

@end

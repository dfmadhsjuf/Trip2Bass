//
//  EventosCollectionVC.h
//  Trip2Bass
//
//  Created by alumno on 21/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EventosDataController;

@interface EventosCollectionVC : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) EventosDataController* dataController;

@end

//
//  MapsViewController.h
//  Trip2Bass
//
//  Created by Alumno on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapsViewController : UIViewController <GMSMapViewDelegate, UIGestureRecognizerDelegate>

-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end

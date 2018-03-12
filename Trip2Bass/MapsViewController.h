//
//  MapsViewController.h
//  Trip2Bass
//
//  Created by Alumno on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;
@import GooglePlaces;

@interface MapsViewController : UIViewController <GMSMapViewDelegate, UIGestureRecognizerDelegate>
@property NSString* coordenadasString;

-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end

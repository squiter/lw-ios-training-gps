//
//  ViewController.m
//  core location
//
//  Created by Treinamento Mobile on 10/24/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet UILabel *longt;
@property (nonatomic, weak) IBOutlet UILabel *latt;
@property (nonatomic, weak) IBOutlet UILabel *speed;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager requestWhenInUseAuthorization];
    // ou
    //[self.locationManager requestAlwaysAuthorization];
    
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    
    self.latt.text = [NSString stringWithFormat:@"%.8f", location.coordinate.latitude];
    self.longt.text = [NSString stringWithFormat:@"%.8f", location.coordinate.longitude];
    self.speed.text = [NSString stringWithFormat:@"%.8f", location.speed];
}

@end

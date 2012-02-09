//
//  ViewController.m
//  YetAnotherFlashlight
//
//  Created by David Kapp on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize onOffSwitch;
@synthesize brightnessSlider;
@synthesize lightSource;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  self.brightnessSlider.value = [defaults floatForKey:kBrightnessLevel];
  self.onOffSwitch.on = [defaults boolForKey:kOnOffToggle];
  [self setLightSourceAlphaValue:self];
}

- (void)viewDidUnload
{
    [self setOnOffSwitch:nil];
    [self setBrightnessSlider:nil];
    [self setLightSource:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)setLightSourceAlphaValue:(id)sender {
  [self updateUserSettings];
  
  if (self.onOffSwitch.on) {
    self.lightSource.alpha = self.brightnessSlider.value;
  } else {
    self.lightSource.alpha = 0.0;
  }
}

- (void)updateUserSettings {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setBool:self.onOffSwitch.on forKey:kOnOffToggle];
  [userDefaults setFloat:self.brightnessSlider.value forKey:kBrightnessLevel];
  [userDefaults synchronize];
}
@end

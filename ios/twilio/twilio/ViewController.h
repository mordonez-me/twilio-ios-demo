//
//  ViewController.h
//  twilio
//
//  Created by Marco Ordonez on 9/19/15.
//  Copyright © 2015 Marco Ordonez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *textField;

- (IBAction)call:(id)sender;
- (IBAction)hangup:(id)sender;

@end


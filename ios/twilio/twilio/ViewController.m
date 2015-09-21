//
//  ViewController.m
//  twilio
//
//  Created by Marco Ordonez on 9/19/15.
//  Copyright © 2015 Marco Ordonez. All rights reserved.
//

#import "ViewController.h"
#import "TwilioClient.h"

@interface ViewController ()<TCDeviceDelegate>
{
    TCDevice* _phone;
    TCConnection* _connection;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *client = @"test";
    NSString *urlString = [NSString stringWithFormat:@"https://30d319b4.ngrok.io/token?client=%@", client];
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (token == nil) {
        NSLog(@"Error retrieving token: %@", [error localizedDescription]);
    } else {
        _phone = [[TCDevice alloc] initWithCapabilityToken:token delegate:self];
    }
}

- (void)device:(TCDevice *)device didReceiveIncomingConnection:(TCConnection *)connection
{
    NSLog(@"Incoming connection from: %@", [connection parameters][@"From"]);
    if (device.state == TCDeviceStateBusy) {
        NSLog(@"Device busy");
        [connection reject];
    } else {
        //Here you have to add the ring sound and separate the code to accept in another method
        NSLog(@"Device avialable");
        [connection accept];
    }
}

- (void)deviceDidStartListeningForIncomingConnections:(TCDevice*)device
{
    NSLog(@"Device: %@ deviceDidStartListeningForIncomingConnections", device);
}

- (void)device:(TCDevice*)device didStopListeningForIncomingConnections:(NSError*)error
{
    NSLog(@"Device: %@ didStopListeningForIncomingConnections: %@", device, error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}
- (IBAction)call:(id)sender {
    NSLog(@"call");
    NSDictionary *params = @{@"To": self.textField.text};
    _connection = [_phone connect:params delegate:nil];
}
- (IBAction)hangup:(id)sender {
    NSLog(@"hangup");
    [_connection disconnect];
}

@end

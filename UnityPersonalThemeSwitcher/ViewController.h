//
//  ViewController.h
//  UnityPersonalThemeSwitcher
//
//  Created by Sergey A. Bazylev on 20/09/2018.
//  Copyright © 2018 Sergey A. Bazylev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

- (void) processDetectCurrentUnityTheme: (NSString *)path;
- (void) processPathUnityFile: (NSString *)path;

@property (weak) IBOutlet NSTextField *modeLabel;
@property (weak) IBOutlet NSProgressIndicator *processSpinner;
@property (weak) IBOutlet NSButton *buttonSwitchTheme;
@property (weak) IBOutlet NSTextField *unity3dPathLabel;

@end


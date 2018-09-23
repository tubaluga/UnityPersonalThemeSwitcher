//
//  ViewController.m
//  UnityPersonalThemeSwitcher
//
//  Created by Sergey A. Bazylev on 20/09/2018.
//  Copyright © 2018 Sergey A. Bazylev. All rights reserved.
//

#import "UnityThemeController.h"
#import "ViewController.h"

@implementation ViewController

UnityThemeController *unityThemeController = nil;

- (void)viewDidLoad {
	[super viewDidLoad];

	unityThemeController = [[UnityThemeController alloc] init];
}


- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

- (IBAction)onButtonClick:(id)sender {
	
	[unityThemeController open:@"/Applications/Unity/Unity.app/Contents/MacOS/Unity"];
	
	NSString *modeText = nil;
	
	switch (unityThemeController.unityUiMode) {
		case StandardMode:
			modeText = @"Standard mode";
			break;
			
		case DarkMode:
			modeText = @"Dark mode";
			break;
			
		default: modeText = @"Undefined mode";
			break;
	}
	
	_modeLabel.stringValue = modeText;
}
- (IBAction)onSwitchThemeClick:(id)sender {
	
	[unityThemeController switchUiMode];
}

@end

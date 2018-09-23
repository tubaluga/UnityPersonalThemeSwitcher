//
//  UnityApplication.m
//  UnityPersonalThemeSwitcher
//
//  Created by Sergey A. Bazylev on 20/09/2018.
//  Copyright © 2018 Sergey A. Bazylev. All rights reserved.
//

#import "UnityThemeController.h"

static unsigned char standardThemePattern[] = {
	0x55, 0x48, 0x89, 0xE5, 0xE8, 0x77, 0x80, 0xFF,
	0xFF, 0x8B, 0x80, 0xE8, 0x00, 0x00, 0x00, 0x83,
	0xE0, 0x01, 0x5D, 0xC3, 0x66, 0x66, 0x66, 0x2E,
	0x0F, 0x1F, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00
};

static unsigned char darkThemePattern[] = {
	0x55, 0x48, 0x89, 0xE5, 0xE8, 0x77, 0x80, 0xFF,
	0xFF, 0x8B, 0x80, 0xE8, 0x00, 0x00,	0x00, 0x83,
	0xE0, 0x01, 0x5D, 0xB8, 0x01, 0x00, 0x00, 0x00,
	0xC3, 0x1F, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00
};


@implementation UnityThemeController

NSRange markerLoacation;
NSData *patternStandardMode = nil;
NSData *patternDarkMode = nil;
NSData *contentData = nil;
NSString *unityFilePath = nil;

- (UnityThemeController *)init {
	if (self == [super init]) {
		patternStandardMode = [NSData dataWithBytes:standardThemePattern length: 32];
		patternDarkMode = [NSData dataWithBytes:darkThemePattern length: 32];
	}
	return self;
}

- (BOOL)open:(nonnull NSString *)path {
	
	unityFilePath = path;
	
	NSError *readError = nil;
	contentData = [NSData dataWithContentsOfFile:path options:NSDataReadingUncached error: &readError];
	
	if (contentData != nil) {
		markerLoacation = [contentData rangeOfData:patternStandardMode options:0 range:NSMakeRange(0, [contentData length])];
		
		if (markerLoacation.location != NSNotFound) {
			_unityUiMode = StandardMode;
			return true;
			
		} else {
			
			markerLoacation = [contentData rangeOfData:patternDarkMode options:0 range:NSMakeRange(0, [contentData length])];
			
			if (markerLoacation.location != NSNotFound) {
				_unityUiMode = DarkMode;
				return true;
			}
		}
	}
	
	return false;
}

- (BOOL)switchUiMode {
	
	if (contentData == nil) {
		return false;
	}
	
	if (self.unityUiMode == UndefinedMode) {
		return false;
	}
	
	if (markerLoacation.location == NSNotFound) {
		return false;
	}
	
	NSData *pattern = nil;
	
	switch (self.unityUiMode) {
		case StandardMode:
			pattern = patternDarkMode;
			break;
			
		case DarkMode:
			pattern = patternStandardMode;
			break;
			
		default:
			break;
	}
	
	if (pattern == nil) {
		return false;
	}
	NSMutableData *patchedData = [NSMutableData dataWithData:contentData];
	
	[patchedData replaceBytesInRange:markerLoacation withBytes:pattern.bytes];
	
	[patchedData writeToFile:unityFilePath atomically:true];
	
	return true;
}

@end


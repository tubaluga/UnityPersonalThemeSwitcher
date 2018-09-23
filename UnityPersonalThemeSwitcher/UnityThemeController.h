//
//  UnityApplication.h
//  UnityPersonalThemeSwitcher
//
//  Created by Sergey A. Bazylev on 20/09/2018.
//  Copyright © 2018 Sergey A. Bazylev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
	UndefinedMode,
	StandardMode,
	DarkMode
} UnityUiMode;

@interface UnityThemeController : NSObject

/**
 Open application file

 @param path the file path
 @return result
 */
-(BOOL)open: (NSString *)path;

/**
 Switch mode

 @return result
 */
-(BOOL)switchUiMode;

@property (readonly) UnityUiMode unityUiMode;

@end

NS_ASSUME_NONNULL_END

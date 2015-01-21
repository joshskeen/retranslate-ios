//
//  GCPlaceholderTextView.h
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

#ifndef retranslate_GCPlaceholderTextView_h
#define retranslate_GCPlaceholderTextView_h

//
//  GCPlaceholderTextView.h
//  GCLibrary
//
//  Created by Guillaume Campagna on 10-11-16.
//  Copyright 2010 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GCPlaceholderTextView : UITextView

@property(nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIColor *realTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *placeholderColor UI_APPEARANCE_SELECTOR;

@end
#endif

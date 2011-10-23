//
//  CustomSlider.h
//  Measures
//
//  Created by Michael Neuwert on 4/26/11.
//  Copyright 2011 Neuwert Media. All rights reserved.
//

#import <Foundation/Foundation.h>



@class MNESliderValuePopupView;
@protocol SliderViewDelegate<NSObject>;
- (NSInteger) sliderValueToBeDisplayed: (NSInteger) currentSliderValue;
@end

id <SliderViewDelegate> sliderViewDelegate;

@interface MNEValueTrackingSlider : UISlider {
    MNESliderValuePopupView *valuePopupView; 
}

@property (nonatomic, readonly) CGRect thumbRect;
@property (nonatomic, strong) id <SliderViewDelegate> sliderViewDelegate;

@end


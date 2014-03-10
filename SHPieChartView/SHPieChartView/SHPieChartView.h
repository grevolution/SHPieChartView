// SHPieChartView.h
//
// Copyright (c) 2014 Shan Ul Haq (http://grevolution.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <UIKit/UIKit.h>


@interface ArcValueClass : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGFloat angle;

@end


@interface SHPieChartView : UIView <UIGestureRecognizerDelegate>
{
  NSMutableArray *_valuesAndColors;
  
}

/**
 *  if you want to specify a background to the chart.
 */
@property(nonatomic, strong) UIColor *chartBackgroundColor;

//properties to create concentric PI Chart
@property(nonatomic) BOOL isConcentric;                   //specify YES or NO if you want concentric Pie chart.
@property(nonatomic) CGFloat concentricRadius;            //radius of the concentric circle.
@property(nonatomic, strong) UIColor *concentricColor;    //color of the concentric circle.


/**
 *  this method will add the new Pie in the Pie Chart
 *
 *  @param angle    add the value between 0-1 to add a specific pie
 *  @param color    the color of the pie
 */
- (void)addAngleValue:(CGFloat)angle andClolor:(UIColor *)color;

/**
 *  this method will insert the new pie in the pie chart instead of just adding it at the last place
 *
 *  @param angle    add the value between 0-1 to add a specific pie
 *  @param color    the color of the pie
 *  @param index    the index at which you want to add the pie
 */
- (void)insertAngleValue:(CGFloat)angle andClolor:(UIColor *)color atIndex:(int)index;


/**
 *  resets the current pies array
 */
- (void)reset;
@end

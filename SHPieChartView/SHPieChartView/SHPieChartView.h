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

typedef NS_ENUM(NSUInteger, kChartType) {
  kChartTypeSingle = 1,
  kChartTypeMultiple =2
};

struct ArcValue {
  CGColorRef color;
  CGFloat angle;
};

typedef struct ArcValue ArcValue;

@interface SHPieChartView : UIView <UIGestureRecognizerDelegate>
{
  NSMutableArray *_valuesAndColors;
  
}
/**
 *  initialize the char view by providing the frame and the chart type. there are currently two chart types.
 *  
 *  - kChartTypeSingle : this will create a pi chart view with the single percentage value.
 *  - kChartTypeMultiple : this will create a full pie chart view with all the values provided.
 *
 *  @param frame     CGRect of the UIView
 *  @param chartType this will define what type of char tyou want to create.
 *
 *  @return will return an instance of SHPIChartView
 */
- (instancetype)initWithFrame:(CGRect)frame andStyle:(kChartType)chartType;

/**
 *  the type of the PI Chart.
 */
@property(nonatomic) kChartType chartType;

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

@end

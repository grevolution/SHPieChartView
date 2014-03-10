// SHPieChartView.m
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

#import "SHPieChartView.h"
#import <math.h>

#define ANGLE(val) DEG2RAD(270 + (val))
#define DEG2RAD(val) (M_PI / 180) * (val)
#define RADIUS_MARGIN 5

@implementation ArcValueClass

@end

@implementation SHPieChartView
{
  CGPoint _center;
  CGFloat _radius;
}

#pragma mark - initializer methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self bootstrap];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self bootstrap];
  }
  return self;
}

- (void)bootstrap
{
  self.backgroundColor = [UIColor clearColor];
  _valuesAndColors = [NSMutableArray array];
}

#pragma mark - Pie addition methods

- (void)addAngleValue:(CGFloat)angle andClolor:(UIColor *)color;
{
  ArcValueClass *v = [[ArcValueClass alloc] init];
  v.color = color;
  v.angle = angle;
  
  [_valuesAndColors addObject:v];
  
  [self setNeedsDisplay];
}

- (void)insertAngleValue:(CGFloat)angle andClolor:(UIColor *)color atIndex:(int)index;
{
  ArcValueClass *v = [[ArcValueClass alloc] init];
  v.color = color;
  v.angle = angle;
  
  [_valuesAndColors insertObject:v atIndex:index];
  
  [self setNeedsDisplay];
}

- (void)reset {
  [_valuesAndColors removeAllObjects];
}

#pragma mark - drawing methods

- (void)drawRect:(CGRect)rect
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  //center of the view
  _center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y - self.frame.origin.y);
  _radius = (MIN(self.bounds.size.width, self.bounds.size.height) / 2) - RADIUS_MARGIN;
  
  //apply the chart background color
  if(_chartBackgroundColor) {
    CGMutablePathRef path = createArc(_center, _radius, ANGLE(0), ANGLE(360));
    createAndFillArc(context, path, _chartBackgroundColor.CGColor);
  }
  
  __block CGFloat startAngle = 0;
  
  [_valuesAndColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    
    ArcValueClass *v = (ArcValueClass *)obj;
    CGColorRef color = v.color.CGColor;
    CGFloat value = v.angle;
    
    CGFloat angleValue = (360 * value);
    CGFloat endAngle = startAngle + angleValue;
    
    CGMutablePathRef path = createArc(_center, _radius, ANGLE(startAngle), ANGLE(endAngle));
    createAndFillArc(context, path, color);
    
    startAngle += angleValue;
  }];
  
  //check and apply the concentric circle
  if(_isConcentric && _concentricRadius > 0 && _concentricColor) {
    CGMutablePathRef path = createArc(_center, _concentricRadius, ANGLE(0), ANGLE(360));
    createAndFillArc(context, path, _concentricColor.CGColor);
  }
}

void createAndFillArc(CGContextRef context, CGPathRef path, CGColorRef color) {
  CGContextSetFillColor(context, CGColorGetComponents(color));
  CGContextAddPath(context, path);
  
  CGContextDrawPath(context, kCGPathFill);
}

CGMutablePathRef createArc(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAndle) {
  CGMutablePathRef path = CGPathCreateMutable();
  
  CGPathAddArc(path, NULL, center.x, center.y, radius, startAngle, endAndle, 0);
  CGPathAddLineToPoint(path, NULL, center.x, center.y);
  CGPathCloseSubpath(path);
  
  return path;
}

@end

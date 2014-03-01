// SHRootViewController.m
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

#import "SHRootViewController.h"
#import "SHPieChartView.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SHRootViewController ()

@end

@implementation SHRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
  concentricPieChart.chartBackgroundColor = UIColorFromRGB(0xFAFAFA);
  
  concentricPieChart.isConcentric = YES;
  concentricPieChart.concentricRadius = 70;
  concentricPieChart.concentricColor = UIColorFromRGB(0x54525C);
  
  [concentricPieChart addAngleValue:0.40 andClolor:[UIColor redColor]];

  [self.view addSubview:concentricPieChart];

  
  SHPieChartView *normalPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 230, 150, 150)];
  
  [normalPieChart addAngleValue:0.40 andClolor:[UIColor redColor]];
  [normalPieChart addAngleValue:0.20 andClolor:[UIColor greenColor]];
  [normalPieChart addAngleValue:0.30 andClolor:[UIColor blueColor]];
  [normalPieChart addAngleValue:0.10 andClolor:[UIColor orangeColor]];
  
  [self.view addSubview:normalPieChart];

  SHPieChartView *halfChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 400, 100, 100)];
  [halfChart addAngleValue:0.40 andClolor:UIColorFromRGB(0x3C60A3)];
  
  [self.view addSubview:halfChart];

  
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

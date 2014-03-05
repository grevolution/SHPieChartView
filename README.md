SHPieChartView
==============

`SHPieChartView` is a simple reusable UIView Sublcass that creates Pie Charts.

##How to Use It

###Normal Pie Chart

```objective-c
  SHPieChartView *normalPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 230, 150, 150)];
  
  [normalPieChart addAngleValue:0.40 andClolor:[UIColor redColor]];
  [normalPieChart addAngleValue:0.20 andClolor:[UIColor greenColor]];
  [normalPieChart addAngleValue:0.30 andClolor:[UIColor blueColor]];
  [normalPieChart addAngleValue:0.10 andClolor:[UIColor orangeColor]];
  
  [self.view addSubview:normalPieChart];
```

###Concentric Pie Chart

```objective-c
  SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
  concentricPieChart.chartBackgroundColor = UIColorFromRGB(0xFAFAFA);
  
  concentricPieChart.isConcentric = YES;
  concentricPieChart.concentricRadius = 70;
  concentricPieChart.concentricColor = UIColorFromRGB(0x54525C);
  
  [concentricPieChart addAngleValue:0.40 andClolor:[UIColor redColor]];

  [self.view addSubview:concentricPieChart];
 ```

###Half Pie Chart

```objective-c
  SHPieChartView *halfChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 400, 100, 100)];
  [halfChart addAngleValue:0.40 andClolor:UIColorFromRGB(0x3C60A3)];
  
  [self.view addSubview:halfChart];
```

![chart image](https://raw.github.com/grevolution/SHPieChartView/master/wiki-images/chart.png)

###LICENSE

see [LICENSE](https://github.com/grevolution/SHPieChartView/blob/master/LICENSE)

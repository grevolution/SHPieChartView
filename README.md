SHPieChartView
==============

`SHPieChartView` is a simple reusable UIView Sublcass that creates Pie Charts.

[![Build Status](https://travis-ci.org/grevolution/SHPieChartView.svg?branch=master)](https://travis-ci.org/grevolution/SHPieChartView)

##How to Use It

###Normal Pie Chart

```objective-c
  SHPieChartView *normalPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 230, 150, 150)];
  
  [normalPieChart addAngleValue:0.40 andColor:[UIColor redColor]];
  [normalPieChart addAngleValue:0.20 andColor:[UIColor greenColor]];
  [normalPieChart addAngleValue:0.30 andColor:[UIColor blueColor]];
  [normalPieChart addAngleValue:0.10 andColor:[UIColor orangeColor]];
  
  [self.view addSubview:normalPieChart];
```

###Concentric Pie Chart

```objective-c
  SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
  concentricPieChart.chartBackgroundColor = UIColorFromRGB(0xFAFAFA);
  
  concentricPieChart.isConcentric = YES;
  concentricPieChart.concentricRadius = 70;
  concentricPieChart.concentricColor = UIColorFromRGB(0x54525C);
  
  [concentricPieChart addAngleValue:0.40 andColor:[UIColor redColor]];

  [self.view addSubview:concentricPieChart];
 ```

###Half Pie Chart

```objective-c
  SHPieChartView *halfChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 400, 100, 100)];
  [halfChart addAngleValue:0.40 andColor:UIColorFromRGB(0x3C60A3)];
  
  [self.view addSubview:halfChart];
```

![chart image](https://raw.github.com/grevolution/SHPieChartView/master/wiki-images/chart.png)

###Contact Me

Shan Ul Haq (http://grevolution.me)

- g@grevolution.me

- http://twitter.com/gfg5tek

- http://sg.linkedin.com/in/grevolution/

###LICENSE

see [LICENSE](https://github.com/grevolution/SHPieChartView/blob/master/LICENSE)

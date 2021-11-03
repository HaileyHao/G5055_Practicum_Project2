---
title: "Practicum SDG Group 2"
output:
  html_document:
    keep_md: yes
---

This notebook includes preliminary attempts to visualize some basic information about the dataset. 





```r
#df <- read.csv('../../Data/indonesia_indicators_time.csv')
```



# Data Messiness 

This section details the messiness of our dataset. First, we took a quick look at a few ways that items have been disaggregated. 

When we initially made unique measures seperate from one another, we concatenated all of the columns in the dataset having to do iwth disaggregation. Based on a cursory look, these are some of the breakdowns (note that these categories may not be complete). When we could identify that everyone appeared to be included (e.g., 'ALLREGIONS' or 'BOTHSEX'), we did not count these measures as 'disaggregated.' 


```
## `summarise()` has grouped output by 'Target', 'Indicator', 'SeriesDescription'. You can override using the `.groups` argument.
```

```
## `summarise()` has grouped output by 'disaggregation'. You can override using the `.groups` argument.
```

![](Basic_Data_Plotting_files/figure-html/indonesia tree map-1.png)<!-- -->

```
## Warning: 'hctreemap' is deprecated.
## Use 'data_to_hierarchical' instead.
## See help("Deprecated")
```

```{=html}
<div id="htmlwidget-da4ea0b6d031cd803a93" style="width:100%;height:500px;" class="highchart html-widget"></div>
<script type="application/json" data-for="htmlwidget-da4ea0b6d031cd803a93">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"Disaggregated Data (Indonesia) "},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":false},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"data":[{"name":"age_sex\n313","value":313,"valuecolor":1,"level":1,"color":"#F7FBFF","id":"age_sex_313"},{"name":"geographic_region\n91","value":91,"valuecolor":1,"level":1,"color":"#DEEBF7","id":"geographic_region_91"},{"name":"other/not_disaggregated\n530","value":530,"valuecolor":1,"level":1,"color":"#C6DBEF","id":"other_not_disaggregated_530"},{"name":"raw_material\n126","value":126,"valuecolor":1,"level":1,"color":"#9ECAE1","id":"raw_material_126"},{"name":"sector\n50","value":50,"valuecolor":1,"level":1,"color":"#6BAED6","id":"sector_50"},{"name":"time\n14","value":14,"valuecolor":1,"level":1,"color":"#4292C6","id":"time_14"}],"type":"treemap","allowDrillToNode":true,"layoutAlgorithm":"squarified"}],"tooltip":{"pointFormat":"<b>{point.name}<\/b>:<br>\n                             Number of Measures: {point.value:,.0f}<br>"}},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","drillUpText":"Back to {series.name}","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"thousandsSep":" ","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"chart","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
```

This is a bit more of a look at the above disaggregation, wherein we look also at whether measures are disaggregated and how many (per target, subset by goal)
![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-1.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-2.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-3.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-4.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-5.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-6.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-7.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-8.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-9.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-10.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-11.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-12.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-13.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-14.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-15.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-16.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/indonesia bar chart-17.png)<!-- -->

Finally, the following is an example of our current progress (with Indonesia) in terms of how many indicators we have removed for each target / goal. 

```r
processedIndo =  read.csv('~/QMSS/G5055_Practicum_Project2/Data/processedIndo.csv')
nrow(processedIndo)
```

```
## [1] 4230
```

```r
processedIndo_No_Disagg = read.csv('~/QMSS/G5055_Practicum_Project2/Data/processedIndo-WITHOUT disaggregation.csv')
nrow(processedIndo_No_Disagg)
```

```
## [1] 1809
```



## Guatemala

Also wanted to look at the same with guatemala 


```
## `summarise()` has grouped output by 'Target', 'Indicator', 'SeriesDescription'. You can override using the `.groups` argument.
```

```
## `summarise()` has grouped output by 'disaggregation'. You can override using the `.groups` argument.
```

![](Basic_Data_Plotting_files/figure-html/guatemala tree map-1.png)<!-- -->

```
## $tm
##           disaggregation_count vSize vColor stdErr vColorValue level        x0        y0          w         h   color
## 1                 age_sex\n372   372      1    372          NA     1 0.4494949 0.2370031 0.41039655 0.7629969 #FCFBFD
## 2        geographic_region\n99    99      1     99          NA     1 0.4494949 0.0000000 0.35161290 0.2370031 #EFEDF5
## 3 other/not_disaggregated\n534   534      1    534          NA     1 0.0000000 0.0000000 0.44949495 1.0000000 #DADAEB
## 4            raw_material\n127   127      1    127          NA     1 0.8598915 0.2370031 0.14010850 0.7629969 #BCBDDC
## 5                   sector\n42    42      1     42          NA     1 0.8011079 0.0000000 0.14916911 0.2370031 #9E9AC8
## 6                     time\n14    14      1     14          NA     1 0.9502770 0.0000000 0.04972304 0.2370031 #807DBA
## 
## $type
## [1] "index"
## 
## $vSize
## [1] "count"
## 
## $vColor
## [1] NA
## 
## $stdErr
## [1] "count"
## 
## $algorithm
## [1] "pivotSize"
## 
## $vpCoorX
## [1] 0.02812148 0.97187852
## 
## $vpCoorY
## [1] 0.01968504 0.91031496
## 
## $aspRatio
## [1] 1.483512
## 
## $range
## [1] NA
## 
## $mapping
## [1] NA NA NA
## 
## $draw
## [1] TRUE
```

```
## Warning: 'hctreemap' is deprecated.
## Use 'data_to_hierarchical' instead.
## See help("Deprecated")
```

```{=html}
<div id="htmlwidget-f5c35e6d1cfb6d8e1a76" style="width:100%;height:500px;" class="highchart html-widget"></div>
<script type="application/json" data-for="htmlwidget-f5c35e6d1cfb6d8e1a76">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"Disaggregated Data (Guatemala)"},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":false},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"data":[{"name":"age_sex\n372","value":372,"valuecolor":1,"level":1,"color":"#FCFBFD","id":"age_sex_372"},{"name":"geographic_region\n99","value":99,"valuecolor":1,"level":1,"color":"#EFEDF5","id":"geographic_region_99"},{"name":"other/not_disaggregated\n534","value":534,"valuecolor":1,"level":1,"color":"#DADAEB","id":"other_not_disaggregated_534"},{"name":"raw_material\n127","value":127,"valuecolor":1,"level":1,"color":"#BCBDDC","id":"raw_material_127"},{"name":"sector\n42","value":42,"valuecolor":1,"level":1,"color":"#9E9AC8","id":"sector_42"},{"name":"time\n14","value":14,"valuecolor":1,"level":1,"color":"#807DBA","id":"time_14"}],"type":"treemap","allowDrillToNode":true,"layoutAlgorithm":"squarified"}],"tooltip":{"pointFormat":"<b>{point.name}<\/b>:<br>\n                             Number of Measures: {point.value:,.0f}<br>"}},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","drillUpText":"Back to {series.name}","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"thousandsSep":" ","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"chart","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
```

This is a bit more of a look at the above disaggregation, wherein we look also at whether measures are disaggregated and how many (per target, subset by goal)
![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-1.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-2.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-3.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-4.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-5.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-6.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-7.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-8.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-9.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-10.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-11.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-12.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-13.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-14.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-15.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-16.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/guatemala bar chart-17.png)<!-- -->

## Measures with only one existent year 


```
## [1] "Missingness Across Time:"
```

![](Basic_Data_Plotting_files/figure-html/missing data charts-1.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-2.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-3.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-4.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-5.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-6.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-7.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-8.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-9.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-10.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-11.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-12.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-13.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-14.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-15.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-16.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-17.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-18.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-19.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-20.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-21.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-22.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-23.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-24.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-25.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-26.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-27.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-28.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-29.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-30.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-31.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-32.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-33.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-34.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-35.png)<!-- -->![](Basic_Data_Plotting_files/figure-html/missing data charts-36.png)<!-- -->
## Weighted degree of each measure 
TBD

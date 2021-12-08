This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you
execute code within the notebook, the results appear beneath the code.

Try executing this chunk by clicking the *Run* button within the chunk
or by placing your cursor inside it and pressing *Cmd+Shift+Enter*.

    indo_attributes <- read.csv('https://raw.githubusercontent.com/HaileyHao/G5055_Practicum_Project2/main/Data/coefficient_network/indo_weighted_attributes_sig.csv')
    indo_attributes

    ##    Indicator Goal Target degree    strength
    ## 1      1.1.1    1    1.1     64  6.42090967
    ## 2      1.2.1    1    1.2     64 -8.25470619
    ## 3      1.3.1    1    1.3     64 -8.27637375
    ## 4      1.4.1    1    1.4     64  6.20691361
    ## 5      1.5.1    1    1.5      5  4.36858500
    ## 6      1.5.2    1    1.5      3  2.60253698
    ## 7      1.5.3    1    1.5     16  5.24535949
    ## 8      1.5.4    1    1.5      6 -0.71152502
    ## 9      1.a.2    1    1.a     64 -7.66625217
    ## 10    10.4.1   10   10.4     64 -7.97763161
    ## 11    10.5.1   10   10.5     63  7.77106071
    ## 12    10.7.3   10   10.7      1  0.89439144
    ## 13    10.c.1   10   10.c     68 -6.61200739
    ## 14    11.1.1   11   11.1     64  6.67278517
    ## 15    11.5.1   11   11.5      5  4.36858500
    ## 16    11.5.2   11   11.5      3  2.60253698
    ## 17    11.6.2   11   11.6     61  5.85771797
    ## 18    11.b.1   11   11.b     16  5.24535949
    ## 19    11.b.2   11   11.b      6 -0.71152502
    ## 20    12.4.2   12   12.4     60  5.97953705
    ## 21    12.a.1   12   12.a     63  6.83450427
    ## 22    12.b.1   12   12.b     63 -8.69678621
    ## 23    12.c.1   12   12.c     53 -1.08707165
    ## 24    13.1.1   13   13.1      5  4.36858500
    ## 25    13.1.2   13   13.1     16  5.24535949
    ## 26    13.1.3   13   13.1      6 -0.71152502
    ## 27    14.1.1   14   14.1     66 -4.37508523
    ## 28    14.7.1   14   14.7      2  1.65630444
    ## 29    15.1.1   15   15.1     64  5.92775678
    ## 30    15.2.1   15   15.2     61  4.19108144
    ## 31    15.5.1   15   15.5     64 -8.36212838
    ## 32    15.6.1   15   15.6     68  4.84111719
    ## 33    15.8.1   15   15.8     66 -3.98944341
    ## 34    16.2.2   16   16.2     63  6.51980217
    ## 35    16.3.2   16   16.3     64 -8.25470619
    ## 36    16.6.1   16   16.6      1  0.82622195
    ## 37    17.1.1   17   17.1     64  6.47103617
    ## 38   17.13.1   17  17.13     63 -7.15210122
    ## 39   17.17.1   17  17.17      4 -0.04783817
    ## 40    17.3.1   17   17.3      1  0.89439144
    ## 41    17.3.2   17   17.3      1  0.82044325
    ## 42    17.4.1   17   17.4      1 -0.76771596
    ## 43    17.8.1   17   17.8     68 -5.76966258
    ## 44    17.9.1   17   17.9      1  0.67640130
    ## 45     2.1.1    2    2.1     64  7.16458948
    ## 46     2.1.2    2    2.1      3  0.82596638
    ## 47     2.2.1    2    2.2     68 -5.51923333
    ## 48     2.2.2    2    2.2     64  6.49956043
    ## 49     2.5.1    2    2.5     62  8.58750740
    ## 50     2.5.2    2    2.5     66 -5.06309657
    ## 51     2.a.1    2    2.a     65 -7.08758731
    ## 52     3.2.1    3    3.2     64  6.37877573
    ## 53     3.2.2    3    3.2     64  6.36744302
    ## 54     3.3.2    3    3.3     64 -8.24589237
    ## 55     3.3.3    3    3.3     64  6.35619966
    ## 56     3.3.5    3    3.3     64  7.00763102
    ## 57     3.4.1    3    3.4     64 -8.25470619
    ## 58     3.4.2    3    3.4     64  6.25470619
    ## 59     3.6.1    3    3.6     64  6.25470619
    ## 60     3.8.1    3    3.8     64 -8.25470619
    ## 61     3.8.2    3    3.8     62  4.26582433
    ## 62     3.b.1    3    3.b     67  4.61677458
    ## 63     3.d.2    3    3.d     64  6.25470619
    ## 64     4.2.2    4    4.2     62 -9.67847094
    ## 65     4.3.1    4    4.3     64  6.26097587
    ## 66     4.5.1    4    4.5     64 -8.20872962
    ## 67     5.b.1    5    5.b     64  6.26693087
    ## 68     6.2.1    6    6.2     64  6.28998566
    ## 69     6.4.1    6    6.4     65 -8.38574215
    ## 70     6.4.2    6    6.4     63  7.49836818
    ## 71     6.5.1    6    6.5     64 -8.25470619
    ## 72     6.6.1    6    6.6     68 -6.29906740
    ## 73     7.1.1    7    7.1     64  6.03320132
    ## 74     7.1.2    7    7.1     64  6.54318817
    ## 75     7.2.1    7    7.2     67 -4.04662663
    ## 76     7.3.1    7    7.3     64  8.07690298
    ## 77     7.a.1    7    7.a     67 -4.09950297
    ## 78     7.b.1    7    7.b     63  6.83450427
    ## 79     8.1.1    8    8.1      5  0.80971752
    ## 80     8.2.1    8    8.2     12 -1.31351515
    ## 81     8.3.1    8    8.3     67 -6.17176119
    ## 82     8.8.2    8    8.8     62  7.96180772
    ## 83     8.9.1    8    8.9     54 -3.30087605
    ## 84     9.1.2    9    9.1     67 -5.13935072
    ## 85     9.4.1    9    9.4     64  6.55641184
    ## 86     9.5.1    9    9.5     63  7.47973063
    ## 87     9.5.2    9    9.5     65  7.02348267

    gua_attributes <- read.csv('https://raw.githubusercontent.com/HaileyHao/G5055_Practicum_Project2/main/Data/coefficient_network/gua_weighted_attributes_sig.csv')
    gua_attributes

    ##    Indicator Goal Target degree     strength
    ## 1      1.3.1    1    1.3     64  5.031966667
    ## 2      1.4.1    1    1.4     63  3.842049778
    ## 3      1.5.1    1    1.5     13 10.831176436
    ## 4      1.5.2    1    1.5      9  7.609780256
    ## 5      1.5.3    1    1.5     50  0.764947004
    ## 6      1.5.4    1    1.5     63  5.530458553
    ## 7      1.a.2    1    1.a     55  0.244563928
    ## 8     10.4.1   10   10.4     51  1.847269742
    ## 9     10.5.1   10   10.5     14 -0.692507632
    ## 10    10.7.3   10   10.7      1  0.734032643
    ## 11    10.c.1   10   10.c     29  2.159903155
    ## 12    11.1.1   11   11.1     63 -4.359234596
    ## 13    11.5.1   11   11.5     13 10.831176436
    ## 14    11.5.2   11   11.5     38 16.810767931
    ## 15    11.6.2   11   11.6     62 -4.877033000
    ## 16    11.b.1   11   11.b     50  0.764947004
    ## 17    11.b.2   11   11.b     63  5.530458553
    ## 18    12.a.1   12   12.a     62  1.707268220
    ## 19    12.c.1   12   12.c     63  2.677769276
    ## 20    13.1.1   13   13.1     13 10.831176436
    ## 21    13.1.2   13   13.1     50  0.764947004
    ## 22    13.1.3   13   13.1     63  5.530458553
    ## 23    14.1.1   14   14.1     59 -2.710415916
    ## 24    14.7.1   14   14.7     64 -6.320684755
    ## 25    14.b.1   14   14.b     64  4.549364974
    ## 26    15.1.1   15   15.1     64 -6.549368812
    ## 27    15.2.1   15   15.2     63  3.282532618
    ## 28    15.5.1   15   15.5     63 -5.821251349
    ## 29    15.6.1   15   15.6     61  3.456057309
    ## 30    16.2.2   16   16.2     62 -3.082922876
    ## 31    16.3.2   16   16.3     64  4.549364974
    ## 32    16.6.1   16   16.6      8  6.594754220
    ## 33    17.1.1   17   17.1     54 -3.128912987
    ## 34   17.13.1   17  17.13     65  6.560527577
    ## 35   17.17.1   17  17.17     62  8.744758725
    ## 36    17.3.1   17   17.3     60 -7.354209498
    ## 37    17.3.2   17   17.3     67  7.710810980
    ## 38    17.4.1   17   17.4      2  0.008057865
    ## 39    17.8.1   17   17.8     63  4.133869011
    ## 40     2.1.1    2    2.1     63  2.744877510
    ## 41     2.1.2    2    2.1     63 -5.666328170
    ## 42     2.2.1    2    2.2     38 15.098908977
    ## 43     2.2.2    2    2.2     67  8.014545676
    ## 44     2.a.1    2    2.a     62 -4.382424219
    ## 45     2.c.1    2    2.c      2 -1.468422249
    ## 46     3.2.1    3    3.2     63 -4.320225227
    ## 47     3.2.2    3    3.2     63  3.955668077
    ## 48     3.3.1    3    3.3     62 -4.314690307
    ## 49     3.3.2    3    3.3      5  3.724105136
    ## 50     3.3.3    3    3.3     60  7.073764777
    ## 51     3.3.5    3    3.3     56  7.134771790
    ## 52     3.4.1    3    3.4     63  4.601957533
    ## 53     3.4.2    3    3.4     64  4.549364974
    ## 54     3.6.1    3    3.6     64 -6.549364974
    ## 55     3.8.1    3    3.8     64  4.549364974
    ## 56     3.9.3    3    3.9     64 -6.549364974
    ## 57     3.b.1    3    3.b     63 -2.359568266
    ## 58     4.2.2    4    4.2     61  2.455737498
    ## 59     4.3.1    4    4.3     62 -5.220430175
    ## 60     4.5.1    4    4.5      3 -0.831282991
    ## 61     6.1.1    6    6.1     63 -4.115476260
    ## 62     6.2.1    6    6.2     62 -2.437349332
    ## 63     6.4.1    6    6.4     63 -5.720220902
    ## 64     6.4.2    6    6.4     61  3.182622529
    ## 65     6.5.1    6    6.5     64  4.549364974
    ## 66     6.6.1    6    6.6     62 -3.374839244
    ## 67     7.1.1    7    7.1     61 -6.518018032
    ## 68     7.1.2    7    7.1     63  3.998578312
    ## 69     7.2.1    7    7.2     56 -0.681233040
    ## 70     7.3.1    7    7.3     55  0.773467897
    ## 71     7.a.1    7    7.a      3  0.737541796
    ## 72     7.b.1    7    7.b     62  1.707268220
    ## 73     8.2.1    8    8.2      3 -0.970898069
    ## 74     8.3.1    8    8.3      3  2.322869548
    ## 75     8.8.2    8    8.8     64  4.719664387
    ## 76     9.1.2    9    9.1     62 -3.156742521
    ## 77     9.4.1    9    9.4     62 -4.229091041
    ## 78     9.5.1    9    9.5     56 -0.245991682
    ## 79     9.5.2    9    9.5     50 -3.860458031

    dict <- data.frame(Goal = c(1:17),
                       hex_color = c("#ea1d2d","#d19f2a","#2d9a47","#c22033","#ef412a","#00add8",
                                 "#fdb714","#8f1838", "#f36e24","#e01a83","#f99d25","#cd8b2a",
                                 "#48773c","#007dbb","#40ae49","#00558a","#1a3668")) 
    hex_color = c("#ea1d2d","#d19f2a","#2d9a47","#c22033","#ef412a","#00add8",
                                 "#fdb714","#8f1838", "#f36e24","#e01a83","#f99d25","#cd8b2a",
                                 "#48773c","#007dbb","#40ae49","#00558a","#1a3668")
    dict$Goal <- as.character(dict$Goal)
    dict

    ##    Goal hex_color
    ## 1     1   #ea1d2d
    ## 2     2   #d19f2a
    ## 3     3   #2d9a47
    ## 4     4   #c22033
    ## 5     5   #ef412a
    ## 6     6   #00add8
    ## 7     7   #fdb714
    ## 8     8   #8f1838
    ## 9     9   #f36e24
    ## 10   10   #e01a83
    ## 11   11   #f99d25
    ## 12   12   #cd8b2a
    ## 13   13   #48773c
    ## 14   14   #007dbb
    ## 15   15   #40ae49
    ## 16   16   #00558a
    ## 17   17   #1a3668

    MyColour <- c("#ea1d2d","#d19f2a","#2d9a47","#c22033","#ef412a","#00add8",
                                 "#fdb714","#8f1838", "#f36e24","#e01a83","#f99d25","#cd8b2a",
                                 "#48773c","#007dbb","#40ae49","#00558a","#1a3668")
    names(MyColour) <- c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17")

    # not looking at betweenness anymrore.
    # indo_attributes %>% arrange(desc(btwn)) %>%
    #     slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>% 
    #     ggplot( aes(x=reorder(Indicator, btwn), y=btwn, fill = Goal)) +
    #     geom_bar(stat="identity",  width=.4) + 
    #   scale_fill_manual(values = MyColour) +
    #     coord_flip() +
    #     xlab("") +
    #     theme_bw() + ylab("betweenness centrality") + 
    #     theme_bw() + ggtitle("Most Central Indicators (Betweenness) - Indonesia")
    #   
    # gua_attributes %>% arrange(desc(btwn)) %>%
    #     slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>% 
    #     ggplot( aes(x=reorder(Indicator, btwn), y=btwn, fill = Goal)) +
    #     geom_bar(stat="identity",  width=.4) + 
    #   scale_fill_manual(values = MyColour) +
    #     coord_flip() +
    #     xlab("") + ylab("betweenness centrality") + 
    #     theme_bw() + ggtitle("Most Central Indicators (Betweenness) - Guatemala")

    # Not using these anymore 
    # indo_attributes %>% arrange(desc(eigen.vector)) %>%
    #     slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>% 
    #     ggplot( aes(x=reorder(Indicator, eigen.value), y=eigen.value, fill = Goal)) +
    #     geom_bar(stat="identity",  width=.4) + 
    #   scale_fill_manual(values = MyColour) +
    #     coord_flip() +
    #     xlab("") +
    #     theme_bw() + ylab("eigen centrality") + 
    #     theme_bw() + ggtitle("Most Central Indicators (Eigenvector) - Indonesia")
    #   
    # gua_attributes  %>% arrange(desc(eigen.vector)) %>%
    #     slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>% 
    #     ggplot( aes(x=reorder(Indicator, eigen.value), y=eigen.value, fill = Goal)) +
    #     geom_bar(stat="identity",  width=.4) + 
    #   scale_fill_manual(values = MyColour) +
    #     coord_flip() +
    #     xlab("") +
    #     theme_bw() + ylab("eigen centrality") + 
    #     theme_bw() + ggtitle("Most Central Indicators (Eigenvector) - Guatemala")
    #   

    indo_attributes %>% arrange(desc(degree)) %>%
        slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>%
        ggplot( aes(x=reorder(Indicator, degree), y=degree, fill = Goal)) +
        geom_bar(stat="identity",  width=.4) +
      scale_fill_manual(values = MyColour) +
        coord_flip() +
        xlab("") +
        theme_bw() + ylab("degree centrality") +
        theme_bw() + ggtitle("Most Central Indicators (Degree) - Indonesia")

![](Attribute_Visualizations_files/figure-markdown_strict/degree%20and%20strength%20centrality-1.png)

    gua_attributes %>% arrange(desc(degree)) %>%
        slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>%
        ggplot( aes(x=reorder(Indicator, degree), y=degree, fill = Goal)) +
        geom_bar(stat="identity",  width=.4) +
      scale_fill_manual(values = MyColour) +
        coord_flip() +
        xlab("") + ylab("degree centrality") +
        theme_bw() + ggtitle("Most Central Indicators (Degree) - Guatemala")

![](Attribute_Visualizations_files/figure-markdown_strict/degree%20and%20strength%20centrality-2.png)

    indo_attributes %>% arrange(desc(strength)) %>%
        slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>%
        ggplot( aes(x=reorder(Indicator, strength), y=strength, fill = Goal)) +
        geom_bar(stat="identity",  width=.4) +
      scale_fill_manual(values = MyColour) +
        coord_flip() +
        xlab("") +
        theme_bw() + ylab("strength centrality") +
        theme_bw() + ggtitle("Most Central Indicators (positive strength centrality)** - Indonesia") + labs(
                  caption = "**: strength centrality is calculated as the sum of correlation coefficients, and gives us information on whether the centrality helps (positive relationships) or hinders (negative relationships) its related indicators.")

![](Attribute_Visualizations_files/figure-markdown_strict/degree%20and%20strength%20centrality-3.png)

    gua_attributes %>% arrange(desc(strength)) %>%
        slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>%
        ggplot( aes(x=reorder(Indicator, strength), y=strength, fill = Goal)) +
        geom_bar(stat="identity",  width=.4) +
      scale_fill_manual(values = MyColour) +
        coord_flip() +
        xlab("") + ylab("strength centrality") +
        theme_bw() + ggtitle("Most Central Indicators (positive strength centrality)** - Guatemala")+ labs(
                  caption = "**: strength centrality is calculated as the sum of correlation coefficients, and gives us information on whether the centrality helps (positive relationships) or hinders (negative relationships) its related indicators.")

![](Attribute_Visualizations_files/figure-markdown_strict/degree%20and%20strength%20centrality-4.png)

    indo_attributes %>% arrange(strength) %>%
        slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>%
        ggplot( aes(x=reorder(Indicator, strength), y=strength, fill = Goal)) +
        geom_bar(stat="identity",  width=.4) +
      scale_fill_manual(values = MyColour) +
        coord_flip() +
        xlab("") +
        theme_bw() + ylab("strength centrality") +
        theme_bw() + ggtitle("Most Central Indicators (negative strength centrality)** - Indonesia") + labs(
                  caption = "**: strength centrality is calculated as the sum of correlation coefficients, and gives us information on whether the centrality helps (positive relationships) or hinders (negative relationships) its related indicators.")

![](Attribute_Visualizations_files/figure-markdown_strict/degree%20and%20strength%20centrality-5.png)

    gua_attributes %>% arrange(strength) %>%
        slice(1:15) %>% mutate(Goal = as.character(Goal)) %>% merge(dict, on=Goal) %>%
        ggplot( aes(x=reorder(Indicator, strength), y=strength, fill = Goal)) +
        geom_bar(stat="identity",  width=.4) +
      scale_fill_manual(values = MyColour) +
        coord_flip() +
        xlab("") + ylab("strength centrality") +
        theme_bw() + ggtitle("Most Central Indicators (negative strength centrality)** - Guatemala")+ labs(
                  caption = "**: strength centrality is calculated as the sum of correlation coefficients, and gives us information on whether the centrality helps (positive relationships) or hinders (negative relationships) its related indicators.")

![](Attribute_Visualizations_files/figure-markdown_strict/degree%20and%20strength%20centrality-6.png)

indo\_attributes

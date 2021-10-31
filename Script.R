library(ggplot2)

df <- read.csv("https://github.com/roadricefield/Qiita_ggplot2_-/raw/main/level1.csv")

g <- ggplot(df, aes(x = day, y = time)) + #グラフオブジェクト
     geom_line()

plot(g) #作ったグラフを画面に表示

ggsave(plot = g, file = "level1.png", w = 3.1, h = 2.4, dpi = 600) #pngでグラフを保存


g <- ggplot(df, aes(x = day, y = time)) +
     geom_line() +
     xlab("Date") + #x軸の軸ラベルを指定
     ylab("Play time (min)") #y軸の軸ラベルを指定

plot(g)


g <- ggplot(df, aes(x = day, y = time)) +
     geom_line() +
     xlab("Date") +
     ylab("Play time (min)") +
     scale_x_continuous(breaks = seq(1,7,1)) #x軸の目盛り間隔を指定．もちろんbreaks = c(1,2,3,4,5,6,7)
                                             #などでもOK！

plot(g)


g <- ggplot(df, aes(x = day, y = time)) +
     geom_line(color = "royalblue") + #geom_line()のcolor引数に色を指定．
     geom_point(color = "royalblue") + #geom_point()は点を打つ要素．color引数に色を指定．
     xlab("Date") +
     ylab("Play time (min)") +
     scale_x_continuous(breaks = seq(1,7,1))

plot(g)


g <- ggplot(df, aes(x = day, y = time)) +
     geom_line(color = "royalblue") +
     geom_point(color = "royalblue") +
     xlab("Date") +
     ylab("Play time (min)") +
     scale_x_continuous(breaks = seq(1,7,1)) +
     theme_classic() + #背景を白くして上と右の枠線を描かないようにする要素
     theme(panel.grid = element_blank()) + #背景のグリッド線を消す
     theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) #目盛り，軸ラベルの文字の大きさを指定

plot(g)


week <- c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat") #目盛りに使用する文字のベクトル

g <- ggplot(df, aes(x = day, y = time)) +
     geom_line(color = "royalblue") +
     geom_point(color = "royalblue") +
     scale_x_continuous(breaks = seq(1,7,1), labels = week) + #lables引数に目盛りとして使う文字を指定．
                                                              #1~7まで1ずづの間隔で"Sun"~"Sat"の文字列を軸ラベルに書く．
     xlab("Day") + #曜日なので"Day"としておく．
     ylab("Play time (min)") +
     theme_classic() +
     theme(panel.grid = element_blank()) +
     theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15))

plot(g)



df <- read.csv("https://github.com/roadricefield/Qiita_ggplot2_-/raw/main/level3.csv")

g <- ggplot(df, aes(x = day, y = time, color = application)) + #色でapplication列を指定
        geom_line() +
        geom_point() +
        scale_color_manual(values = c("deepskyblue1", "green3")) + #グラフの色を順に指定
        scale_x_continuous(breaks = seq(1,7,1)) +
        xlab("Date") +
        ylab("Time (min)") +
        labs(color = "Application") + #凡例のタイトルを指定．今回は色に関する凡例のタイトルなので
        theme_classic() +             #color = "Application"と指定する必要がある．
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15))

plot(g)


g <- ggplot(df, aes(x = day, y = time, shape = application, lty = application)) +
        geom_line() +
        geom_point(size = 2) + #点を少し大きくした．
        scale_x_continuous(breaks = seq(1,7,1)) +
        xlab("Date") +
        ylab("Time (min)") +
        labs(shape = "Application", lty = "Application") + #めんどいがshapeとlty両方で書く必要がある．
        theme_classic() +                                  #書かないとどうなるかは試してみてください．
        theme(panel.grid = element_blank())
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15))

plot(g)



g <- ggplot(df, aes(x = day, y = time, color = application)) +
        geom_line() +
        geom_point() +
        facet_wrap(~application, ncol = 1) + #applicationごとにグラフを分けて縦一列で表示する．
        scale_color_manual(values = c("deepskyblue1", "green3")) + 
        scale_x_continuous(breaks = seq(1,7,1)) +
        xlab("Date") +
        ylab("Time (min)") +
        theme_bw() + #theme_classic() -> theme_bw()
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        guides(color = F) + #これを書かないと各colorがどのapplicationを指すのかを示す凡例が残ってしまいます．
        theme(strip.background = element_blank(), strip.text = element_text(size = 15))

plot(g)



df <- read.csv("https://github.com/roadricefield/Qiita_ggplot2_-/raw/main/level4.csv")

g <- ggplot(df, aes(x = Subject, y = Average)) +
        geom_bar(stat = "identity") + #stat = "identity"はおまじないです．
        theme_classic() +
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15))

plot(g)



g <- ggplot(df, aes(x = Subject, y = Average)) +
        geom_bar(stat = "identity") +
        theme_classic() +
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) + #"Subject"は消しちゃう．
        theme(axis.text.x = element_text(angle = 30, hjust = 1, size = 15)) #横軸のテキスト（axis.text.x）を30度回転させて
                                                                            #ついでに文字の大きさを15 ptに変更する．
plot(g)



g <- ggplot(df, aes(x = Subject, y = Average)) +
        geom_bar(stat = "identity") +
        theme_classic() +
        geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.3) + #これ！！！！！！！！！！！！！！！！
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) +
        theme(axis.text.x = element_text(angle = 30, hjust = 1, size = 15))

plot(g)



df$Subject <- factor(df$Subject, levels = c("Mathematics IA", "Mathematics IIB", 
                                            "Chemistry", "Physics", "Biology", "Earth science")) #これ！！！！！！！！！！！！！！！！！！！

g <- ggplot(df, aes(x = Subject, y = Average)) +
        geom_bar(stat = "identity") +
        theme_classic() +
        geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.3)+
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 15)) #角度を45度に変更しました．

plot(g)



df$Subject <- factor(df$Subject, levels = c("Mathematics IA", "Mathematics IIB", 
                                            "Chemistry", "Physics", "Biology", "Earth science"))

g <- ggplot(df, aes(x = Subject, y = Average, color = Subject)) +
        geom_bar(stat = "identity") +
        theme_classic() +
        geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.3) +
        scale_color_manual(values = c("deepskyblue1", "royalblue", "purple", "red",
                                      "seagreen", "saddlebrown")) +
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 15))

plot(g)


df$Subject <- factor(df$Subject, levels = c("Mathematics IA", "Mathematics IIB", 
                                            "Chemistry", "Physics", "Biology", "Earth science"))

g <- ggplot(df, aes(x = Subject, y = Average, fill = Subject)) + #color = Subject -> fill = Subject
        geom_bar(stat = "identity") +
        theme_classic() +
        geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.3) +
        scale_fill_manual(values = c("deepskyblue1", "royalblue", "violet", "tomato1", #scale_color_manual() -> scale_fill_manual()
                                      "springgreen1", "tan3")) +
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 15)) +
        guides(fill = F) #これを書かないと各fillの色がどの科目かを示す凡例が出てしまう．

plot(g)


g <- ggplot(df, aes(x = Subject, y = Average, fill = Subject)) + 
        geom_bar(stat = "identity") +
        theme_classic() +
        geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.3) + 
        scale_fill_manual(values = c("deepskyblue1", "royalblue", "violet", "tomato1", 
                                     "springgreen1", "tan3")) +
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 15)) +
        guides(fill = F) +
        ylim(c(0,100)) #これ！！！！！！！！！！！！！！！！！！！！

plot(g)


g <- ggplot(df, aes(x = Subject, y = Average, fill = Subject)) + 
        geom_bar(stat = "identity") +
        theme_classic() +
        geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.3) + 
        scale_fill_manual(values = c("deepskyblue1", "royalblue", "violet", "tomato1", 
                                     "springgreen1", "tan3")) +
        theme(panel.grid = element_blank()) +
        theme(axis.text = element_text(size = 12), axis.title = element_text(size = 15)) +
        theme(axis.title.x = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 15)) +
        guides(fill = F) +
        scale_y_continuous(breaks = seq(0,100,20), limits = c(0,100)) #これ！！！！！！！！！！！！

plot(g)


g <- ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
        geom_boxplot() +
        theme_classic() +
        theme(axis.title.x = element_blank(), axis.title.y = element_text(size = 15)) +
        theme(axis.text = element_text(size = 15)) +
        guides(fill = F) +
        ylab("Sepal width")
plot(g)


g <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
        geom_histogram(position = "identity", alpha = 0.8) + #alphaは色の透過度．0~1で設定．
        theme_classic() +
        theme(axis.title.y = element_text(size = 15), axis.title.x = element_text(size = 15)) +
        theme(axis.text = element_text(size = 15)) +
        xlab("Sepal width") +
        ylab("Count") +
        scale_y_continuous(breaks = seq(0,10,2), limits = c(0,10))
plot(g)


g <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
        geom_histogram(position = "identity", alpha = 0.8, bins = 10) + #bins = 10
        theme_classic() +
        theme(axis.title.y = element_text(size = 15), axis.title.x = element_text(size = 15)) +
        theme(axis.text = element_text(size = 15)) +
        xlab("Sepal width") +
        ylab("Count")
plot(g)


g <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
        geom_histogram(alpha = 0.8, color = "black") +
        theme_classic() +
        theme(axis.title.y = element_text(size = 15), axis.title.x = element_text(size = 15)) +
        theme(axis.text = element_text(size = 15)) +
        xlab("Sepal width") +
        ylab("Count")
plot(g)


g <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
        geom_density() + 
        facet_wrap(~Species, ncol = 1) +
        theme_classic() +
        theme(axis.title.y = element_text(size = 15), axis.title.x = element_text(size = 15)) +
        theme(axis.text = element_text(size = 15)) +
        xlab("Sepal width") +
        ylab("Density") +
        guides(fill = F) +
        theme(strip.background = element_blank(), strip.text = element_text(size = 15))
plot(g)


library(ggplot2)

data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data",
                 header = F)

attri <- c("ID", "Diagnosis", "Radius", "Texture", "Perimeter", "Area", "Smoothness",
           "Compactness", "Concavity", "Concave_points", "Symmetry", "Fractal_dimension")

ext_data <- data[,c(1, 2, seq(3, 30, 3))]

colnames(ext_data) <- attri

ext_data_mean <- data.frame(Diagnosis = c("B", "M"))
B <- which(ext_data$Diagnosis == "B")
M <- which(ext_data$Diagnosis == "M")

for(i in 3:12) ext_data_mean <- cbind(ext_data_mean, c(mean(ext_data[B,i]), mean(ext_data[M,i])))
colnames(ext_data_mean)[2:11] <- colnames(ext_data)[3:12]

for(i in 3:12){
  g <- ggplot(ext_data, aes(x = Diagnosis, y = ext_data[,i], fill = Diagnosis)) +
    geom_violin() +
    theme_classic() +
    theme(axis.title.x = element_blank(), axis.title.y = element_text(size = 15)) +
    theme(axis.text = element_text(size = 15)) +
    guides(fill = F) +
    scale_fill_manual(values = c("royalblue", "firebrick3")) +
    ylab(gsub(x = colnames(ext_data)[i], pattern = "_", replacement = " "))

  g <- g +
    geom_point(data = ext_data_mean, aes(x = Diagnosis, y = ext_data_mean[,i-1]), 
               fill = "white", size = 3, shape = 23)

  ggsave(plot = g, file = paste0("wdbc_plots/", colnames(ext_data)[i], ".png"), w = 6.2, h = 4.8, dpi = 600)
}

pdf("wdbc_plots.pdf", w = 6.2, h = 4.8) #PDFファイルを開く．
for(i in 3:12){
  g <- ggplot(ext_data, aes(x = Diagnosis, y = ext_data[,i], fill = Diagnosis)) +
    geom_violin() +
    theme_classic() +
    theme(axis.title.x = element_blank(), axis.title.y = element_text(size = 15)) +
    theme(axis.text = element_text(size = 15)) +
    guides(fill = F) +
    scale_fill_manual(values = c("royalblue", "firebrick3")) +
    ylab(gsub(x = colnames(ext_data)[i], pattern = "_", replacement = " "))

  g <- g +
    geom_point(data = ext_data_mean, aes(x = Diagnosis, y = ext_data_mean[,i-1]), 
               fill = "white", size = 3, shape = 23)

  plot(g) #開いたPDFファイル内にプロットしていく．
}
dev.off() #PDFファイルを閉じる．


data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data",
                 header = F)

attri <- c("ID", "Diagnosis", "Radius", "Texture", "Perimeter", "Area", "Smoothness",
           "Compactness", "Concavity", "Concave_points", "Symmetry", "Fractal_dimension")

ext_data <- data[,c(1, 2, seq(3, 30, 3))]

colnames(ext_data) <- attri

ext_data_mean <- tibble(Diagnosis = c("B", "M"))
B <- which(ext_data$Diagnosis == "B")
M <- which(ext_data$Diagnosis == "M")

for(i in 3:12) ext_data_mean <- cbind(ext_data_mean, c(mean(ext_data[B,i]), mean(ext_data[M,i])))
colnames(ext_data_mean)[2:11] <- colnames(ext_data)[3:12]

for(i in 3:11){
  for(j in (i+1):12){
    r <- round(cor(ext_data[,i],  ext_data[,j]), 2) #相関係数の計算
    g <- ggplot(ext_data, aes(x = ext_data[,i], y = ext_data[,j], color = Diagnosis)) +
      geom_point(alpha = 0.5) +
      theme_classic() +
      theme(axis.title.x = element_text(size = 15), axis.title.y = element_text(size = 15)) +
      theme(axis.text = element_text(size = 15)) +
      scale_color_manual(values = c("royalblue", "firebrick3")) +
      xlab(gsub(x = colnames(ext_data)[i], pattern = "_", replacement = " ")) +
      ylab(gsub(x = colnames(ext_data)[j], pattern = "_", replacement = " ")) +
      ggtitle(paste0("r = ", r)) + #相関係数を表示
      theme(plot.title = element_text(size = 15)) +
      guides(alpha = F)

    ggsave(plot = g, file = paste0("wdbc_plots_cor/", colnames(ext_data)[i], "_vs_", colnames(ext_data)[j], ".png"), 
           w = 6.2, h = 4.8, dpi = 600)
  }
}
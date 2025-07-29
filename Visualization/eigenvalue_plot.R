setwd('data')

n=2000
m=2
eps=n^(-1/(m+4))

# Load the data
record2000=read.csv2(paste0('Sphere_',n,'.csv'),header = F)

record2000=as.vector(record2000)
record2000=as.numeric(record2000$V1)
qqplot(record2000)



library("ggpubr")

# Density plot
df <- data.frame(
  eigen = record2000 / n / eps^(m + 2)
)

# plot
ggdensity(
  df$eigen,
  xlab   = "",
  ylab   = "",
  fill   = "lightgray",
  color  = "black",
  alpha  = 0.8,
  adjust = 1
) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text = element_text(size = 16)
  )

# QQ plot
df2 <- data.frame(
  scaled_record = (record2000 - mean(record2000)) / sd(record2000)
)

ggqqplot(
  df2,
  title  = "QQ Plot",
  xlab   = "Normal Quantile",
  ylab   = "Sample Quantile",
  color  = "darkblue",
  size   = 1,
  add    = "qqline",
  line   = list(color = "red", linetype = "dashed")
) +
  coord_cartesian(
    xlim = c(-3,  3),   # <-- set your x‐range here
    ylim = c(-5,  5)    # <-- set your y‐range here
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 22),
    axis.title = element_text(size = 22, margin = margin(t = 8, r = 8)),
    axis.text  = element_text(size = 16)
  )

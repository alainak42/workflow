library(tidyverse)

diamonds_plot <- ggplot(diamonds, aes(x = cut, y = price, fill = cut)) +
  geom_violin(alpha = 0.85, trim = FALSE, color = NA) +
  geom_boxplot(width = 0.12, outlier.shape = NA, fill = "white", alpha = 0.8) +
  scale_fill_viridis_d(option = "C", end = 0.85) +
  scale_y_log10(labels = scales::label_dollar()) +
  labs(
    title = "Diamond prices across cuts",
    subtitle = "Distributions shown on a logarithmic price scale",
    x = "Cut quality",
    y = "Price (USD)",
    fill = "Cut"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "none",
    panel.grid.minor = element_blank()
  )

ggsave("diamonds-2.png", plot = diamonds_plot, width = 9, height = 6, dpi = 300)

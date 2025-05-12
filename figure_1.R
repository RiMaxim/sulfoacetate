library(ggplot2)
library(ggExtra)
library(dplyr)

# Load data
data <- read.table("Desktop/sulfoacetate/input_file_for_figure1.tsv", header = FALSE, sep = "\t")

# Update category names (add counts)
data$V6 <- recode(data$V6,
                  "exclusively sponge-associated" = "exclusively sponge-associated (74)",
                  "mixed" = "mixed (53)",
                  "occasionally sponge-associated" = "occasionally sponge-associated (159)"
)

# Create plot
p <- ggplot(data, aes(x = V4, y = V5, color = V6)) +
  # Add horizontal reference lines behind points
  geom_hline(yintercept = 0.25, color = "gray", size = 1, alpha = 0.8) +
  geom_hline(yintercept = 0.75, color = "gray", size = 1, alpha = 0.8) +
  geom_point() +
  scale_color_manual(values = c(
    "exclusively sponge-associated (74)" = "#AA1803",
    "mixed (53)" = "#F1BBB9",
    "occasionally sponge-associated (159)" = "#6D8C00"
  )) +
  labs(
    title = "",
    x = "lg(Family size, genomes)",
    y = "Sponge score"
  ) +
  theme_minimal(base_size = 20) +
  theme(
    legend.position = "bottom",
    legend.text = element_text(size = 12),
    axis.title = element_text(size = 18),
    axis.text = element_text(size = 16)
  ) +
  guides(color = guide_legend(title = NULL))

# Add marginal histograms
p_with_marginals <- ggMarginal(p, type = "histogram", groupFill = T, groupColour = TRUE, size=5, alpha=0.6)

# Save plot as SVG
ggsave("Desktop/sulfoacetate/figure1.svg", plot = p_with_marginals, width = 8, height = 8, dpi = 600)
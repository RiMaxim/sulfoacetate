library(ggplot2)
library(dplyr)

# Create the data frame
data <- data.frame(
  Group = c("ANS", "HMA sponges", "LMA sponges"),
  Total = c(1500, 741, 109),
  With_cluster = c(26, 49, 21),
  Color = c("#839788", "#EEE0CB", "#BAA898")  # Colors for each group
)

# Add columns with percentages and labels
data <- data %>%
  mutate(Percentage = (With_cluster / Total) * 100,
         Label = paste(With_cluster, "/", Total))  # Label format

# Create the plot
p <- ggplot(data, aes(x = reorder(Group, -Percentage), y = Percentage, fill = Group)) +
  geom_col(aes(fill = Color), show.legend = FALSE) +  # Different colors for bars, no legend
  geom_text(aes(label = Label), 
            vjust = -0.5, size = 7) +  # Number of clusters above the bars
  scale_fill_identity() +  # Use defined colors without legend
  labs(x = "", y = "Proportion of genomes (%)") +  # Axis labels
  geom_segment(aes(x = 1, xend = 2, y = max(data$Percentage) + 1.5, yend = max(data$Percentage) + 1.5), size = 0.5) +  # Line between bar 1 and 2
  geom_segment(aes(x = 2, xend = 3, y = max(data$Percentage), yend = max(data$Percentage)), size = 0.5) +  # Line between bar 2 and 3
  geom_segment(aes(x = 1, xend = 3, y = max(data$Percentage) + 3, yend = max(data$Percentage) + 3), size = 0.47) +  # Line between bar 1 and 3
  geom_text(aes(x = 1.5, y = max(data$Percentage) + 2, label = "***"), size = 7) +  # Three asterisks between 1 and 2
  geom_text(aes(x = 2.5, y = max(data$Percentage) + 0.5, label = "****"), size = 7) +  # Four asterisks between 2 and 3
  geom_text(aes(x = 2, y = max(data$Percentage) + 3.5, label = "****"), size = 7) +  # Four asterisks between 1 and 3
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 20),  # Larger X-axis text
        axis.text.y = element_text(size = 20),  # Larger Y-axis text
        axis.title = element_text(size = 20),  # Larger axis titles
        panel.grid = element_blank(),  # Remove grid
        panel.border = element_blank(),  # Remove top and right borders
        axis.line.x = element_line(color = "black"),  # X-axis line
        axis.line.y = element_line(color = "black"))  # Y-axis line

# Save the plot as SVG
ggsave("Desktop/sulfoacetate/figure_2b.svg", plot = p, width = 8, height = 8, dpi = 600)


# Fisher's exact tests
fisher.test(matrix(c(21, 109, 49, 741), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(21, 109, 26, 1500), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(49, 741, 26, 1500), nrow = 2, byrow = TRUE))

################################Supplementary

library(ggplot2)
library(dplyr)

# Create the data frame
data <- data.frame(
  Group = c("SFNS", "NFNS", "HMA sponges", "LMA sponges", "ND sponges"),
  Total = c(656, 844, 741, 109, 90),
  With_cluster = c(19, 7, 49, 21, 4),
  Color = c("#58645b", "#aab19e", "#EEE0CB", "#BAA898", "#7a6e65")  # Colors for each group
)

# Add columns with percentages and labels
data <- data %>%
  mutate(Percentage = (With_cluster / Total) * 100,
         Label = paste(With_cluster, "/", Total))  # Label format

# Create the plot
p <- ggplot(data, aes(x = reorder(Group, -Percentage), y = Percentage, fill = Group)) +
  geom_col(aes(fill = Color), show.legend = FALSE) +  # Different colors for bars, no legend
  geom_text(aes(label = Label), 
            vjust = -0.5, size = 7) +  # Number of clusters above the bars
  scale_fill_identity() +  # Use defined colors without legend
  labs(x = "", y = "Proportion of genomes (%)") +  # Axis labels
  geom_segment(aes(x = 1, xend = 2, y = 22, yend = 22), size = 0.5) + 
  geom_segment(aes(x = 1, xend = 3, y = 23.5, yend = 23.5), size = 0.5) + 
  geom_segment(aes(x = 1, xend = 4, y = 25, yend = 25), size = 0.5) + 
  geom_segment(aes(x = 1, xend = 5, y = 26.5, yend = 26.5), size = 0.5) + 
  geom_segment(aes(x = 2, xend = 3, y = 10.5, yend = 10.5), size = 0.5) + 
  geom_segment(aes(x = 2, xend = 4, y = 12, yend = 12), size = 0.5) + 
  geom_segment(aes(x = 2, xend = 5, y = 13.5, yend = 13.5), size = 0.5) + 
  geom_segment(aes(x = 3, xend = 4, y = 7, yend = 7), size = 0.5) + 
  geom_segment(aes(x = 3, xend = 5, y = 8.5, yend = 8.5), size = 0.5) +
  geom_segment(aes(x = 4, xend = 5, y = 5, yend = 5), size = 0.5) +
  geom_text(aes(x = 1.5, y = 22.5, label = "***"), size = 7) + 
  geom_text(aes(x = 2, y = 24, label = "**"), size = 7) + 
  geom_text(aes(x = 2.5, y = 25.5, label = "****"), size = 7) + 
  geom_text(aes(x = 3.0, y = 27, label = "****"), size = 7) + 
  geom_text(aes(x = 2.5, y = 11.3, label = "ns"), size = 7) + 
  geom_text(aes(x = 3, y = 12.5, label = "**"), size = 7) + 
  geom_text(aes(x = 3.5, y = 14, label = "****"), size = 7) + 
  geom_text(aes(x = 3.5, y = 7.8, label = "ns"), size = 7) + 
  geom_text(aes(x = 4, y = 9, label = "*"), size = 7) + 
  geom_text(aes(x = 4.5, y = 5.5, label = "**"), size = 7) + 
  
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 20),  # Larger X-axis text
        axis.text.y = element_text(size = 20),  # Larger Y-axis text
        axis.title = element_text(size = 20),  # Larger axis titles
        panel.grid = element_blank(),  # Remove grid
        panel.border = element_blank(),  # Remove top and right borders
        axis.line.x = element_line(color = "black"),  # X-axis line
        axis.line.y = element_line(color = "black"))  # Y-axis line

# Save the plot as SVG
ggsave("Desktop/sulfoacetate/figure_2a.svg", plot = p, width = 10, height = 10, dpi = 600)

# Fisher's exact tests
fisher.test(matrix(c(21, 109, 49, 741), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(21, 109, 4, 90), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(21, 109, 19, 656), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(21, 109, 7, 844), nrow = 2, byrow = TRUE))

fisher.test(matrix(c(49, 741, 4, 90), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(49, 741, 19, 656), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(49, 741, 7, 844), nrow = 2, byrow = TRUE))

fisher.test(matrix(c(4, 90, 19, 656), nrow = 2, byrow = TRUE))
fisher.test(matrix(c(4, 90, 7, 844), nrow = 2, byrow = TRUE))

fisher.test(matrix(c(19, 656, 7, 844), nrow = 2, byrow = TRUE))
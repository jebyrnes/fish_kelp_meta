############
# Analyses and Figures of Effects of Trophic Level and 
# Body Size on Individual Adult Species from Experiments
############

#Load libraries and Data
library(metafor)
library(dplyr)
library(tibble)
library(glue)
library(broom)
library(broom.mixed)
library(ggplot2)
library(emmeans)
library(wesanderson)
theme_set(theme_classic(base_size = 20) )

source("scripts/open_all_data_for_analysis.R")

## Cleaning for analysis

singleSpAbund$Trophic.level<-as.character(singleSpAbund$Trophic.level)
singleSpAbund$Trophic.level<-gsub(",",".",singleSpAbund$Trophic.level)
singleSpAbund$Trophic.level<-as.numeric(singleSpAbund$Trophic.level)

singleSpAbund$Total.Lenght..cm.<-as.character(singleSpAbund$Total.Lenght..cm.)
singleSpAbund$Total.Lenght..cm.<-gsub(",",".",singleSpAbund$Total.Lenght..cm.)
singleSpAbund$Total.Lenght..cm.<-as.numeric(singleSpAbund$Total.Lenght..cm.)

## Model

model.trophic.exp <- rma.mv(
  Hedges.G ~ Trophic.level * Total.Lenght..cm.,
  VHedges.G,
  random = list( ~ 1 |
                   Authors..Year., ~ Authors..Year. | Fish.Species),
  struct = "HCS",
  rho = 0,
  data = singleSpAbund %>%
    filter(Type.of.Study..Experimental_ObservatioNAl. ==
             "Experimental") %>%
    filter(Juvenile..Adult..Both == "Adult"),
  control = list(optimizer = "optim")
)

summary(model.trophic.exp)
tidy(model.trophic.exp)

## Use the fit model to create predicted values to plot with
#Predicted Values for 'rma' Objects --> https://wviechtb.github.io/metafor/reference/predict.rma.html

pred <- expand.grid(Trophic.level = 2:4, length = seq(4,80, .1))
resp <- sapply(1:nrow(pred), function(i) {
  predict(model.trophic.exp, newmods=cbind(pred[i,1],pred[i,2],pred[i,1]*pred[i,2]),
          level=95)
})


pred$eff <- as.numeric(resp[1,])
pred$ci.lb <- as.numeric(resp[3,])
pred$ci.ub <- as.numeric(resp[4,])


pred <- pred %>%
  mutate (Trophic.group2 =
            as.factor(
              case_when(
                Trophic.level == "2" ~ "Herbivores",
                Trophic.level == "3" ~ "Mesopredators",
                Trophic.level == "4"  ~ "Top Predators"
              )
            ))

# Cleanup data for plotting
# Herbivores, Mesopredators, Top predators
singleSpAbund$Trophic.level2<- round(singleSpAbund$Trophic.level)



singleSpAbund <- singleSpAbund %>%
  mutate (Trophic.group2 = as.factor(
    case_when(
      Trophic.level2 == "2" ~ "Herbivores",
      Trophic.level2 ==
        "3" ~ "Mesopredators",
      Trophic.level2 ==
        "4"  ~ "Top Predators"
    )
  ))

# Figure 4
ggplot(singleSpAbund %>% 
         filter(Type.of.Study..Experimental_ObservatioNAl.=="Experimental") %>% 
         filter(Juvenile..Adult..Both =="Adult"),
       aes(x=Total.Lenght..cm., 
           y=Hedges.G, 
           color = Trophic.level)) + 
  geom_point(mapping=aes(size=1/VHedges.G)) +
  #geom_hline(yinterecept=0, lty=2, size=2) +
  geom_line(data=pred, 
            mapping=aes(x=length, y=eff, 
                        color=Trophic.level),
            size=2) + 
  geom_ribbon(data=pred, 
              mapping=aes(x=length, y=eff, ymax=ci.ub, ymin=ci.lb),
              alpha=0.3, color=NA)+
  facet_wrap(vars(Trophic.group2))+
  scale_color_gradientn(colors = wes_palette("Zissou1", 
                                             10, 
                                             type = "continuous")) +
  scale_size_continuous(range=c(3,8)) +
  labs(x = "Total Fish Length (cm)",
       y = "Hedge's G",
       size = "Precision",
       color = "Trophic Level")

ggsave("figures/Figure_4_fish_trophic_size_model.jpg",
       dpi = 300,
       width = 10)


# Trends for different trophic indices

pred_slopes <- expand.grid(Trophic.level = 2:4, 
                           length = seq(0,1))
slopes <- sapply(1:nrow(pred_slopes), function(i) {
  predict(model.trophic.exp, 
          newmods=cbind(pred_slopes[i,1],
                        pred_slopes[i,2],
                        pred_slopes[i,1]*pred_slopes[i,2]),
          level=95)
})

slopes <- slopes[1:4,]

pred_slopes$eff <- as.numeric(slopes[1,])
pred_slopes$ci.lb <- as.numeric(slopes[3,])
pred_slopes$ci.ub <- as.numeric(slopes[4,])


pred_slopes <- pred_slopes %>%
  mutate (Trophic.group2 =
            as.factor(
              case_when(
                Trophic.level == "2" ~ "Herbivores",
                Trophic.level == "3" ~ "Mesopredators",
                Trophic.level == "4"  ~ "Top Predators"
              )
            ))


# get slope estimate and estimate of the CIs using estimated predictions
# at 0 and 1
pred_slopes <- pred_slopes |>
  tidyr::pivot_wider(names_from = "length",
                     values_from = c("eff", "ci.lb", "ci.ub")) |>
  mutate(slope = eff_1 - eff_0,
         ci.lb = ci.lb_1 - ci.lb_0,
         ci.ub = ci.ub_1 - ci.ub_0
  ) |>
  select(Trophic.group2, slope, ci.lb, ci.ub)

pred_slopes

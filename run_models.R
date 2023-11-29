# Run GOM haddock models for SSRT 2024
library(wham)

asap3_base2 <- read_asap3_dat("GOM_HADDOCK_ASAP_2022_BASE2.dat")


input_base2 <- prepare_wham_input(asap3_base2, 
                                  selectivity = list(model = c(rep("age-specific", 3),
                                                               rep("age-specific", 2)),
                                                     re = c(rep("none", 3), 
                                                            rep("none", 2)),
                                                     initial_pars = list(c(0.01, 0.1, 0.3, 0.5, 0.8, 0.9, 1.0, 1.0, 1.0),
                                                                         c(0.01, 0.1, 0.3, 0.5, 0.8, 0.9, 1.0, 1.0, 1.0),
                                                                         c(0.01, 0.1, 0.3, 0.5, 0.8, 0.9, 1.0, 1.0, 1.0),
                                                                         c(0.2, 0.4, 0.8, rep(1.0, 6)), #<< start surveys
                                                                         c(0.1, 0.3, 0.5, 0.8, rep(1.0, 5))
                                                     ),
                                                     fix_pars = list(c(8:9), 
                                                                     c(8:9),  
                                                                     c(7:8), 
                                                                     c(4:9),  #<< start surveys
                                                                     c(5:9)
                                                     )
                                  ),
                                  recruit_model = 2, 
                                  model_name = "ASAP-like",
                                  NAA_re = NULL,#list(sigma="rec", cor = "iid", N1_model = 1),
                                  age_comp = list(fleets = rep("multinomial", 1), 
                                                  indices = rep("multinomial", 2)),
                                  basic_info = list(simulate_process_error = rep(FALSE, 5)))



input_base2$map$log_N1_pars <- as.factor(matrix(data=c(1,2,3,4,5,6,NA,NA,7),nrow=1,ncol=9))

input_re <-  prepare_wham_input(asap3_base2, 
                                selectivity = list(model = c(rep("age-specific", 3),
                                                             rep("age-specific", 2)),
                                                   re = c(rep("none", 3), 
                                                          rep("none", 2)),
                                                   initial_pars = list(c(0.01, 0.1, 0.3, 0.5, 0.8, 0.9, 1.0, 1.0, 1.0),
                                                                       c(0.01, 0.1, 0.3, 0.5, 0.8, 0.9, 1.0, 1.0, 1.0),
                                                                       c(0.01, 0.1, 0.3, 0.5, 0.8, 0.9, 1.0, 1.0, 1.0),
                                                                       c(0.2, 0.4, 0.8, rep(1.0, 6)), #<< start surveys
                                                                       c(0.1, 0.3, 0.5, 0.8, rep(1.0, 5))
                                                   ),
                                                   fix_pars = list(c(7:9), 
                                                                   c(7:9),  
                                                                   c(7:9), 
                                                                   c(4:9),  #<< start surveys
                                                                   c(5:9)
                                                   )
                                ),
                                recruit_model = 2, 
                                model_name = "RE multinomial",
                                NAA_re = list(sigma="rec+1", cor = "2dar1"),
                                age_comp = list(fleets = rep("multinomial", 1), 
                                                indices = rep("multinomial", 2)),
                                basic_info = list(simulate_process_error = rep(FALSE, 5)))

input_re$map$log_N1_pars <- as.factor(matrix(data=c(1,2,3,4,5,6,NA,NA,7),nrow=1,ncol=9))


input_di <-  prepare_wham_input(asap3_base2, 
                                selectivity = list(model = c(rep("age-specific", 3),
                                                             rep("age-specific", 2)),
                                                   re = c(rep("none", 3), 
                                                          rep("none", 2)),
                                                   initial_pars = list(c(0.01, 0.1, 0.3, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0),
                                                                       c(0.01, 0.1, 0.3, 0.5, 0.8, 1.0, 1.0, 1.0, 1.0),
                                                                       c(0.01, 0.1, 0.3, 0.5, 0.8, 1.0, 1.0, 1.0, 1.0),
                                                                       c(0.2, 0.4, 0.8, rep(1.0, 6)), #<< start surveys
                                                                       c(0.1, 0.3, 0.5, 0.8, rep(1.0, 5))
                                                   ),
                                                   fix_pars = list(c(5:8), 
                                                                   c(6:7),  
                                                                   c(6:9), 
                                                                   c(4:9),  #<< start surveys
                                                                   c(5:9)
                                                   )
                                ),
                                recruit_model = 2, 
                                model_name = "RE dirichlet",
                                NAA_re = list(sigma="rec+1", cor = "2dar1"),
                                age_comp = list(fleets = rep("dirichlet-miss0", 1), 
                                                indices = rep("dirichlet-miss0", 2)),
                                basic_info = list(simulate_process_error = rep(FALSE, 5),
                                                  XSPR_R_avg_yrs = 1:43,
                                                  XSPR_input_average_years = 41:45
                                ))

input_di$map$log_N1_pars <- as.factor(matrix(data=c(1,2,3,4,5,6,NA,NA,7),nrow=1,ncol=9))

input_ln <-  prepare_wham_input(asap3_base2, 
                                selectivity = list(model = c(rep("age-specific", 3),
                                                             rep("age-specific", 2)),
                                                   re = c(rep("none", 3), 
                                                          rep("none", 2)),
                                                   initial_pars = list(c(0.01, 0.1, 0.3, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0),
                                                                       c(0.01, 0.1, 0.3, 0.5, 0.8, 1.0, 1.0, 1.0, 1.0),
                                                                       c(0.01, 0.1, 0.3, 0.5, 0.8, 1.0, 1.0, 1.0, 1.0),
                                                                       c(0.2, 0.4, 0.8, rep(1.0, 6)), #<< start surveys
                                                                       c(0.1, 0.3, 0.5, 0.8, rep(1.0, 5))
                                                   ),
                                                   fix_pars = list(c(4:8), 
                                                                   c(6:7,9),  
                                                                   c(9), 
                                                                   c(4:9),  #<< start surveys
                                                                   c(5:9)
                                                   )
                                ),
                                recruit_model = 2, 
                                model_name = "RE ln",
                                NAA_re = list(sigma="rec+1", cor = "2dar1"),
                                age_comp = list(fleets = rep("logistic-normal-miss0", 1), 
                                                indices = rep("logistic-normal-miss0", 2)),
                                basic_info = list(simulate_process_error = rep(FALSE, 5)))

input_ln$map$log_N1_pars <- as.factor(matrix(data=c(1,2,3,4,5,6,NA,NA,7),nrow=1,ncol=9))


mbase <- fit_wham(input_base2, do.osa = T, do.retro = T)
mre   <- fit_wham(input_re,    do.osa = T, do.retro = T)
mdi   <- fit_wham(input_di,    do.osa = T, do.retro = T)
mln   <- fit_wham(input_ln,    do.osa = T, do.retro = T)


plot_wham_output(mod = mbase, out.type = 'png', dir.main = "./mbase")
plot_wham_output(mod = mre,   out.type = 'png', dir.main = "./mre")
plot_wham_output(mod = mdi,   out.type = 'png', dir.main = "./mdi")
plot_wham_output(mod = mln,   out.type = 'png', dir.main = "./mln")



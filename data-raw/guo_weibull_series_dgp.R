generate_guo_weibull_table_2_data <- function(n, p, tau = Inf) {
    theta <- guo_weibull_series_mle$mle
    shape <- theta[seq(1, length(theta), 2)]
    scale <- theta[seq(2, length(theta), 2)]
    m <- length(shape)
    comp_times <- matrix(nrow = n, ncol = m)

    for (j in 1:m)
        comp_times[,j] <- rweibull(
            n = n,
            shape = shape[j],
            scale = scale[j])
    comp_times <- md_encode_matrix(comp_times, "t")

    comp_times %>%
        md_series_lifetime_right_censoring(tau) %>%
        md_bernoulli_cand_C1_C2_C3(p) %>%
        md_cand_sampler()
}

p.hat <- .215
n <- 30

guo_weibull_series_dgp_1 <- generate_guo_weibull_table_2_data(
    n = n, p = p.hat)
ll <- md_loglike_weibull_series_C1_C2_C3(
    guo_weibull_series_dgp_1,
    deltavar = NULL)
ll_ref <- md_loglike_weibull_series_C1_C2_C3(
    guo_weibull_series_md, deltavar = NULL)
res <- optim(par = guo_weibull_series_mle$mle,
             fn = ll,
             hessian = TRUE,
             control = list(
                fnscale = -1,
                maxit = 1000L,
                parscale = c(1,1000,1,1000,1,1000)))
res$par - theta
ll_ref(res$par) - ll_ref(theta)
res$value - guo_weibull_series_mle$loglike
res$par
theta
confint(mle_numerical(res))

theta <- guo_weibull_series_mle$mle
data <- md_boolean_matrix_to_charsets(guo_weibull_series_dgp_1, drop_set = TRUE)
data$delta <- NULL
print(data, drop_latent = TRUE)

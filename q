ks.test                 package:stats                  R Documentation

_K_o_l_m_o_g_o_r_o_v-_S_m_i_r_n_o_v _T_e_s_t_s

_D_e_s_c_r_i_p_t_i_o_n:

     Perform a one- or two-sample Kolmogorov-Smirnov test.

_U_s_a_g_e:

     ks.test(x, y, ...,
             alternative = c("two.sided", "less", "greater"),
             exact = NULL)
     
_A_r_g_u_m_e_n_t_s:

       x: a numeric vector of data values.

       y: either a numeric vector of data values, or a character string
          naming a cumulative distribution function or an actual
          cumulative distribution function such as ‘pnorm’.  Only
          continuous CDFs are valid.

     ...: parameters of the distribution specified (as a character
          string) by ‘y’.

alternative: indicates the alternative hypothesis and must be one of
          ‘"two.sided"’ (default), ‘"less"’, or ‘"greater"’.  You can
          specify just the initial letter of the value, but the
          argument name must be give in full.  See ‘Details’ for the
          meanings of the possible values.

   exact: ‘NULL’ or a logical indicating whether an exact p-value
          should be computed.  See ‘Details’ for the meaning of ‘NULL’.
          Not available in the two-sample case for a one-sided test or
          if ties are present.

_D_e_t_a_i_l_s:

     If ‘y’ is numeric, a two-sample test of the null hypothesis that
     ‘x’ and ‘y’ were drawn from the same _continuous_ distribution is
     performed.

     Alternatively, ‘y’ can be a character string naming a continuous
     (cumulative) distribution function, or such a function.  In this
     case, a one-sample test is carried out of the null that the
     distribution function which generated ‘x’ is distribution ‘y’ with
     parameters specified by ‘...’.

     The presence of ties always generates a warning, since continuous
     distributions do not generate them.  If the ties arose from
     rounding the tests may be approximately valid, but even modest
     amounts of rounding can have a significant effect on the
     calculated statistic.

     Missing values are silently omitted from ‘x’ and (in the
     two-sample case) ‘y’.

     The possible values ‘"two.sided"’, ‘"less"’ and ‘"greater"’ of
     ‘alternative’ specify the null hypothesis that the true
     distribution function of ‘x’ is equal to, not less than or not
     greater than the hypothesized distribution function (one-sample
     case) or the distribution function of ‘y’ (two-sample case),
     respectively.  This is a comparison of cumulative distribution
     functions, and the test statistic is the maximum difference in
     value, with the statistic in the ‘"greater"’ alternative being D^+
     = max[F_x(u) - F_y(u)].  Thus in the two-sample case ‘alternative
     = "greater"’ includes distributions for which ‘x’ is
     stochastically _smaller_ than ‘y’ (the CDF of ‘x’ lies above and
     hence to the left of that for ‘y’), in contrast to ‘t.test’ or
     ‘wilcox.test’.

     Exact p-values are not available for the two-sample case if
     one-sided or in the presence of ties.  If ‘exact = NULL’ (the
     default), an exact p-value is computed if the sample size is less
     than 100 in the one-sample case _and there are no ties_, and if
     the product of the sample sizes is less than 10000 in the
     two-sample case.  Otherwise, asymptotic distributions are used
     whose approximations may be inaccurate in small samples.  In the
     one-sample two-sided case, exact p-values are obtained as
     described in Marsaglia, Tsang & Wang (2003) (but not using the
     optional approximation in the right tail, so this can be slow for
     small p-values).  The formula of Birnbaum & Tingey (1951) is used
     for the one-sample one-sided case.

     If a single-sample test is used, the parameters specified in ‘...’
     must be pre-specified and not estimated from the data.  There is
     some more refined distribution theory for the KS test with
     estimated parameters (see Durbin, 1973), but that is not
     implemented in ‘ks.test’.

_V_a_l_u_e:

     A list with class ‘"htest"’ containing the following components:

statistic: the value of the test statistic.

 p.value: the p-value of the test.

alternative: a character string describing the alternative hypothesis.

  method: a character string indicating what type of test was
          performed.

data.name: a character string giving the name(s) of the data.

_S_o_u_r_c_e:

     The two-sided one-sample distribution comes _via_ Marsaglia, Tsang
     and Wang (2003).

_R_e_f_e_r_e_n_c_e_s:

     Z. W. Birnbaum and Fred H. Tingey (1951), One-sided confidence
     contours for probability distribution functions.  _The Annals of
     Mathematical Statistics_, *22*/4, 592-596.

     William J. Conover (1971), _Practical Nonparametric Statistics_.
     New York: John Wiley & Sons.  Pages 295-301 (one-sample Kolmogorov
     test), 309-314 (two-sample Smirnov test).

     Durbin, J. (1973), _Distribution theory for tests based on the
     sample distribution function_.  SIAM.

     George Marsaglia, Wai Wan Tsang and Jingbo Wang (2003), Evaluating
     Kolmogorov's distribution.  _Journal of Statistical Software_,
     *8*/18.  <URL: http://www.jstatsoft.org/v08/i18/>.

_S_e_e _A_l_s_o:

     ‘shapiro.test’ which performs the Shapiro-Wilk test for normality.

_E_x_a_m_p_l_e_s:

     require(graphics)
     
     x <- rnorm(50)
     y <- runif(30)
     # Do x and y come from the same distribution?
     ks.test(x, y)
     # Does x come from a shifted gamma distribution with shape 3 and rate 2?
     ks.test(x+2, "pgamma", 3, 2) # two-sided, exact
     ks.test(x+2, "pgamma", 3, 2, exact = FALSE)
     ks.test(x+2, "pgamma", 3, 2, alternative = "gr")
     
     # test if x is stochastically larger than x2
     x2 <- rnorm(50, -1)
     plot(ecdf(x), xlim = range(c(x, x2)))
     plot(ecdf(x2), add = TRUE, lty = "dashed")
     t.test(x, x2, alternative = "g")
     wilcox.test(x, x2, alternative = "g")
     ks.test(x, x2, alternative = "l")
     


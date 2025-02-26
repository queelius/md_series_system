% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/md_candidate_set_models.R
\name{md_bernoulli_cand_C1_C2_C3}
\alias{md_bernoulli_cand_C1_C2_C3}
\title{md_bernoulli_cand_C1_C2_C3}
\usage{
md_bernoulli_cand_C1_C2_C3(
  md,
  p,
  compvar = "t",
  qvar = "q",
  deltavar = "delta"
)
}
\arguments{
\item{md}{masked data.}

\item{p}{a vector of probabilities}

\item{compvar}{column name of the component lifetime variables, defaults to
\code{t}, e.g., \verb{t1, t2, ..., tm}.}

\item{qvar}{column prefix for component probabilities, defaults to \code{q},
e.g., \verb{q1, q2, ..., qm}.}

\item{deltavar}{column name of the right-censoring indicator variable,
defaults to \code{delta}.}
}
\description{
Bernoulli candidate set model is a particular type of \emph{uninformed} model.
Note that we do not generate candidate sets with this function. See
\code{md_cand_sampler} for that.
}
\details{
This model satisfies conditions C1, C2, and C3.
The failed component will be in the corresponding candidate set with
probability 1, and the remaining components will be in the candidate set
with probability \code{p}.
}

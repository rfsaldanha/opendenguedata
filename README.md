# opendenguedata

<!-- badges: start -->
[![R-CMD-check](https://github.com/rfsaldanha/opendenguedata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rfsaldanha/opendenguedata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

R package to download data from the [OpenDengue project](https://opendengue.org) repository.

It is possible to download data from the project, using cached or updated versions and select columns to subset prior reading data to memory.

## Installation

```{r}
# install.packages("remotes")
remotes::install_github("rfsaldanha/opendenguedata")
```

## Examples

Read data from temporal extract.

```{r}
res <- opendenguedata::read_data(extract = "temporal", as_data_frame = TRUE)

dplyr::glimpse(res)
```

Read data from spatial extract and return only selected columns.

```{r}
res <- opendenguedata::read_data(extract = "spatial", as_data_frame = TRUE, 
                 columns = c("full_name", "calendar_start_date", "calendar_end_date", "dengue_total"))

dplyr::glimpse(res)
```

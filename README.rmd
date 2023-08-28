# opendenguedata

R package to download from the [OpenDengue project](https://opendengue.org) repository.

It is possible to download data from the project, using cached or updated versions and select columns to subset prior reading data to memory.

## Examples

Read data from temporal extract.

```{r}
res <- read_data(extract = "temporal", as_data_frame = TRUE)

dplyr::glimpse(res)
```

Read data from spatial extract and return only selected columns.

```{r}
res <- read_data(extract = "spatial", as_data_frame = TRUE, 
                 columns = c("full_name", "calendar_start_date", "calendar_end_date", "dengue_total"))

dplyr::glimpse(res)
```

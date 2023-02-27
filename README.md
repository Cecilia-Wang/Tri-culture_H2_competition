# Mechanism of H2 metabolism wihtin mixed cultures.

This depository provide relevant raw data, scripts for data analyses in the paper. 

System information of which the workflow carried out is provided as the following:

## System information

### Operating system
All analyses were proceeded with macOS version 12.6, Apple M1 pro chip, 32GB memory

### R environment
R version 4.2.1 (2022-06-23)
Platform: aarch64-apple-darwin20 (64-bit)
Running under: macOS Monterey 12.6

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.2-arm64/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats4    stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] patchwork_1.1.2             RColorBrewer_1.1-3          viridis_0.6.2              
 [4] viridisLite_0.4.1           DESeq2_1.37.6               SummarizedExperiment_1.27.3
 [7] Biobase_2.57.1              MatrixGenerics_1.9.1        matrixStats_0.62.0         
[10] GenomicRanges_1.49.1        GenomeInfoDb_1.33.15        IRanges_2.31.2             
[13] S4Vectors_0.35.4            BiocGenerics_0.43.4         ggpubr_0.4.0               
[16] ggrepel_0.9.1               data.table_1.14.4           forcats_0.5.2              
[19] stringr_1.4.1               dplyr_1.0.10                purrr_0.3.5                
[22] readr_2.1.3                 tidyr_1.2.1                 tibble_3.1.8               
[25] ggplot2_3.4.0               tidyverse_1.3.2            

loaded via a namespace (and not attached):
 [1] googledrive_2.0.0      colorspace_2.0-3       ggsignif_0.6.4        
 [4] ellipsis_0.3.2         rsconnect_0.8.28       XVector_0.37.1        
 [7] fs_1.5.2               rstudioapi_0.14        farver_2.1.1          
[10] bit64_4.0.5            AnnotationDbi_1.59.1   fansi_1.0.3           
[13] lubridate_1.8.0        xml2_1.3.3             splines_4.2.1         
[16] codetools_0.2-18       cachem_1.0.6           geneplotter_1.75.0    
[19] knitr_1.40             jsonlite_1.8.3         broom_1.0.1           
[22] annotate_1.75.0        dbplyr_2.2.1           png_0.1-7             
[25] compiler_4.2.1         httr_1.4.4             backports_1.4.1       
[28] assertthat_0.2.1       Matrix_1.5-1           fastmap_1.1.0         
[31] gargle_1.2.1           cli_3.4.1              htmltools_0.5.3       
[34] tools_4.2.1            gtable_0.3.1           glue_1.6.2            
[37] GenomeInfoDbData_1.2.9 Rcpp_1.0.9             carData_3.0-5         
[40] cellranger_1.1.0       vctrs_0.5.0            Biostrings_2.65.6     
[43] xfun_0.34              rvest_1.0.3            lifecycle_1.0.3       
[46] rstatix_0.7.1          XML_3.99-0.12          googlesheets4_1.0.1   
[49] zlibbioc_1.43.0        scales_1.2.1           ragg_1.2.4            
[52] hms_1.1.2              parallel_4.2.1         yaml_2.3.6            
[55] gridExtra_2.3          memoise_2.0.1          stringi_1.7.8         
[58] RSQLite_2.2.18         genefilter_1.79.0      BiocParallel_1.31.14  
[61] systemfonts_1.0.4      rlang_1.0.6            pkgconfig_2.0.3       
[64] bitops_1.0-7           evaluate_0.18          lattice_0.20-45       
[67] labeling_0.4.2         cowplot_1.1.1          bit_4.0.4             
[70] tidyselect_1.2.0       magrittr_2.0.3         R6_2.5.1              
[73] generics_0.1.3         DelayedArray_0.23.2    DBI_1.1.3             
[76] pillar_1.8.1           haven_2.5.1            withr_2.5.0           
[79] survival_3.4-0         KEGGREST_1.37.3        abind_1.4-5           
[82] RCurl_1.98-1.9         modelr_0.1.9           crayon_1.5.2          
[85] car_3.1-1              utf8_1.2.2             tzdb_0.3.0            
[88] rmarkdown_2.18         locfit_1.5-9.6         grid_4.2.1            
[91] readxl_1.4.1           blob_1.2.3             reprex_2.0.2          
[94] digest_0.6.30          xtable_1.8-4           textshaping_0.3.6     
[97] munsell_0.5.0         

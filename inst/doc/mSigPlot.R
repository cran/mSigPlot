## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 10,
  fig.height = 4,
  out.width = "100%"
)

## ----setup--------------------------------------------------------------------
library(mSigPlot)

## ----sbs96--------------------------------------------------------------------
sbs96_file <- system.file("extdata", "sbs96_example.csv", package = "mSigPlot")
sbs96_df <- read.csv(sbs96_file)
catalog_sbs96 <- data.frame(
  sample1 = sbs96_df[, 3],
  row.names = catalog_row_order()$SBS96
)
plot_SBS96(catalog_sbs96, plot_title = "HepG2 sample -- SBS96")

## ----sbs96-example3-----------------------------------------------------------
plot_SBS96(sample(sbs96_df[ ,3, drop = TRUE], replace = FALSE), 
  plot_title = "HepG2 sample, mixed up row order -- SBS96")

## ----sbs96-grid-title-outside-------------------------------------------------
plot_SBS96(catalog_sbs96,
           plot_title = "HepG2 -- SBS96 (grid + external title)",
           grid = TRUE,
           title_outside_plot = TRUE)

## ----id83---------------------------------------------------------------------
id83_file <- system.file("extdata", "id83_cosmic_v3.5.tsv", package = "mSigPlot")
id83_sigs <- read.table(id83_file, header = TRUE, sep = "\t",
                        row.names = 1, check.names = FALSE)
plot_ID83(id83_sigs[, "ID1", drop = FALSE], plot_title = "COSMIC ID1 signature")

## ----id89---------------------------------------------------------------------
id89_file <- system.file("extdata", "type89_liu_et_al_sigs.tsv",
                         package = "mSigPlot")
id89_sigs <- read.table(id89_file, header = TRUE, sep = "\t",
                        row.names = 1, check.names = FALSE)
plot_ID89(id89_sigs[, 1, drop = FALSE], plot_title = "ID89 signature")

## ----id89-peak-labels---------------------------------------------------------
plot_ID89(id89_sigs[, 1, drop = FALSE], plot_title = "ID89 signature",
          num_peak_labels = 5)

## ----id476, fig.height = 5----------------------------------------------------
id476_file <- system.file("extdata", "type476_liu_et_al_sigs.tsv",
                          package = "mSigPlot")
id476_sigs <- read.table(id476_file, header = TRUE, sep = "\t",
                         row.names = 1, check.names = FALSE)
plot_ID476(id476_sigs[, 1, drop = FALSE], plot_title = "ID476 signature")

## ----id476-right, fig.height = 5----------------------------------------------
plot_ID476_right(id476_sigs[, 1, drop = FALSE],
                 plot_title = "ID476 right panel")

## ----dbs78--------------------------------------------------------------------
dbs78_file <- system.file("extdata", "dbs78_example.csv", package = "mSigPlot")
dbs78_df <- read.csv(dbs78_file)
catalog_dbs78 <- data.frame(
  sample1 = dbs78_df[, 3],
  row.names = paste0(dbs78_df$Ref, dbs78_df$Var)
)
plot_DBS78(catalog_dbs78, plot_title = "HepG2 sample -- DBS78")

## ----sbs192-------------------------------------------------------------------
sbs192_file <- system.file("extdata", "regress.cat.sbs.192.csv",
                           package = "mSigPlot")
sbs192_df <- read.csv(sbs192_file)
catalog_sbs192 <- data.frame(
  sample1 = sbs192_df[, 4],
  row.names = catalog_row_order()$SBS192
)
plot_SBS192(catalog_sbs192, plot_title = "HepG2 -- SBS192")

## ----dbs144-------------------------------------------------------------------
dbs144_file <- system.file("extdata", "regress.cat.dbs.144.csv",
                           package = "mSigPlot")
dbs144_df <- read.csv(dbs144_file)
catalog_dbs144 <- data.frame(
  sample1 = dbs144_df[, 3],
  row.names = paste0(dbs144_df$Ref, dbs144_df$Var)
)
plot_DBS144(catalog_dbs144, plot_title = "HepG2 -- DBS144")

## ----dbs136, fig.height = 6---------------------------------------------------
dbs136_file <- system.file("extdata", "regress.cat.dbs.136.csv",
                           package = "mSigPlot")
dbs136_df <- read.csv(dbs136_file, row.names = 1)
plot_DBS136(dbs136_df[, 1, drop = FALSE], plot_title = "HepG2 -- DBS136")

## ----sbs1536, fig.height = 6--------------------------------------------------
sbs1536_file <- system.file("extdata", "regress.cat.sbs.1536.csv",
                            package = "mSigPlot")
sbs1536_df <- read.csv(sbs1536_file)
catalog_sbs1536 <- data.frame(
  sample1 = sbs1536_df[, 3],
  row.names = catalog_row_order()$SBS1536
)
plot_SBS1536(catalog_sbs1536, plot_title = "HepG2 -- SBS1536")

## ----sbs288, fig.height = 8---------------------------------------------------
sbs288_file <- system.file("extdata", "SBS288_De-Novo_Signatures.txt",
                           package = "mSigPlot")
sbs288_df <- read.table(sbs288_file, header = TRUE, sep = "\t",
                        row.names = 1, check.names = FALSE)
plot_SBS288(sbs288_df[, 1, drop = FALSE], plot_title = "SBS288A")

## ----id166--------------------------------------------------------------------
set.seed(42)
sig_id166 <- runif(166)
sig_id166 <- sig_id166 / sum(sig_id166)
names(sig_id166) <- catalog_row_order()$ID166
plot_ID166(sig_id166, plot_title = "Simulated ID166 signature")

## ----sbs12--------------------------------------------------------------------
plot_SBS12(catalog_sbs192, plot_title = "HepG2 -- SBS12 strand bias")

## ----plot-guess---------------------------------------------------------------
plot_guess(catalog_sbs96, plot_title = "Auto-detected SBS96")

## ----pdf-export, eval = FALSE-------------------------------------------------
# sbs96_mat <- as.matrix(sbs96_df[, 3:6])
# rownames(sbs96_mat) <- catalog_row_order()$SBS96
# colnames(sbs96_mat) <- paste0("Sample_", 1:4)
# 
# plot_guess_pdf(sbs96_mat, file.path(tempdir(), "sbs96_samples.pdf"))


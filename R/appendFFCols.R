#' This function is a slightly adjusted copy of the fr_append_cols
#' function in flowCore. It mainly allows for the presence of additional
#' pData variables
#' @importFrom flowCore pData exprs parameters

appendFFCols <- function(focusFrame, newCols){
    pd <- flowCore::pData(flowCore::parameters(focusFrame))
    cn <- colnames(newCols)
    new_pid <- max(as.integer(gsub("\\$P", "", rownames(pd)))) +
        1
    new_pid <- seq(new_pid, length.out = ncol(newCols))
    new_pid <- paste0("$P", new_pid)

    new_pd <- do.call(rbind, lapply(cn, function(i) {
        vec <- newCols[, i]
        rg <- range(vec)
        new_pd <- pd[1,]
        new_pd[1,] <- NA
        new_pd$name <- i
        new_pd$range <- diff(rg) + 1
        new_pd$minRange <- rg[1]
        new_pd$maxRange <- rg[2]
        return(new_pd)
    }))
    rownames(new_pd) <- new_pid
    pd <- rbind(pd, new_pd)
    focusFrame@exprs <- cbind(exprs(focusFrame), newCols)
    flowCore::pData(flowCore::parameters(focusFrame)) <- pd
    focusFrame
}


showscale <- function(psname) {
    ps <- c("/str 50 string def",
            "/showscale {",
            "  matrix currentmatrix aload pop pop pop",
            "  dup mul exch dup mul add sqrt 3 1 roll",
            "  dup mul exch dup mul add sqrt",
            "  (xscale=) print dup str cvs print",
            "  (, yscale=) print exch dup str cvs print",    
            "} def",
            "/stroke {",
            "  showscale",
            "} def",
            paste0("(", psname, ") run"))
    psfile <- tempfile()
    writeLines(ps, psfile)
    cat(system(paste0("gs -dNOPAUSE -dBATCH -q ",
                      "-sDEVICE=ps2write -sOutputFile=tmp.ps ",
                      psfile), intern=TRUE), "\n")
}

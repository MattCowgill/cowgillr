cowgill_edit_makevars <- function() {
  ask <- ask_yes_no("Update Makevars?")
  if (ask) {
    make_text <- c("HOMEBREW_LOC=/opt/homebrew",
                   "LLVM_LOC=$(HOMEBREW_LOC)/opt/llvm",
                   "CC=$(LLVM_LOC)/bin/clang -fopenmp",
                   "CXX=$(LLVM_LOC)/bin/clang++ -fopenmp",
                   "CFLAGS=-g -O3 -Wall -pedantic -std=gnu99 -mtune=native -pipe",
                   "CXXFLAGS=-g -O3 -Wall -pedantic -std=c++11 -mtune=native -pipe",
                   "LDFLAGS=-L$(HOMEBREW_LOC)/opt/gettext/lib -L$(LLVM_LOC)/lib -Wl,-rpath,$(LLVM_LOC)/lib",
                   "CPPFLAGS=-I$(HOMEBREW_LOC)/opt/gettext/include -I$(LLVM_LOC)/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include")

    make_loc <- fs::path(fs::path_home_r(), ".R", "Makevars")

    proceed <- TRUE

    if (fs::file_exists(make_loc)) {
      proceed <- ask_yes_no("Makevars already exists. Overwite it?")
    }

    if (proceed) {
      cat(make_text, sep = "\n", file = make_loc)
    }
  }

  if (!proceed) {
    stop("Makevars not edited")
  } else {
    message(paste0(
      '-Install gfortran: https://github.com/fxcoudert/gfortran-for-macOS\n',
      '-Restart R\n',
      '-Install data.table: install.packages("data.table", type = "source")')
      )

  }

}

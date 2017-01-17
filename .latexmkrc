# LaTeXmk configuration file

# Usage example
# latexmk file.tex

# Main command line options
# -pv  : run file previewer
# -pvc : run file previewer and continually recompile on change
# -C   : clean up by removing all regeneratable files

# Base configuration
$pdflatex = 'pdflatex --shell-escapte %O %S';
$pdf_previewer = 'open';
$pdf_mode = 1;
$bibtex_use = 1;
$out_dir = 'bin';

# Enable glossaries
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';

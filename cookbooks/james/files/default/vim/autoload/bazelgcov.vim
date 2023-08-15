" Custom vim-coverage provider that parses lcov coverage report more quickly.

let g:bazelgcov_path = 'bazel-out/_coverage/_coverage_report.dat'

let s:vimhome=expand('<sfile>:p:h:h')
let g:bazelgcov_parse_script = s:vimhome . '/scripts/parse_coverage.awk'

function! bazelgcov#IsAvailable(unused_filename)
  return filereadable(g:bazelgcov_path) && filereadable(g:bazelgcov_parse_script)
endfunction

function! bazelgcov#GetCoverage(filename)
  let l:output = system('awk -vfilename="' . a:filename . '" -f ' . g:bazelgcov_parse_script . ' ' . g:bazelgcov_path)
  let l:splits = split(l:output, "\n")
  let l:covered = split(l:splits[0], ",")
  let l:uncovered = split(l:splits[1], ",")
  return coverage#CreateReport(l:covered, l:uncovered, [])
endfunction

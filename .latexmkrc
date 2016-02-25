#!/usr/bin/perl
$latex = 'platex -interaction=nonstopmode -halt-on-error -kanji=utf-8 %S';
$dvipdf = 'dvipdfmx %S';
$bibtex = 'pbibtex -kanji=utf8';
$pdf_mode = 3; # use dvipdf
$pdf_update_method = 2;
$pdf_previewer = "start mupdf %O %S";
$max_repeat       = 5;
# Prevent latexmk from removing PDF after typeset.
$pvc_view_file_via_temporary = 0;

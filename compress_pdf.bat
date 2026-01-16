rem Ref1: https://blog.csdn.net/finghting321/article/details/105244088
rem Ref2: https://juejin.cn/post/6951297944398069773
@echo off
set "GS=gswin64c.exe"
set "OUTPUT_DIR=.\CompressedPDF"
rem Execute program

if not exist %OUTPUT_DIR% (
    echo %OUTPUT_DIR% do not exists.
    mkdir %OUTPUT_DIR%
)
for %%f in (*.pdf) do (
    echo Compressing PDF: %%f
    "%GS%" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%OUTPUT_DIR%\%%f" "%%f"
    if exist "%OUTPUT_DIR%\%%f" (
        echo Successed: %%f
    ) else (
        echo Failed: %%f
    )
)

echo Compressed PDFs have been saved into: %OUTPUT_DIR%

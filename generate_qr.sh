#!/bin/bash
# take links in a file and generate qr codes

lines=$(cat links.csv | wc -l)

"Links to QR Codes" > qr_code.tex

for line in {1..$lines}
  do
    links=( $( sed 's/,//g;'"$line"'q;d' links.csv ) )
    qrencode -o qr_codes/${links[1]}.png --level=M '${links[2]}'
    '\begin{wrapfigure}{r}{0.5\textwidth}
       \begin{center}
         \includegraphics[width=0.2\textwidth]{qr_codes/'"${links[1]}"'.png}
       \end{center}
     \end{wrapfigure}' >> qr_code.tex
  done

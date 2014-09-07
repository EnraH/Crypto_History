#!/bin/bash
# take links in a file and generate qr codes

lines=$(cat links.csv | wc -l)

echo 'Links to QR Codes' > qr_code.tex

for line in $(seq 1 $lines)
  do
    echo $line
    links=( $( sed 's/,//g;'"$line"'q;d' links.csv ) )
    echo ${links[1]}
    echo ${links[0]}
    qrencode -o qr_codes/"${links[0]}".png --level=M --margin=0 "${links[1]}"
    echo '% Embed QR Code for '"${links[0]}"'
\begin{wrapfigure}{l}{0.1\textwidth}
  \vspace{-20pt}
    \includegraphics[width=0.1\textwidth]{qr_codes/'"${links[0]}"'.png}
  \vspace{-20pt}
\end{wrapfigure}' >> qr_code.tex
  done

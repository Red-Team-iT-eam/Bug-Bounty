#!/bin/bash

sudo cp NucleiFuzzer.sh /usr/bin/nf && sudo chmod +x /usr/bin/nf && wget https://github.com/projectdiscovery/katana/releases/download/v1.1.3/katana_1.1.3_linux_amd64.zip -O katana.zip;unzip katana.zip;sudo chmod +x katana;sudo mv katana /usr/bin && pipx install uro;rm katana.zip;wget https://github.com/lc/gau/releases/download/v2.2.4/gau_2.2.4_linux_amd64.tar.gz -O gau.zip;tar -xvf gau.zip;sudo chmod +x gau;sudo mv gau /usr/bin/GAU;rm gau.zip;go install github.com/hakluke/hakrawler@latest;go install github.com/tomnomnom/waybackurls@latest;go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest;go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

echo "NucleiFuzzer Instalado."
echo "[+] - EXECUTE nf -h para mais detalhes."
#nf -h

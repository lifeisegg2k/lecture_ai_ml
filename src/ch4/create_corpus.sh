#!/bin/sh
# Running inside docker

# jawiki-latest-pages-articles.xml.bz2 のサイズが 3.2GB で思ったより大きいなのでご注意 
# curl https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2 -o jawiki-latest-pages-articles.xml.bz2
# bzip2 -d jawiki-latest-pages-articles.xml.bz2
# "jawiki-latest-pages-articles6.xml-p4307948p4357985.bz2 のサイズが 24,895,261B なのでこれを使用
echo "Wikipedia 全文データダウンロードと展開"
curl https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles6.xml-p4307948p4357985.bz2 -o jawiki-latest-pages-articles6.xml-p4307948p4357985.bz2 
bzip2 -d jawiki-latest-pages-articles6.xml-p4307948p4357985.bz2 

echo "wp2txt をインストール（required Ruby）"
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
apt-get install -y ruby2.5 ruby2.5-dev build-essential dh-autoreconf
gem install wp2txt

echo "wp2txt を使って XML ファイルをテキストファイルに変換"
# wp2txt --input-file ./jawiki-latest-pages-articles.xml
wp2txt --input-file ./jawiki-latest-pages-articles6.xml-p4307948p4357985

echo "分析されたテキストファイルを１つにまとめる"
cat jawiki-latest-pages-articles6-* > wiki.wp2txt

echo "１つにまとめたテキストファイルを MeCab を使って分かち書きにする"
mecab -b 100000 -Owakati wiki.wp2txt -o wiki_wakati.txt
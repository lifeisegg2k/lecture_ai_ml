# lecture_ai_ml

[![SonarCloud](https://sonarcloud.io/images/project_badges/sonarcloud-white.svg)](https://sonarcloud.io/dashboard?id=lifeisegg2k_lecture_ai_ml)

[Python による AI・機械学習・深層学習アプリのつくり方](https://www.amazon.co.jp/%E3%81%99%E3%81%90%E3%81%AB%E4%BD%BF%E3%81%88%E3%82%8B-%E6%A5%AD%E5%8B%99%E3%81%A7%E5%AE%9F%E8%B7%B5%E3%81%A7%E3%81%8D%E3%82%8B-Python%E3%81%AB%E3%82%88%E3%82%8BAI%E3%83%BB%E6%A9%9F%E6%A2%B0%E5%AD%A6%E7%BF%92%E3%83%BB%E6%B7%B1%E5%B1%A4%E5%AD%A6%E7%BF%92%E3%82%A2%E3%83%97%E3%83%AA%E3%81%AE%E3%81%A4%E3%81%8F%E3%82%8A%E6%96%B9-TensorFlow2%E5%AF%BE%E5%BF%9C-%E3%82%AF%E3%82%B8%E3%83%A9%E9%A3%9B%E8%A1%8C%E6%9C%BA/dp/4802612796/ref=sr_1_1?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&dchild=1&keywords=Python%E3%81%AB%E3%82%88%E3%82%8B+AI%E3%83%BB%E6%A9%9F%E6%A2%B0%E5%AD%A6%E7%BF%92%E3%83%BB%E6%B7%B1%E5%B1%A4%E5%AD%A6%E7%BF%92%E3%82%A2%E3%83%97%E3%83%AA%E3%81%AE%E3%81%A4%E3%81%8F%E3%82%8A%E6%96%B9&qid=1617607329&s=books&sr=1-1)を学習する

## env

本では、Vargrant を利用するが、ここでは、 Docker を利用する

- Dockerfile\
  continuumio/anaconda3:2020.11 を利用して、 ç を起動
- docker-compose.yml
- run_jn.sh\
  jupyter notebook docker 実行 shell
- mojibake.ipynb\
  日本語文字化け物の場合使用

## chapter

- src/ # source
  - ch2 # 機械学習入門
  - ch3 # OpenCV と機械学習・画像・動画入門
- data/ # work data
- images/ # work images

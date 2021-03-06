FROM continuumio/anaconda3:2020.11

RUN apt-get update \
    && apt-get install -y curl git sudo cron \
    python3 python3-pip unzip \
    libgl1-mesa-dev graphviz \
    mecab libmecab-dev mecab-ipadic-utf8 \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/taku910/mecab.git
WORKDIR /opt/mecab/mecab
RUN ./configure  --enable-utf8-only \
    && make \
    && make check \
    && make install \
    && ldconfig

WORKDIR /opt/mecab/mecab-ipadic
RUN ./configure --with-charset=utf8 \
    && make \
    &&make install

WORKDIR /opt
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
WORKDIR /opt/mecab-ipadic-neologd
RUN ./bin/install-mecab-ipadic-neologd -n -y

RUN pip install --upgrade pip 

WORKDIR /data

COPY . .

RUN pip install -r requirements.txt
# RUN conda install -c conda-forge gensim

EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/data"]

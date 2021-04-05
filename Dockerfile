FROM continuumio/anaconda3:2020.11

RUN pip install --upgrade pip 

WORKDIR /data

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/data"]

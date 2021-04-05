docker run -it -p 8888:8888 -v $(pwd)/data:/data --rm continuumio/anaconda3 bash -c 'jupyter notebook --notebook-dir=/data/notebooks --ip=0.0.0.0 --port=8888 --no-browser --allow-root'

FROM ubuntu
COPY requirements.txt /tmp/requirements.txt
COPY . /opt/
# 对于低版本的fastdfs，例如6.0.x以及所有的5.x版本，都要把libserverframe相关命令注释掉，老版本不需要这个包
RUN apt-get update -y \
  && apt-get install git gcc make python3 python3-pip -y \
  && cd /opt && git clone https://github.com/happyfish100/libfastcommon.git \
  && cd libfastcommon; git checkout V1.0.43 \
  && cd /opt &&  git clone https://github.com/happyfish100/fastdfs.git \
  && cd fastdfs; git checkout V5.11 \
  && cd /opt/libfastcommon \
  && ./make.sh clean && ./make.sh && ./make.sh install \
  && cd /opt/fastdfs \
  && ./make.sh clean && ./make.sh && ./make.sh install \
  && cp conf/client.conf /etc/fdfs/ \
  && sed -i 's#base_path.*=.*#base_path=/tmp#g' /etc/fdfs/client.conf \
  && pip3 install  --break-system-packages -r /tmp/requirements.txt \
  && apt-get clean \
  && rm -rf /opt/libfastcommon \
  && rm -rf /opt/fastdfs

WORKDIR /opt
EXPOSE 9018
CMD ["gunicorn", "--workers=4", "src.wsgi:app", "-b 0.0.0.0:9018"]

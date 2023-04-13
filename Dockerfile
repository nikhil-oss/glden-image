FROM amazonlinux:latest
RUN yum update -y
#RUN yum install -y amazon-linux-extras
#RUN amazon-linux-extras enable postgresql10
#RUN yum search "postgres"
RUN yum install postgresql15 -y
#RUN yum install postgresql13 -y
RUN yum install postgresql-devel -y
RUN yum install postgresql-libs -y
RUN yum install -y httpd httpd-tools httpd-devel tar mod_ssl openssl wget mod_ssl openssl openssl-devel
RUN yum install -y gcc gcc-c++ freetype-devel yum-utils findutils
RUN yum groupinstall "Development tools" -y
RUN yum -y install bzip2-devel libffi-devel xz-devel
RUN curl https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz | tar -xJ \
    && cd Python-3.10.0 \
    && ./configure --prefix=/usr/local --enable-shared \
    && make \
    && make install \
    && cd .. \
    && rm -rf Python-3.10.0
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
RUN pip3.10 install pip
#RUN python3.10 -m pip install pip==21.3.1
#RUN python3.10 -m pip --version
#RUN python3.10 -m pip install --upgrade pip setuptools wheel
RUN python3.10 -m ensurepip --upgrade
RUN pip3.10 install numpy==1.22.4
#RUN pip3.10 install psycopg2-binary
#COPY ./requiremts.txt requirements.txt
#COPY ./requirements.txt requirements.txt
#COPY ./baserequirments.txt requirements.txt
#RUN pip3.10 install -r requirements.txt

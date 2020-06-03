#基于的基础镜像
FROM python:3.6.10-alpine3.11

ENV TZ=Asia/Shanghai

RUN apk update \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" > /etc/timezone

#代码添加到code文件夹
RUN mkdir /code
ADD ./* /code/

#为了print能输出信息
ENV PYTHONUNBUFFERED=1

# 设置code文件夹是工作目录
WORKDIR /code

# 安装支持
#RUN pip3 install -r requirements.txt

CMD ["bash"]
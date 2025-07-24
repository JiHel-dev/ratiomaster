FROM python:3.7

LABEL maintainer=JiHel-dev

USER root

WORKDIR /app
RUN git clone --depth 1 https://github.com/JiHel-dev/Ratio.py.git
RUN pip install -r Ratio.py/requirements.txt
COPY ./scripts/scheduler.sh /app/
COPY ./scripts/sendRandom.sh /app/
COPY ./scripts/torrentSize.py /app/
RUN pip install bencodepy
COPY ./confs/conf.json* /app/
RUN chown nobody /app

USER nobody

WORKDIR /app
ENTRYPOINT [ "/app/sendRandom.sh" ]

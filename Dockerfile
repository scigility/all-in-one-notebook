FROM jupyter/all-spark-notebook

LABEL maintainer="Scigility <contact@scigility.com>"

USER root

# install sbt
ENV SBT_VERSION=1.3.12
RUN curl -sL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local \
    && ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt \
    && chmod 0755 /usr/local/bin/sbt

# make spark executables directly available
RUN ln -s /usr/local/spark/bin/pyspark /usr/local/bin/pyspark
RUN ln -s /usr/local/spark/bin/spark-shell /usr/local/bin/spark-shell
RUN ln -s /usr/local/spark/bin/sparkR /usr/local/bin/sparkR
RUN ln -s /usr/local/spark/bin/spark-submit /usr/local/bin/spark-submit

USER $NB_UID

RUN mv /home/jovyan/work /home/jovyan/academy-workspace

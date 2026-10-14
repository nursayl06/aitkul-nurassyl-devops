FROM python:3.12-slim

WORKDIR /app

COPY app/app.py /app/app.py
COPY Aitkul_Nurassyl_info.txt /app/

RUN echo "Building image for Aitkul Nurassyl" && mkdir -p /app/logs

ENV STUDENT_NAME=Nurassyl \
    STUDENT_SURNAME=Aitkul \
    STUDENT_GROUP=IT2-2307 \
    STUDENT_ID=37375 \
    APP_PORT=5000

EXPOSE 5000

CMD ["python", "app.py"]

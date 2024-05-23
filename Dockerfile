ARG PYTHON_VERSION=3.9

FROM python:${PYTHON_VERSION}

COPY ./main.py /

ENV STUDENT_ID=2019311004

RUN apt update -y
RUN pip3 install --no-cache-dir fastapi==0.110.3
RUN pip3 install --no-cache-dir 'uvicorn[standard]'

RUN mkdir /workspace/
COPY . /workspace/

ENTRYPOINT ["uvicorn"]
CMD ["--host=0.0.0.0","--port=80","main:app"]

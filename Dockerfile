FROM python:2.7-alpine
EXPOSE 8080
RUN echo "Flask==0.12.2" > /requirements.txt
RUN pip install -r /requirements.txt
RUN sed -i "s/hdr.encode('ascii')/hdr/g" /usr/local/lib/python2.7/site-packages/werkzeug/serving.py
ADD tacos.py /
RUN adduser -D -u 1234 python
USER python
CMD [ "python", "/tacos.py" ]

FROM python:2.7-alpine
EXPOSE 5000
RUN echo "Flask==0.12.2" > /requirements.txt
RUN pip install -r /requirements.txt
RUN sed -i "s/hdr.encode('ascii')/hdr/g" /usr/local/lib/python2.7/site-packages/werkzeug/serving.py
RUN echo "ZnJvbSBmbGFzayBpbXBvcnQgRmxhc2sKYXBwID0gRmxhc2soX19uYW1lX18pCgoKQGFwcC5yb3V0ZSgnLycpCmRlZiBoZWxsbygpOgogICAgcmV0dXJuICc8aW1nIHNyYz0iaHR0cHM6Ly9pLmltZ3VyLmNvbS9NSzhKNFBQLmdpZiI+PGlmcmFtZSBzdHlsZT0id2lkdGg6MDtoZWlnaHQ6MDtib3JkZXI6MDsgYm9yZGVyOm5vbmU7IiB3aWR0aD0iNjQwIiBoZWlnaHQ9IjM2MCIgc3JjPSJodHRwczovL3d3dy55b3V0dWJlLmNvbS9lbWJlZC9lQjV0S3RSZFdOMD9yZWw9MCZhdXRvcGxheT0xIiBmcmFtZWJvcmRlcj0iMCIgZ2VzdHVyZT0ibWVkaWEiIGFsbG93PSJlbmNyeXB0ZWQtbWVkaWEiIGFsbG93ZnVsbHNjcmVlbj48L2lmcmFtZT4nLCAiODE5IEJhZCBUYWNvISBceGYwXHg5Zlx4OGNceGFlICYjeDFmMzJlOyIKCmlmIF9fbmFtZV9fID09ICdfX21haW5fXyc6CiAgICBhcHAucnVuKGhvc3Q9IjAuMC4wLjAiKQo=" | base64 -d > /tacos.py
RUN cat tacos.py
RUN adduser -D -u 1234 python
USER python
CMD [ "python", "/tacos.py" ]

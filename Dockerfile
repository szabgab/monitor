FROM python:3.12
COPY . /opt/
RUN uv sync
ENTRYPOINT ["uv", "run", "monitor.py"]

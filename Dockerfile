FROM python:3.12
COPY . /opt/
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN uv sync
ENTRYPOINT ["uv", "run", "monitor.py"]

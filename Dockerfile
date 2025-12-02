FROM python:3.12
WORKDIR /opt/
COPY . /opt/
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN /root/.local/bin/uv sync
ENTRYPOINT ["/root/.local/bin/uv", "run", "/opt/monitor.py"]

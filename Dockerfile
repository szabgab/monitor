FROM python:3.12
COPY . /opt/
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN /root/.local/bin/uv sync
ENTRYPOINT ["/root/.local/bin/uv", "run", "monitor.py"]

FROM python:3.6-slim

WORKDIR /servo

# Install dependencies
RUN pip3 install requests PyYAML python-dateutil

# Install servo
ADD https://github.com/opsani/servo/raw/master/servo \
    https://github.com/opsani/servo/raw/master/adjust.py \
    https://github.com/opsani/servo/raw/master/measure.py \
    https://github.com/opsani/servo-stub/raw/master/adjust \
    https://github.com/opsani/servo-newrelic/raw/master/measure \
    /servo/

RUN chmod a+rwx /servo/adjust /servo/measure /servo/servo

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python3", "servo" ]

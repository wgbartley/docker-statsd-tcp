#!/bin/bash

sudo docker run -d \
	--name=StatsD-TCP \
	-e CARBON_HOST=10.11.11.137 \
	-e CARBON_PORT=2003 \
	-e STATSD_PORT=8125 \
	-e STATSD_FLUSH_INTERVAL=10000 \
	-e STATSD_MGMT_PORT=8126 \
	-h statsd-tcp \
	-p 8125:8125 \
	-p 8126 \
	wgbartley/statsd-tcp /bin/bash

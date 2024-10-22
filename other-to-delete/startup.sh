#!/bin/bash

echo "Setting up custo supervisord.conf..."
mv /etc/supervisord.conf /etc/supervisord.conf.bak
mv /etc/supervisord.custom.conf /etc/supervisord.conf
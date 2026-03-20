#!/usr/bin/env bash
swaync-client -swb | sed --unbuffered -E 's/"text": "([1-9][0-9]*)"/"text": " \1"/g; s/"text": "0"/"text": ""/g'

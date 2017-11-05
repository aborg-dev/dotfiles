#!/bin/bash

TEXT=$@

echo "** TODO "$TEXT >> $INBOX_FILE

echo Added task \"$TEXT\"

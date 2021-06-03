#!/bin/bash

exec 1> index.html

# System information program

TITLE="System Information Report for $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")

report_numberCPU () {
	cat <<- _EOF_
		<H2>Number CPUs</H2>
		<PRE>$(nproc)</PRE)
	_EOF_
	return
}

report_memory () {
	cat <<- _EOF_
		<H2>Memory info:</H2>
		<PRE>$(free -m)</PRE>
	_EOF_
	return
}

report_HDD () {
	cat <<- _EOF_
		<H2>HDD info:</H2>
		<PRE>$(df -h)</PRE>
	_EOF_
	return
}

write_html_page () {
	cat <<- _EOF_
	<HTML>
		<HEAD>
			<TITLE>$TITLE</TITLE>
		</HEAD>
		<BODY>
			<H1>$TITLE</H1>
			$(report_numberCPU)
			$(report_memory)
			$(report_HDD)
		</BODY>
	</HTML>
	_EOF_
	return
}

# Building HTML-page

write_html_page


FROM balenalib/raspberry-pi-alpine:3.8

RUN apk add --update --no-cache bluez pulseaudio pulseaudio-bluez espeak libffi-dev dbus-dev glib-dev build-base py2-pip python2-dev cairo-dev gobject-introspection-dev alsa-lib-dev

RUN pip install cffi configparser dbus-python PyGObject pyalsaaudio

RUN addgroup pulse
RUN adduser pulse -G audio -G pulse -Ds /bin/sh

COPY bt_speaker.py /usr/local/bin/bt_speaker
COPY librtpsbc.so /usr/local/bin/librtpsbc.so
COPY entrypoint.sh /usr/local/bin/
COPY bt_manager /usr/lib/python2.7/site-packages/bt_manager
COPY codecs /usr/local/include/rtpsbc
COPY config.ini.default /etc/bt_speaker/config.ini

ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

CMD entrypoint.sh

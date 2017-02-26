FROM bblfsh/rust-driver-build

ADD build /opt/driver/bin
CMD /opt/driver/bin/driver

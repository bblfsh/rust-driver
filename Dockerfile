FROM bblfsh/rust-driver-build

ENV LD_LIBRARY_PATH /root/.rustup/toolchains/$VERSION-x86_64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH

ADD native/target /opt/driver/native/target/
CMD /opt/driver/native/target/release/rust-parser

FROM bblfsh/rust-driver-build

ENV LD_LIBRARY_PATH /root/.rustup/toolchains/$RUNTIME_NATIVE_VERSION-x86_64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH

ADD native/target/release/rust-parser /opt/driver/bin/native
CMD /opt/driver/bin/native

FROM ubuntu:22.04 as build

RUN set -ex && \
    apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libevent-dev && \
    apt-get install -y libpcap-dev && \
    apt-get install -y libsodium-dev && \
    apt-get install -y libssl-dev && \
    apt-get install -y g++ && \
    apt-get install -y llvm && \
    apt-get install -y make && \
    apt-get install -y cmake && \
    apt-get install -y git && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && git clone https://github.com/muink/Pcap_DNSProxy.git && cd Pcap_DNSProxy/Source/Auxiliary/Scripts && chmod +x CMake_Build.sh && ./CMake_Build.sh

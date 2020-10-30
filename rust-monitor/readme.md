# serves cpu temps as a rest service

# deps: rust and cargo setup

# installation
cargo build --release
* move target/rust-monitor.exe to somewhere readonly
* use windows task scheduler to run on machine startup
  * ensure the process is run as unpriveledged user (i.e User)


# TODO
create powershell install script

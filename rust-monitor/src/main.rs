use std::io::{BufRead, BufReader, Error};
use std::process::{Command, Stdio, ChildStdout};
use std::thread;


fn start_data_stream() -> ChildStdout {
    let mut child = Command::new("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe")
        .args(&[ 
            "--query-gpu=temperature.gpu,utilization.gpu", 
            "--format=csv", 
            "-l", "5" ])
        .stdout(Stdio::piped())
        .spawn()
        .expect("error occurred");

    return child.stdout.take().unwrap();
}


fn main() -> Result<(), Error> {
    let stdout = start_data_stream();
    let child = thread::spawn(move || {
        let data_stream = BufReader::new(stdout);
        // some work here
        data_stream.lines()
            .filter_map(|line| line.ok())
            .for_each(|line| println!("{}", line));
    });
    
    println!("hello");

    let _res = child.join();
    Ok(())
}

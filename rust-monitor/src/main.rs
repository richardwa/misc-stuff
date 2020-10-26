use std::io::{BufRead, BufReader, Error};
use std::process::{Command, Stdio, ChildStdout};
use std::thread;
use std::net::{TcpStream, TcpListener};
use std::io::prelude::*;
use std::sync::{Arc,Mutex};
use ringbuf::{Producer,Consumer, RingBuffer};
    



fn start_data_stream(mut prod:Producer<Data>, mut cons:Arc<Mutex<Consumer<Data>>>) {
    
    let mut child = Command::new("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe")
        .args(&[ 
            "--query-gpu=temperature.gpu,utilization.gpu", 
            "--format=csv", 
            "-l", "5" ])
        .stdout(Stdio::piped())
        .spawn()
        .expect("error occurred");

    let stdout = child.stdout.take().unwrap();

    thread::spawn(move || {
        let data_stream = BufReader::new(stdout);
        // some work here
        data_stream.lines()
            .skip(1) // skip header row
            .filter_map(|line| line.ok())
            .for_each(|line| {
                let mut data: Data = Data {
                    temp: -1,
                    utilization: -1
                };
                let a: Vec<&str> = line.split(",").collect();
                data.temp = a[0].trim().parse().unwrap_or(-1);
                let len = a[1].chars().count() - 2;
                let s:&str = &a[1][..len];
                data.utilization = s.trim().parse().unwrap_or(-1);
                println!("{},{}", data.temp, data.utilization);
                if (prod.is_full()){
                    cons.lock().unwrap().pop();
                }
                prod.push(data);
            });
    });
}

fn start_service(cons:Arc<Mutex<Consumer<Data>>>){
    let listener = TcpListener::bind("0.0.0.0:7878").unwrap();

    for stream in listener.incoming() {
        let mut stream = stream.unwrap();
        let mut buffer = [0; 1024];
        stream.read(&mut buffer).unwrap();

        let header = "HTTP/1.1 200 OK\r\n\r\n";
        stream.write(header.as_bytes()).unwrap();
        cons.lock().unwrap().for_each(|data| {
            let s = format!("temp: {}, utilization: {} \n", data.temp, data.utilization);
            stream.write(s.as_bytes()).unwrap();
        });
        
        stream.flush().unwrap();
        println!("responded");
    }
}

struct Data {
    temp: i32,
    utilization: i32
}

fn main() -> Result<(), Error> {
    let rb = RingBuffer::<Data>::new(10);
    let (prod,cons) = rb.split();
    let cons1 = Arc::new(Mutex::new(cons));
    let cons2 = Arc::clone(&cons1);
    
    start_data_stream(prod, cons1);
    start_service(cons2);
    Ok(())
}

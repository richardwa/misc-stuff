#![windows_subsystem = "windows"]
use std::io::{BufRead, BufReader, Error};
use std::process::{Command, Stdio };
use std::os::windows::process::CommandExt;
use std::thread;
use std::net::{TcpListener};
use std::io::prelude::*;
use std::sync::{Arc,Mutex};
use std::env;
use ringbuf::{Producer,Consumer, RingBuffer};
    



fn start_data_stream(mut prod:Producer<Data>, cons:Arc<Mutex<Consumer<Data>>>) {
    let mut child = Command::new("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe")
        .args(&[ 
            "--query-gpu=temperature.gpu,utilization.gpu", 
            "--format=csv", 
            "-l", "5" ])
        // https://docs.microsoft.com/en-us/windows/win32/procthread/process-creation-flags#CREATE_NO_WINDOW
        .creation_flags(0x08000000) 
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
                if prod.is_full() {
                    cons.lock().unwrap().pop();
                }
                let _res = prod.push(data);
            });
    });
}

fn start_service(cons:Arc<Mutex<Consumer<Data>>>){
    let args: Vec<String> = env::args().collect();
    let mut port = "7878";
    if args.len() > 1 {
        port = &args[1];
    }

    let url = format!("{}:{}", "0.0.0.0", port);
    println!("binding on: {}", url);
    let listener = TcpListener::bind(url).unwrap();
    for stream in listener.incoming() {
        let do_steps = || -> Result<(), Error> {
            let mut stream = stream?;
            let mut buffer = [0; 1024];
            stream.read(&mut buffer)?;

            let header = "HTTP/1.1 200 OK\r\n\r\n";
            stream.write(header.as_bytes())?;
            cons.lock().unwrap().for_each(|data| {
                let s = format!("temp: {}, utilization: {} \n", data.temp, data.utilization);
                stream.write(s.as_bytes()).unwrap_or(0);
            });
            
            stream.flush()?;
            Ok(())
        };
        
        if let Err(_err) = do_steps(){
            println!("error occurred");
        }else{
            println!("success")
        }
    }
}

struct Data {
    temp: i32,
    utilization: i32
}

fn main() -> Result<(), Error> {
    let rb = RingBuffer::<Data>::new(500);
    let (prod,cons) = rb.split();
    let cons1 = Arc::new(Mutex::new(cons));
    let cons2 = Arc::clone(&cons1);
    
    start_data_stream(prod, cons1);
    start_service(cons2);
    Ok(())
}

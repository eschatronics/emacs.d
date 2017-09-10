// -*- mode:rust;mode:rust-playground -*-
// snippet of code @ 2017-06-18 17:56:59

// === Rust Playground ===
// Execute the snippet with Ctl-Return
// Remove the snippet completely with its dir and all files M-x `rust-playground-rm`

fn main() {

    println!("Results:");

    let mut i : u8 = 0;

    loop {
        i += 1;
        println!(" > {}", i);
        if i == 10 { break };
    }

}

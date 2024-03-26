use std::collections::HashMap;

use tt::{RequestOptions, TTClient, TTStop, TTTrip, TripQuery};
use chrono::Local;


#[tokio::main]
async fn main() {
    println!("Hello, world!");

    let client = TTClient::new("".to_owned(), "".to_owned());

    let trips: Vec<TTTrip> = client.request_opt(Some(RequestOptions::new().query(TripQuery { ty: tt::AreaType::U, route_id: 535, limit: 1, time: Local::now().naive_local() }))).await.unwrap();
    let mut stops = HashMap::<u16, TTStop>::new();
    for s in client
        .request::<TTStop>()
        .await
        .unwrap()
    {
        stops.insert(s.id, s);
    }

    // https://map.project-osrm.org/?z=16&center=50.000050%2C11.998851&loc=50.000043%2C11.998851&loc=49.998181%2C11.989775&hl=en&alt=0&srv=0

    print!("https://map.project-osrm.org/?z=17&center=46.070927%2C11.127037");
    for t in &trips[0].stop_times {
        let s = stops.get(&t.stop).unwrap();
        print!("&loc={}%2C{}", s.lat, s.lng);
    }
    println!("&hl=en&alt=0&srv=0");
}

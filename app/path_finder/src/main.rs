use tt::{TTClient, TTRoute, TTTrip, VecEndpoint};

#[tokio::main]
async fn main() {
    println!("Hello, world!");

    let client = TTClient::new("".to_owned(), "".to_owned());

    let trips = <TTClient as VecEndpoint<TTTrip>>::request(&client, None).await.unwrap();

    for t in trips {
        println!("{}: {}", t.id, t.delay.unwrap_or(0.0));
    }
}

# Bruss
Rust-based web app for visually tracking busses of the city of Trento.
Interactive map for visual tracking of busses, with their trips, the current location and delay.

The data is provided by Trentino Trasporti (TT) using the [bruss_tt](https://github.com/topongo/bruss_tt) crate, 
fetches data from their APIs. The data is processed through the [bruss_grind](https://github.com/topongo/bruss_grind)
tool that interpolates bus routes, provide
schedules and organizes the map data. 

An application is provided for consulting the actual location and delay of each bus, the application components
are:
- **[bruss_api](https://github.com/topongo/bruss_api)**: An API backend written using [rocket](https://rocket.rs/);
- **??**: A frontend written in ??;
- **[bruss_db](https://github.com/topongo/bruss_db)**: [MongoDB](https://mongodb.com) in a docker container;

After some data gathering, an analysis on the gathered data will be done, it will involve the average delay
for every line of busses, based on their location, on the hour of day and the day of the week. This will
maybe help understanding how the delay is generated and how the city traffic affect the public transportation
service.

Project by Lorenzo Bodini, for bachelor degree internship.

# TODOs
## Meta
- [x] Choose a name for the application
- [x] Create repo and project structure

## Structure
- [x] Define components
- [x] Choose programming components

## Components
- [ ] TT Fetcher: [bruss_tt](https://github.com/topongo/bruss_tt) (rust)
- [ ] Grind: [bruss_grind](/topongo/bruss_grind) (rust)
- [ ] App
	- [ ] Frontend: *TBD* 
	- [ ] Backend: [bruss_api](https://github.com/topongo/bruss_api) (rust / rocket)
	- [ ] Database: [bruss_db](https://github.com/topongo/bruss_db) (mongodb)
- [ ] Data Analyzer
	- [ ] Analyzer: *TBD* (rust)
	- [ ] Visualizer: *TBD* (rust / egui?)

## Docs
- [ ] Write inline documentation for all components

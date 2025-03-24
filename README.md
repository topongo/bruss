**DEPRECATED BRANCH**
This branch is part of an abandoned stage of development that aimed to deduce the schedule cadence without success.
Please refer to the `master` branch.

# Bruss
Rust-based web app for visually tracking busses of the city of Trento.
Interactive map for visual tracking of busses, with their trips, the current location and delay.

The data is provided by Trentino Trasporti (TT) using the [bruss_tt](https://github.com/topongo/bruss_tt) crate, 
fetches data from their APIs. The data is processed through the [bruss_router](https://github.com/topongo/bruss_router)
tool that interpolates bus routes, provide
schedules and organizes the map data. 

An application is provided for consulting the actual location and delay of each bus, the application components
are:
- **[bruss_api](https://github.com/topongo/bruss_api)**: An API backend written using [rocket](https://rocket.rs/);
- **[bruss_app](https://github.com/topongo/bruss_app)**: A frontend written in [flutter](https://flutter.dev);
- **[bruss_db](https://github.com/topongo/bruss_db)**: [MongoDB](https://mongodb.com) in a docker container;

After some data gathering, an analysis on the will be done, it will involve the average delay
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
- [x] TT: [bruss_tt](https://github.com/topongo/bruss_tt) (rust)
HTTP client tailored to work with TT APIs, including serialization of the incoming data and a better representation of it.
- [x] Router: [bruss_router](/topongo/bruss_grind) (rust)
Data processor, it uses TT for getting static (like `Area`s and `Stop`s) and dynamic (like `Trip`s) from the official
servers, it then proceeds to process the data, mainly calculating the segments that connect the right stops using a custom
instance of [OSRM](https://project-osrm.org/) (Open Source Routing Machine).
- [x] OSRM: [bruss_osrm](https://github.com/topongo/bruss_osrm)
Docker files and scripts to run a custom instance of OSRM, configured to be able to calculate bus and train paths, that do not
necessarily follow standard traffic rules.
- [ ] App
	- [ ] Frontend: [bruss_app](https://github.com/topongo/bruss_app) (flutter) 
	- [x] Backend: [bruss_api](https://github.com/topongo/bruss_api) (rust / rocket)
	- [x] Database: [bruss_db](https://github.com/topongo/bruss_db) (mongodb)
~~- [ ] Data Analyzer~~
    ~~- [ ] Analyzer: *TBD* (rust)~~
	~~- [ ] Visualizer: *TBD* (rust / egui?)~~

## Docs
- [ ] Write inline documentation for all components

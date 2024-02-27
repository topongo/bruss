# Rusty Busses || Bruss
Rust-based web app for visually tracking busses of the city of Trento.
Interactive map for visual tracking of busses, with their trips, the current location and delay.

The data is provided by Trentino Trasporti (TT) using the [tt_fetcher]() tool, that periodically
fetches data from their APIs. The data is represented using a backend written in rust with the use
of the [rocket](https://rocket.rs/) crate, a frontend written in ?? and a postgres (?) database.

After some data gathering, an analysis will be done based on which

Project by Lorenzo Bodini, for bachelor degree internship.

# TODOs
## Meta
- [ ] Choose a name for the application
- [ ] Create repo and project structure

## Structure
- [x] Define components
- [ ] Choose programming components

## Components
- [ ] TT Fetcher: rust
- [ ] App
	- [ ] Frontend ??
	- [ ] Backend: rust (rocket)
	- [ ] Database: postgres?
- [ ] Data Analyzer
	- [ ] Analyzer rust
	- [ ] Visualizer: rust (egui?)

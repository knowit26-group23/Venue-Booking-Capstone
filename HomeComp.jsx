
import { NavLink, Outlet } from "react-router-dom";

import React from "react";

export default function HomeComp() {
  return (
    <>
     <nav className="navbar navbar-expand-lg app-nav">
      <div className="container-fluid">
        <NavLink className="navbar-brand brand" to="/">VisitMyVenue</NavLink>
         <div className="navbar-nav ms-auto">
           <NavLink className="nav-link" to="/login">Login</NavLink>
           <NavLink className="nav-link" to="/register">Register</NavLink>
           </div>         </div>
      </nav>

      <main className="container">   
      <Outlet />
       </main>
      {/* Hero Section */}
      <section className="bg-primary text-white text-center py-5">
        <div className="container">
          <h1 className="display-4 fw-bold">Find Your Perfect Venue</h1>
          <p className="lead">
            Book Marriage Halls, Banquet Halls, Conference Rooms and Party
            Venues Easily
          </p>

          <div className="row justify-content-center mt-4">
            <div className="col-md-4">
              <input
                type="text"
                className="form-control"
                placeholder="Search Venue..."
              />
            </div>
            <div className="col-md-2">
              <button className="btn btn-warning w-100">
                Search
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* Categories */}
      <section className="container py-5">
        <h2 className="text-center mb-4">Venue Categories</h2>

        <div className="row">
          <div className="col-md-3">
            <div className="card text-center shadow">
              <div className="card-body">
                <h4>Wedding Hall</h4>
                <p>Luxury marriage halls for weddings.</p>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card text-center shadow">
              <div className="card-body">
                <h4>Banquet Hall</h4>
                <p>Perfect for family functions.</p>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card text-center shadow">
              <div className="card-body">
                <h4>Conference Hall</h4>
                <p>Corporate meetings and seminars.</p>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card text-center shadow">
              <div className="card-body">
                <h4>Party Venue</h4>
                <p>Birthday and celebration events.</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Featured Venues */}
      <section className="bg-light py-5">
        <div className="container">
          <h2 className="text-center mb-4">Featured Venues</h2>

          <div className="row">
            <div className="col-md-4">
              <div className="card shadow">
                <img
                  src="https://images.unsplash.com/photo-1519167758481-83f550bb49b3"
                  className="card-img-top"
                  alt="venue"
                />
                <div className="card-body">
                  <h5>Royal Wedding Hall</h5>
                  <p>Capacity: 1000 Guests</p>
                  <button className="btn btn-primary">
                    View Details
                  </button>
                </div>
              </div>
            </div>

            <div className="col-md-4">
              <div className="card shadow">
                <img
                  src="https://images.unsplash.com/photo-1511578314322-379afb476865"
                  className="card-img-top"
                  alt="venue"
                />
                <div className="card-body">
                  <h5>Grand Banquet Hall</h5>
                  <p>Capacity: 500 Guests</p>
                  <button className="btn btn-primary">
                    View Details
                  </button>
                </div>
              </div>
            </div>

            <div className="col-md-4">
              <div className="card shadow">
                <img
                  src="https://images.unsplash.com/photo-1497366811353-6870744d04b2"
                  className="card-img-top"
                  alt="venue"
                />
                <div className="card-body">
                  <h5>Business Conference Center</h5>
                  <p>Capacity: 300 Guests</p>
                  <button className="btn btn-primary">
                    View Details
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* How It Works */}
      <section className="container py-5">
        <h2 className="text-center mb-5">How It Works</h2>

        <div className="row text-center">
          <div className="col-md-4">
            <h3>1. Search</h3>
            <p>Search venues based on location and event type.</p>
          </div>

          <div className="col-md-4">
            <h3>2. Compare</h3>
            <p>Compare prices, facilities and ratings.</p>
          </div>

          <div className="col-md-4">
            <h3>3. Book</h3>
            <p>Confirm your booking online instantly.</p>
          </div>
        </div>
      </section>

      

      {/* Footer */}
      <footer className="bg-secondary text-white text-center p-3">
        <p className="mb-0">
          © 2026 VisitMyVenue | All Rights Reserved
        </p>
      </footer>
    </>
  );
}

import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";

const VenueDetails = () => {
  return (
    <div className="container-fluid mt-3">
      <div className="row">

        {/* Left Sidebar */}
        <div className="col-md-3">
          <div className="card mb-3">
            <div className="card-header bg-dark text-white">
              Venue Filters
            </div>

            <div className="card-body">
              <h6>Budget</h6>
              <input
                type="range"
                className="form-range"
                min="10000"
                max="500000"
              />

              <h6 className="mt-3">Amenities</h6>

              <div className="form-check">
                <input className="form-check-input" type="checkbox" />
                <label className="form-check-label">
                  Parking
                </label>
              </div>

              <div className="form-check">
                <input className="form-check-input" type="checkbox" />
                <label className="form-check-label">
                  Catering
                </label>
              </div>

              <div className="form-check">
                <input className="form-check-input" type="checkbox" />
                <label className="form-check-label">
                  Decoration
                </label>
              </div>
            </div>
          </div>

          {/* Nearby Venues */}
          <div className="card">
            <div className="card-header bg-secondary text-white">
              Similar Venues
            </div>

            <div className="card-body">
              <img
                src="https://images.unsplash.com/photo-1519167758481-83f29c3f4f26"
                className="img-fluid rounded mb-2"
                alt=""
              />
              <p>Royal Banquet Hall</p>

              <img
                src="https://images.unsplash.com/photo-1511795409834-ef04bbd61622"
                className="img-fluid rounded mb-2"
                alt=""
              />
              <p>Grand Wedding Lawn</p>
            </div>
          </div>
        </div>

        {/* Main Content */}
        <div className="col-md-6">

          {/* Image Gallery */}
          <div className="row g-2">
            <div className="col-12">
              <img
                src="https://images.unsplash.com/photo-1519167758481-83f29c3f4f26"
                className="img-fluid rounded"
                alt=""
              />
            </div>

            <div className="col-4">
              <img
                src="https://images.unsplash.com/photo-1511795409834-ef04bbd61622"
                className="img-fluid rounded"
                alt=""
              />
            </div>

            <div className="col-4">
              <img
                src="https://images.unsplash.com/photo-1497366754035-f200968a6e72"
                className="img-fluid rounded"
                alt=""
              />
            </div>

            <div className="col-4">
              <img
                src="https://images.unsplash.com/photo-1464366400600-7168b8af9bc3"
                className="img-fluid rounded"
                alt=""
              />
            </div>
          </div>

          {/* Venue Info */}
          <div className="mt-4">
            <h2>Royal Banquet Hall</h2>

            <p className="text-muted">
              Pune, Maharashtra
            </p>

            <span className="badge bg-success">
              4.8 ★ Rating
            </span>

            <hr />

            <h5>About Venue</h5>

            <p>
              Royal Banquet Hall is a premium venue for weddings,
              receptions, corporate events, birthday parties,
              and social gatherings.
            </p>

            <h5>Highlights</h5>

            <ul>
              <li>500 Guest Capacity</li>
              <li>Parking Available</li>
              <li>In-house Catering</li>
              <li>AC Banquet Hall</li>
              <li>Decoration Services</li>
            </ul>

            <h5>Address</h5>

            <p>
              Karve Nagar, Pune, Maharashtra - 411052
            </p>
          </div>
        </div>

        {/* Booking Panel */}
        <div className="col-md-3">
          <div className="card sticky-top">
            <div className="card-header bg-primary text-white">
              Book This Venue
            </div>

            <div className="card-body">
              <h4 className="text-danger">
                ₹50,000 / Day
              </h4>

              <div className="mb-3">
                <label>Date</label>
                <input
                  type="date"
                  className="form-control"
                />
              </div>

              <div className="mb-3">
                <label>Guests</label>
                <input
                  type="number"
                  className="form-control"
                  placeholder="Enter Guests"
                />
              </div>

              <div className="mb-3">
                <label>Event Type</label>

                <select className="form-select">
                  <option>Wedding</option>
                  <option>Reception</option>
                  <option>Birthday Party</option>
                  <option>Corporate Event</option>
                </select>
              </div>

              <button className="btn btn-danger w-100">
                Book Now
              </button>

              <button className="btn btn-outline-primary w-100 mt-2">
                Contact Vendor
              </button>
            </div>
          </div>
        </div>

      </div>
    </div>
  );
};

export default VenueDetails;
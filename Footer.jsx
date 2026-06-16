import React from "react";

const Footer = () => {
  return (
    <footer className="bg-dark text-light mt-5">
      <div className="container py-4">
        <div className="row">
          
          {/* About */}
          <div className="col-md-4 mb-3">
            <h4>VenueVerse</h4>
            <p>
              showVenue helps you find and book the perfect venue for
              weddings, parties, conferences, and special events.
            </p>
          </div>

          {/* Quick Links */}
          <div className="col-md-4 mb-3">
            <h4>Quick Links</h4>
            <ul className="list-unstyled">
              <li>
                <a href="/" className="text-light text-decoration-none">
                  Home
                </a>
              </li>
              <li>
                <a href="/searchvenue" className="text-light text-decoration-none">
                  Venues
                </a>
              </li>
              <li>
                <a href="/mybookings" className="text-light text-decoration-none">
                  My Bookings
                </a>
              </li>
              <li>
                <a href="/contact" className="text-light text-decoration-none">
                  Contact Us
                </a>
              </li>
            </ul>
          </div>

          {/* Contact */}
          <div className="col-md-4 mb-3">
            <h4>Contact Us</h4>
            <p>Email: support@showvenue.com</p>
            <p>Phone: +91 7890123455</p>
            <p>Pune, Maharashtra</p>
          </div>

        </div>

        <hr />

        <div className="text-center">
          <p className="mb-0">
            © 2026 snowVenue. All Rights Reserved.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
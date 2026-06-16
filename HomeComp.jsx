import { NavLink,Outlet } from "react-router-dom"

import VenueCard from './VenueCard';
import Footer from './Footer';
import Navbar from "../Component/Navbar";
const HomeComp = () => {
  const venues = [
    {
      id: 1,
      name: "Royal Banquet Hall",
      location: "Pune",
      price: "₹50,000",
      image:
        "https://images.unsplash.com/photo-1519167758481-83f29c3f4f26",
    },
    {
      id: 2,
      name: "Grand Wedding Lawn",
      location: "Mumbai",
      price: "₹75,000",
      image:
        "https://images.unsplash.com/photo-1511795409834-ef04bbd61622",
    },
    {
      id: 3,
      name: "Conference Center",
      location: "Bangalore",
      price: "₹25,000",
      image:
        "https://images.unsplash.com/photo-1497366754035-f200968a6e72",
    },
  ];

  return (
    <>
<Navbar/>

      {/* Hero Section */}
      <section className="hero">
        <div className="hero-content">
          <h1>Find Your Perfect Venue</h1>
          <p>
            Book wedding halls, conference rooms, party venues and more.
          </p>

          <div className="search-box">
            <input
              type="text"
              placeholder="Search by city or venue name"
            />
            <button>Search</button>
          </div>
        </div>
      </section>

      {/* Featured Venues */}
      <section className="featured">
        <h2>Featured Venues</h2>

        <div className="venue-grid">
          {venues.map((venue) => (
            <VenueCard key={venue.id} venue={venue} />
          ))}
        </div>
      </section>

      {/* Services */}
      <section className="services">
        <h2>Why Choose Us?</h2>

        <div className="service-container">
          <div className="service-card">
            <h3>Easy Booking</h3>
            <p>Book venues online in just a few clicks.</p>
          </div>

          <div className="service-card">
            <h3>Verified Venues</h3>
            <p>All venues are verified and trusted.</p>
          </div>

          <div className="service-card">
            <h3>Best Prices</h3>
            <p>Get affordable and transparent pricing.</p>
          </div>
        </div>
      </section>

      {/* Testimonials */}
      <section className="testimonials">
        <h2>Customer Reviews</h2>

        <div className="testimonial-card">
          <p>
            "Excellent platform! Found the perfect wedding hall in minutes."
          </p>
          <h4>- Priya Sharma</h4>
        </div>

        <div className="testimonial-card">
          <p>
            "Easy booking process and great customer support."
          </p>
          <h4>- Rahul Patil</h4>
        </div>
      </section>

      <Footer />
    </>
  );
};

export default HomeComp;
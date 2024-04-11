import React, { useState } from 'react';

export default function UpNAv() {
    const [isOpen, setIsOpen] = useState(false);
  return (
    <>
    {/* Desktop Header */}
    <header className="w-full items-center bg-white py-2 px-6 hidden sm:flex">
        <div className="w-1/2"></div>
        <div className="relative w-1/2 flex justify-end">
          <button
            onClick={() => setIsOpen(!isOpen)}
            className="relative z-10 w-12 h-12 rounded-full overflow-hidden border-4 border-gray-400 hover:border-gray-300 focus:border-gray-300 focus:outline-none"
          >
            <img src="https://source.unsplash.com/uJ8LNVCBjFQ/400x400" alt="User" />
          </button>
          {isOpen && <div className="absolute w-32 bg-white rounded-lg shadow-lg py-2 mt-16">
            <a href="#" className="block px-4 py-2 account-link hover:text-white">Account</a>
            <a href="#" className="block px-4 py-2 account-link hover:text-white">Support</a>
            <a href="#" className="block px-4 py-2 account-link hover:text-white">Sign Out</a>
          </div>}
        </div>
      </header>

      {/* Mobile Header & Nav */}
      <header className="w-full bg-sidebar py-5 px-6 sm:hidden">
        <div className="flex items-center justify-between">
          <a href="index.html" className="text-white text-3xl font-semibold uppercase hover:text-gray-300">Admin</a>
          <button onClick={() => setIsOpen(!isOpen)} className="text-white text-3xl focus:outline-none">
            <i className={!isOpen ? "fas fa-bars" : "fas fa-times"}></i>
          </button>
        </div>

        {/* Dropdown Nav */}
        <nav className={isOpen ? 'flex flex-col pt-4' : 'hidden'}>
          {/* Nav items */}
        </nav>
        {/* <button className="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center">
          <i className="fas fa-plus mr-3"></i> New Report
        </button> */}
      </header>
    </>
  )
}

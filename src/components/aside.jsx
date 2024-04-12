import React from 'react'

export default function Aside() {
  return (
    <aside className="relative bg-sidebar h-screen w-64 hidden sm:block shadow-xl">
        <div className="p-6">
            <a href="/" className="text-white text-3xl font-semibold uppercase hover:text-gray-300">Admin</a>
            <a href="/comments/new">
            <button className="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center">
                <i className="fas fa-plus mr-3"></i> New Comment
            </button>
            </a>
        </div>
        <nav className="text-white text-base font-semibold pt-3">
            <a href="/" className="flex items-center  text-white py-4 pl-6 nav-item">
                <i className="fas fa-tachometer-alt mr-3"></i>
                Dashboard
            </a>
            <a href="/earthquakes/1" className="flex items-center text-white py-4 pl-6 nav-item">
                <i className="fas fa-filter mr-3"></i>
                Filtered Table
            </a>
        </nav>
        <a href="#" className="absolute w-full upgrade-btn bottom-0 active-nav-link text-white flex items-center justify-center py-4">
            <i className="fas fa-arrow-circle-up mr-3"></i>
            Upgrade to Pro!
        </a>
    </aside>
  )
}

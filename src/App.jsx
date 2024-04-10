import React from 'react'
import Aside from './components/aside'
import MainContent from './components/MainContent'

export default function App() {
  return (
    <div className='bg-gray-100 font-family-karla flex'>
      <Aside/>
       <MainContent/> 
    </div>
  )
}

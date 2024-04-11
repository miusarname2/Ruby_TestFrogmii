import React from 'react'
import Aside from './components/aside'
import Table from './components/FilteredTable'

export default function App() {
  return (
    <div className='bg-gray-100 font-family-karla flex'>
      <Aside/>
      <Table/>
    </div>
  )
}

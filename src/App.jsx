import React from 'react'
import Aside from './components/aside'
import Tables from './components/FilteredTable'
import Comment from './components/CommentForm'
import Main from './components/MainContent'


export default function App() {
  return (
    <div className='bg-gray-100 font-family-karla flex'>
      <Aside/>
      <Comment/>
    </div>
  )
}

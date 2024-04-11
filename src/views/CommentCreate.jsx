import React from 'react'
import FormComment from '../components/CommentForm'
import Aside from '../components/aside'

export default function CommentCreate() {
  return (
    <div className='bg-gray-100 font-family-karla flex'>
      <Aside/>
      <FormComment/>
    </div>
  )
}

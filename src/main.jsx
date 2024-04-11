import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import Comment from './views/CommentCreate.jsx'
import Main from './views/MainView.jsx'
import './index.css'
import { createBrowserRouter, RouterProvider } from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/test",
    element: <App />
  },
  {
    path:"/comment",
    element:<Comment/>
  },
  {
    path:'/',
    element:<Main/>
  }
])

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
     <RouterProvider router={router} />
  </React.StrictMode>,
)

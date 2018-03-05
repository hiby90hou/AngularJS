import React from 'react'

// putting html to your js -jsx
export default function Like(props){
  return <div>
  like <span>{props.count}</span>
  hate <span>{props.hate}</span></div>
}

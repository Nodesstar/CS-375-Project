import React, { Component } from 'react'

class Ingredients extends React.Component {
    render ()
    return (
        <div className="container">
          <Table characterData={characters} />
        </div>
      )
}

const Menu = () => {
    return (
        <input type="checkbox" name="eggs" value="eggs">
        <input type="checkbox" name="pasta" value="pasta">
        <input type="checkbox" name="pecorino" value="pecorino">
        <input type="checkbox" name="pepper" value="pepper">
        <input type="checkbox" name="bacon" value="bacon"></input>
    )
}


export default Ingredients
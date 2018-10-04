import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';
Nav
class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        {/* Links here */}
        <NavLink eaxact to="/red" >Red</NavLink>
        <NavLink to="/red/yellow" >Add Yellow</NavLink>
        <NavLink to="/red/orange" >Add Orange</NavLink>

        {/* Routes here */}
        <Route path="/red/yellow" component={Yellow} />
        <Route path="/red/orange" component={Orange} />
      </div>
    );
  }
};

export default Red;

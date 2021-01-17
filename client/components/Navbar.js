import React, { useState } from 'react';
import classes from '../styles/Components.module.css';
import NextLink from 'next/link';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'; // Import the FontAwesomeIcon component
import {
  faBars,
  faCompactDisc,
  faTimes,
} from '@fortawesome/free-solid-svg-icons';

export default function Navbar() {
  const [toggle, setToggle] = useState(true);
  return (
    <header className={classes.navbar}>
      <div className={classes.navContainer}>
        <div className={`${classes.brand} ${classes.navLink}`}>
          Tom's Vinyl <FontAwesomeIcon icon={faCompactDisc} />
        </div>

        <div className={classes.navMenu} onClick={() => setToggle(!toggle)}>
          {toggle ? (
            <FontAwesomeIcon icon={faBars} />
          ) : (
            <FontAwesomeIcon icon={faTimes} />
          )}
        </div>

        <nav className={`${classes.navLinks} ${toggle ? '' : classes.isOpen}`}>
          <NextLink href="/artists">
            <div className={classes.navLink}>Artists</div>
          </NextLink>
          <NextLink href="/albums">
            <div className={classes.navLink}>Albums</div>
          </NextLink>
          <NextLink href="/login">
            <div className={classes.navLink}>Login</div>
          </NextLink>
          <NextLink href="/register">
            <div className={classes.navLink}>Signup</div>
          </NextLink>
        </nav>
      </div>
    </header>
  );
}

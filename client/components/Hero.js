import React from 'react';
import classes from '../styles/Components.module.css';

export default function Hero() {
  return (
    <section className={classes.hero}>
      <div>
        <h1>Welcome to Tom's Vinyl</h1>
        <h3>Best place for rock records</h3>
      </div>
    </section>
  );
}

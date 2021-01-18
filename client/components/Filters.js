import React, { useState } from 'react';
import classes from '../styles/Product.module.css';

export default function Filters({ setOrder, setColumn }) {
  const state = {
    column: ['artist', 'title', 'price', 'release_date'],
    order: ['ASC', 'DESC'],
  };
  return (
    <div className={classes.filters}>
      <span>Sort by: </span>
      <select
        onChange={(e) => {
          setColumn(state.column[e.target.value[0]]);
          setOrder(state.order[e.target.value[1]]);
        }}
      >
        <option value="00">Artist: A-Z</option>
        <option value="01">Artist: Z-A</option>
        <option value="10">Title: A-Z</option>
        <option value="11">Title: Z-A</option>
        <option value="20">Price: Lowest</option>
        <option value="21">Price: Highest</option>
        <option value="30">Oldest</option>
        <option value="31">Newest</option>
      </select>
    </div>
  );
}
